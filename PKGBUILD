# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-binaryprovider
_pkgname=BinaryProvider
pkgver=0.5.3
pkgrel=2
pkgdesc='A reliable binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPackaging/BinaryProvider.jl
license=(MIT)
depends=(julia julia-loadpath)
checkdepends=(curl git)

_commit=e7e51997561477e5de3375b590de983ae3944780
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('ef242e8c9250dbb8752eef4ecd504776e70c50b6d62ffea1a6d16150d6d0e282'
            'decb333c3e4cf96c9f35d0b2bd5d42dbda88517f18ec7e68761aae4825fb7b85')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	# Full path is needed for this set of tests, and they also download a Git repo to $HOME...
	cd $_pkgname.jl-$pkgver/test
	HOME=$srcdir JULIA_LOAD_PATH=$srcdir/$_pkgname.jl-$pkgver/src: julia runtests.jl
}
