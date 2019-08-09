# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-binaryprovider
_pkgname=BinaryProvider
pkgver=0.5.5
pkgrel=1
pkgdesc='A reliable binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPackaging/BinaryProvider.jl
license=(MIT)
depends=(julia julia-loadpath)
makedepends=(julia-distrohelper)
checkdepends=(curl git)

_commit=dbac6903980b6f4f75de6c8afa46ef6b91be183f
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('b58e648c096d1b37ed97ca70d2a66d5dbe433ecf4803c43fe98a19087a2f11a5'
            '1a47c7478e81d378c24a1b7f6e7ec893fb6b9615bdff17f52c93d1c560e4c65a'
            'decb333c3e4cf96c9f35d0b2bd5d42dbda88517f18ec7e68761aae4825fb7b85'
            'eff45ae09624693a2d276f2b1fedc79f338cdbeabc6fd61406e0749ae6336941')

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
	# Full path is needed for this set of tests, and they also download a Git repo to $HOME...
	cd $_pkgname.jl-$pkgver/test
	HOME="$srcdir" JULIA_LOAD_PATH="$srcdir"/$_pkgname.jl-$pkgver/src:$JULIA_LOAD_PATH julia runtests.jl
}
