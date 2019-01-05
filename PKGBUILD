# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zmq
_pkgname=ZMQ
pkgver=1.0.0
pkgrel=2
pkgdesc='Julia binding to the native API of ØMQ project'
arch=(any)
url=https://github.com/JuliaInterop/ZMQ.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath zeromq)

_commit=ffed2d514d4e73cf0f8c700d5d33cd5f9dec9ee0
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaInterop/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('f8c3cc104b3e8dc7ae09da9787427fb2ca45f3e4b46c98a6c8eace78216b1333'
            '6b51aedfcda4ecddeed07880756db0791b33bb158237fdb714ff695f1902f417')

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
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME=$srcdir JULIA_LOAD_PATH=src: julia test/runtests.jl
}
