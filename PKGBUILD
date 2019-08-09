# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-primes
_pkgname=Primes
pkgver=0.4.0
pkgrel=5
pkgdesc='Prime numbers in Julia'
arch=(any)
url=https://github.com/JuliaMath/Primes.jl
license=(MIT)
depends=(julia julia-compat julia-datastructures julia-loadpath julia-orderedcollections)
makedepends=(julia-distrohelper)

_commit=a5407c18c94c6c262603337392426894f86b3f79
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaMath/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('489f5c77fc2fceb00b2d8c2571b1e85808322c8e762a5d1712e8bfbfb3c8bc36'
            '1c08fdc3105498ea73a5486a753edab162088ecdff1b7fbfb682855f63344fae'
            '52c8ba7d166e9593828b8ed5bf12e58cccdcc4ae86ea28e63fa8310468f91a14'
            '2abd6401f33937b90d28df5d4a8c806bc4110a4a3e65ece3ba623ab72e1e1c51')

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

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
