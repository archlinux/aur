# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-orderedcollections
_pkgname=OrderedCollections
pkgver=1.1.0
pkgrel=1
pkgdesc='Julia implementation of associative containers that preserve insertion order '
arch=(any)
url="https://github.com/JuliaCollections/OrderedCollections.jl"
license=(MIT)
depends=(julia julia-loadpath)
makedepends=(julia-distrohelper)

_commit=85bf13d0a61020ff330aa511a84f2cb1b7370578
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('ad34d89a7df5c3ef2d77bd33a7b7ac7456fa61e9c672f2d90d31273a39c08bba'
            '7f14536cacea147a1af30e4d8161b225989937fd362ca187227a1975ed80a743'
            '70bf9e181599853f1903f8c8f2ca5f26d9aab31d945df87796d6a2f3c8019060'
            '0da43b3c272325c2a57f36527bf73d8aa2bb3e000616aa89273f0203b2e4bbe5')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml
}

_project() {
	dh_julia distro_project_ "$srcdir"/"$pkgname"-$pkgver-{Package,Versions,Deps}.toml
}

prepare() {
	# Generate a Project.toml from Registry metadata
	rm -f Project.toml && _project
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r    $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s    ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/License.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
