# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.17.5
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

_commit=8c6382e5d7f28d4d70f136d7bdf7d9571acfa3ee
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('9f4ad9a8e67510511fd87b8fce15653517a09e75413b497f7b714dcac7259e79'
            '2b02ef870d8d589deb4c52ada6bcd4b95c2454f48cc84d24638feb2e1eb41351'
            '7f7668d5864d661e32aa75e5ef6e9de218e160ec849b67d7555e66a48b2aa4e9'
            '6a434b7a9ba888d09e33dc75df18313df4fc351586fefc6a039036d2fec0bd34')

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
