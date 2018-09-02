# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-mbedtls
_pkgname=MbedTLS
pkgver=0.6.0
pkgrel=1
pkgdesc='Wrapper around mbedtls for Julia'
arch=(any)
url=https://github.com/JuliaWeb/MbedTLS.jl
license=(MIT)
depends=(julia julia-compat mbedtls)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaWeb/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('45a968b6b02e419879ab28bce983b96023b8c2c47fda79cdbe3a2151f257d08a')

prepare() {
	cd $_pkgname.jl-$pkgver
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
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps
	install deps/deps.jl $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps/
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver/test
	JULIA_LOAD_PATH=../src:$JULIA_LOAD_PATH julia runtests.jl
}
