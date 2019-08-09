# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zmq
_pkgname=ZMQ
pkgver=1.0.0
pkgrel=5
pkgdesc='Julia binding to the native API of ØMQ project'
arch=(any)
url=https://github.com/JuliaInterop/ZMQ.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath zeromq)
makedepends=(julia-distrohelper)

_commit=ffed2d514d4e73cf0f8c700d5d33cd5f9dec9ee0
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('f8c3cc104b3e8dc7ae09da9787427fb2ca45f3e4b46c98a6c8eace78216b1333'
            'd27c36dfdb33f4cfb29f85c57509fa0874bd0f92e8c3d88ef87fcc93f3e32bcc'
            '6b51aedfcda4ecddeed07880756db0791b33bb158237fdb714ff695f1902f417'
            'f2fc26069146b5cfebee4e243023d3793f843eccba6e48c02fa92d5124599da2')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml $pkgver
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
