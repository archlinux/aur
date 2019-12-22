# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.17.6
pkgrel=1
pkgdesc='Julia implementation of Data structures'
arch=(any)
url=https://github.com/JuliaCollections/DataStructures.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-loadpath
  julia-orderedcollections
) # julia-primes) circular dependency for check()
makedepends=(julia-distrohelper)

_commit=0f3dbfb16eb284adde8a948a03d41be8046976a5
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('91e1f9f65218a5aa37e8459dc61f2b8c815bb135284bd449f4316297a46eaadd'
            '2b02ef870d8d589deb4c52ada6bcd4b95c2454f48cc84d24638feb2e1eb41351'
            '7f7668d5864d661e32aa75e5ef6e9de218e160ec849b67d7555e66a48b2aa4e9'
            '9f77e39d399329c23c48c088802ae70365639197825ccaaf5013a8ae68ef9e64')

_slug() {
	dh_julia slug "$srcdir"/"$pkgname"-$pkgver-{Package,Versions}.toml $pkgver
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

	cp      -r    $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s    ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/License.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Has circular dependency on julia-primes
#check() {
#	cd $_pkgname.jl-$pkgver
#	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
