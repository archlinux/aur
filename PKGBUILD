# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.15.0
pkgrel=2
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

_commit=8a0711a36f83df30c8cc7c8ff240a58fbbd85570
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaCollections/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('583bee9fc22880142298af535f979c599650c064f65ac5c6fa4b45d858919a9b'
            '0e09241d161b507e6568c3a736ae3635b95def76be5f97ea5795f9c59743b5b0'
            '7f7668d5864d661e32aa75e5ef6e9de218e160ec849b67d7555e66a48b2aa4e9'
            '98320b421d24300aba70a8e1716f2a47fad2a8a079378717450f1b2c17eeaa59')

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

# Has circular dependency on julia-primes
#check() {
#	cd $_pkgname.jl-$pkgver
#	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
