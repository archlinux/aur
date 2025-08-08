# Maintainer: tblFlip <root@tblflip.de>

pkgname=python-srctools
_pkgname=srctools
pkgver=2.6.0
pkgrel=1
pkgdesc="Modules for working with Valve's Source Engine file formats."
arch=('x86_64')
url="https://github.com/TeamSpen210/$_pkgname"
license=('MIT')

depends=(
    "python-attrs"
    "python-typing_extensions"
    "python-exceptiongroup"
)

optdepends=(
    "python-wxpython"
)

makedepends=(
    "meson-python"
    "cython"
)

# Because of course we need submodules.
_quickhull_commit=1ffbc6f884ea1da89e104a5996cf8a726db673d5

source=(
    "https://github.com/TeamSpen210/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/akuukka/quickhull/archive/$_quickhull_commit.tar.gz"
    "useful_types.diff"
)

sha256sums=(
	"fa8eb82c09afcb232298942165ff3ba1c56fb60499243a50b33ede18cb30226a"
	"55c87e78bf990509ff35e3e039213ca6e3890ce988c2891647d65079696ae3a9"
	"b82ee653ae5452295d2afc2ddd030a2a0714a6c878c5f5858c4e51b8b63c84e5"
)

prepare() {
    mv -T "quickhull-$_quickhull_commit" "$_pkgname-$pkgver/src/quickhull"
    cd "$_pkgname-$pkgver"
    patch -p1 < ../useful_types.diff
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/$_pkgname-$pkgver-"*".whl"
}
