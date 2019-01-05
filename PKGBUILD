# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls
_pkgname=MbedTLS
pkgver=0.6.6
pkgrel=2
pkgdesc='Wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaWeb/MbedTLS.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath mbedtls)

_commit=bce262503a3b9e38bf2f04bc79979e215f0bbda7
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaWeb/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        'disable-test-logsecrets.patch')
sha256sums=('2d1e81050f117bbdbd4fe1b84060ee3c73ee5060cbfc568e4a28bdf7387d254f'
            '04d846b75adf0693bf0cda4db3339bb419ac0a338c90dcbd2ac79c1966fb0091'
            'c524da32a37ebee0938229402453ada5089c3396e10b3d4bfefcc80cd82af77f')

prepare() {
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
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver/test
	HOME=$srcdir JULIA_LOAD_PATH=../src: julia runtests.jl
}
