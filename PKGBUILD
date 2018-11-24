# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zmq
_pkgname=ZMQ
pkgver=1.0.0
pkgrel=1
pkgdesc='Julia binding to the native API of ØMQ project'
arch=(any)
url=https://github.com/JuliaInterop/ZMQ.jl
license=(MIT)
depends=(julia julia-compat zeromq)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaInterop/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('f8c3cc104b3e8dc7ae09da9787427fb2ca45f3e4b46c98a6c8eace78216b1333')

prepare() {
	cd $_pkgname.jl-$pkgver
	cat >deps/deps.jl <<'EOF'
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

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
	install deps/deps.jl $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/deps/deps.jl
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
