# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-binaryprovider
_pkgname=BinaryProvider
pkgver=0.5.8
pkgrel=1
pkgdesc='A reliable binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPackaging/BinaryProvider.jl
license=(MIT)
depends=(julia julia-loadpath)
makedepends=(julia-distrohelper)
checkdepends=(curl git)

_commit=3d029a0b70aa1c168db4fc473ff0f36d7480bd99
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('c9af3eef513454ca5f971cf7825961d48a638dc424d8cc2ba9d6f4cbfa45edb1'
            '9901a26bda7b1b15467dd5129ff95b770fa2c063f6fc0e0dbf845c0b778bc615'
            'decb333c3e4cf96c9f35d0b2bd5d42dbda88517f18ec7e68761aae4825fb7b85'
            '1540260a51a3b3dfeac114e521d808a710121da5fa5c7e5a5168bc871bf0b5f0')

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

	cp      -r    $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s    ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	# Full path is needed for this set of tests, and they also download a Git repo to $HOME...
	cd $_pkgname.jl-$pkgver/test
	HOME="$srcdir" JULIA_LOAD_PATH="$srcdir"/$_pkgname.jl-$pkgver/src:$JULIA_LOAD_PATH julia runtests.jl
}
