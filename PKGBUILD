# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-conda
_pkgname=Conda
pkgver=1.4.1
pkgrel=1
pkgdesc='Use conda as a cross-platform binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPy/Conda.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
makedepends=(julia-distrohelper)
checkdepends=(julia-versionparsing)

_commit=1301ac6af9b6b576868a2d4ea0a124171d1ed91e
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-$pkgver-Deps.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Deps.toml
        $pkgname-$pkgver-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml
        $pkgname-$pkgver-Versions.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Versions.toml)
sha256sums=('9604125a12127eb2c2f6e8bc5bf2ed96c897108036599405e127b4b7993be9a2'
            '19cac12a456fe9dd43a9cb96506f59c45278293fc29f6581cf0b0190e1f122d8'
            '16404fdeb5c5df9d923ffbdc6f6d146561242cbf1255dc67ab668625480d4be2'
            '078b17ab67725414122a3f224ddad9a73730206aaf2c4d3db4de6b6798571107')

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
