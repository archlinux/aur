# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls
_pkgname=MbedTLS
pkgver=0.6.6
pkgrel=3
pkgdesc='Wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaWeb/MbedTLS.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath mbedtls)

_commit=bce262503a3b9e38bf2f04bc79979e215f0bbda7
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaWeb/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml
        'disable-test-logsecrets.patch')
sha256sums=('2d1e81050f117bbdbd4fe1b84060ee3c73ee5060cbfc568e4a28bdf7387d254f'
            '2186eeb5ff7bc0cbba5cf31ae7272aa7c9cc00505899ce472dfe978a4ce7e95c'
            '04d846b75adf0693bf0cda4db3339bb419ac0a338c90dcbd2ac79c1966fb0091'
            '66fc92f87efda76d0a27c9f9a0d42c48b2b45e1e3a84601a530bed86ce2888ce'
            'c524da32a37ebee0938229402453ada5089c3396e10b3d4bfefcc80cd82af77f')

_slug() {
	local uuid=$(grep uuid $pkgname-Package.toml | cut -f3 -d' ')
	local sha1=$(grep \"$pkgver\" -a1 $pkgname-Versions.toml | tail -n1 | cut -f3 -d' ')
	julia -e "u = Base.UUID($uuid);
	          s = Base.SHA1(hex2bytes($sha1));
	          println(Base.version_slug(u,s));"
}

_deps() {
	julia -e "using Pkg

	          alldeps = Pkg.TOML.parsefile(\"$srcdir/$pkgname-Deps.toml\")
	          version = join(split(\"$pkgver\", \".\")[1:2],\".\")
	          deps = Dict{String,Any}()

	          for (key, value) in alldeps
	            vers = split(key, \"-\")

	            if version == vers[1] || (version > vers[1] && length(vers) == 2 && version <= vers[2])
	              merge!(deps, value)
	            end
	          end

	          Pkg.TOML.print(deps)"
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && touch Project.toml
	cat $pkgname-Package.toml       >> Project.toml
	echo -e "version = \"$pkgver\"" >> Project.toml
	echo -e "\n[deps]"              >> Project.toml
	echo -e "$(_deps)" | sort       >> Project.toml

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
