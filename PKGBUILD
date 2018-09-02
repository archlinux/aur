# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zmq
_pkgname=ZMQ
pkgver=0.6.4
pkgrel=1
arch=(any)
url=https://github.com/JuliaInterop/ZMQ.jl
license=(MIT)
depends=(julia julia-compat)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaInterop/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('c7a88c94fb7a6c48d07cac152c36c8677c8a37b1f6c4e29ee65a51daaab1b9c3')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/

	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps
	cat > $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps/deps.jl <<'EOF'
if isdefined((@static VERSION < v"0.7.0-DEV.484" ? current_module() : @__MODULE__), :Compat)
    import Compat.Libdl
elseif VERSION >= v"0.7.0-DEV.3382"
    import Libdl
end
const libzmq = "/usr/lib/libzmq.so"
function check_deps()
    global libzmq
    if !isfile(libzmq)
        error("$(libzmq) does not exist, please report an issue with this PKGBUILD.")
    end

    if Libdl.dlopen_e(libzmq) == C_NULL
        error("$(libzmq) cannot be opened, please report an issue with this PKGBUILD.")
    end
end
EOF
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_DIR=src:$JULIA_LOAD_DIR julia test/runtests.jl
}
