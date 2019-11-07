# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls
_pkgname=MbedTLS
pkgver=0.7.0
pkgrel=1
pkgdesc='Wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaWeb/MbedTLS.jl
license=(MIT)
depends=(julia julia-binaryprovider julia-compat julia-loadpath mbedtls)
makedepends=(julia-distrohelper)

_commit=0a75c48ef01672cb1cc3405b2b95ba9f93f4a87e
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml
        'disable-test-logsecrets.patch')
sha256sums=('485450278f3c722806d171ff0ebc9deff98d0286d707d0c1e08face6e67c75c3'
            '4cf31ea674eae673e49089fcf3eb91b550d986c06fcb0484039ce3e3684fd8a2'
            '04d846b75adf0693bf0cda4db3339bb419ac0a338c90dcbd2ac79c1966fb0091'
            'e91cc1ad5c3be31034e9c13a4dfaaf8c80cd0ef19cb7705bfcb377e7237d41cc'
            'b6a539c928f02bec79734c6edf45d2a83ab169a696b0591344296615d46d8e1b')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project

	cd $_pkgname.jl-$pkgver

	# Test currently fails
	patch -Np1 -i ../disable-test-logsecrets.patch

	cat >deps/deps.jl << 'EOF'
if isdefined((@static VERSION < v"0.7.0-DEV.484" ? current_module() : @__MODULE__), :Compat)
    import Compat.Libdl
elseif VERSION >= v"0.7.0-DEV.3382"
    import Libdl
end
const libmbedcrypto = "/usr/lib/libmbedcrypto.so"
const libmbedtls = "/usr/lib/libmbedtls.so"
const libmbedx509 = "/usr/lib/libmbedx509.so"
function check_deps()
    global libmbedcrypto
    if !isfile(libmbedcrypto)
        error("$(libmbedcrypto) does not exist, please report an issue with this PKGBUILD.")
    end

    if Libdl.dlopen_e(libmbedcrypto) == C_NULL
        error("$(libmbedcrypto) cannot be opened, please report an issue with this PKGBUILD")
    end

    global libmbedtls
    if !isfile(libmbedtls)
        error("$(libmbedtls) does not exist, please report an issue with this PKGBUILD")
    end

    if Libdl.dlopen_e(libmbedtls) == C_NULL
        error("$(libmbedtls) cannot be opened, please report an issue with this PKGBUILD")
    end

    global libmbedx509
    if !isfile(libmbedx509)
        error("$(libmbedx509) does not exist, please report an issue with this PKGBUILD")
    end

    if Libdl.dlopen_e(libmbedx509) == C_NULL
        error("$(libmbedx509) cannot be opened, please report an issue with this PKGBUILD")
    end
end
EOF
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver/test
	HOME="$srcdir" JULIA_LOAD_PATH=../src:$JULIA_LOAD_PATH julia runtests.jl
}
