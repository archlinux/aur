# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-zmq
_pkgname=ZMQ
pkgver=1.2.0
pkgrel=1
pkgdesc='Julia binding to the native API of ØMQ project'
arch=(any)
url=https://github.com/JuliaInterop/ZMQ.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath julia-zeromq-jll zeromq)
makedepends=(julia-distrohelper)

_commit=46d153bfe7dea6702cdf32d025d8b5ff81a4e59f
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('78eee3d1e1d2326523ebb053300da884a16abbcdb22d8271b43c3531f8d982d3'
            'e5f79dae79a511964865c1508fa9d8d453fe5040a1789101b00c1c85ee0e6fcb'
            '6b51aedfcda4ecddeed07880756db0791b33bb158237fdb714ff695f1902f417'
            '3711ed32395591bacbde08b7e4bbc71efb3abe669f5de59427bba5a632b19af5')

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
