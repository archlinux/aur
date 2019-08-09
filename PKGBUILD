# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-conda
_pkgname=Conda
pkgver=1.3.0
pkgrel=1
pkgdesc='Use conda as a cross-platform binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPy/Conda.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)
checkdepends=(julia-versionparsing)

_commit=85ed1f9bd9b0fee95f9d0834147088dbc44f4af4
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('3b43a581d45fe6d6edd9e6a86119cf73587370202d85fc1e6196b3eb5cab2d4c'
            '13f55effc5db4c9b01a6676e1147f1d354a336749f8d8321cf4b9b5a94147022'
            '16404fdeb5c5df9d923ffbdc6f6d146561242cbf1255dc67ab668625480d4be2'
            'eea559d5438aa58068e40abb403130531b87d9865b0236ad46350528096d59f3')

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

build() {
	cd $_pkgname.jl-$pkgver/deps
	HOME="$srcdir" CONDA_JL_HOME=/usr julia build.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/{vendor,packages/$_pkgname}

	cp      -r     $_pkgname.jl-$pkgver   "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  Project.toml           "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml
	ln      -s     ../../vendor/$_pkgname "$pkgdir"/usr/share/julia/packages/$_pkgname/$(_slug)

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Will download the full MiniConda installer, so disable
#check() {
#	cd $_pkgname.jl-$pkgver
#	HOME="$srcdir" ROOTENV=/usr JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
