# Maintainer: tblFlip <root@tblflip.de>

pkgname=python-srctools
_pkgname=srctools
pkgver=2.7.0
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
    "python-build"
    "python-installer"
    "python-wheel"
    "meson-python"
    "cython"
    "mypy"
)

# Because of course we need submodules.
_pythoncapi_commit=22811c3f0e69908894d2bd724f572b32667f2141
_quickhull_commit=1ffbc6f884ea1da89e104a5996cf8a726db673d5

source=(
    "https://github.com/TeamSpen210/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/python/pythoncapi-compat/archive/$_pythoncapi_commit.tar.gz"
    "https://github.com/akuukka/quickhull/archive/$_quickhull_commit.tar.gz"
    "useful_types.diff"
    "fix_python_meson_req.diff"
)

sha256sums=(
	"7174025628f9fe912155b39235bcb8974c08bb67ccaf2d4e0211ca14e4bbe309"
	"67e847d405f9101750f2687e2ba73667669b40077f54139d88db947965b3e5c3"
	"55c87e78bf990509ff35e3e039213ca6e3890ce988c2891647d65079696ae3a9"
	"b82ee653ae5452295d2afc2ddd030a2a0714a6c878c5f5858c4e51b8b63c84e5"
	"e817f174a1a073af8b9d59d62a5f12e3baf4d4d4d6c06a39d18160b66695a37c"
)

prepare() {
    mv -T "pythoncapi-compat-$_pythoncapi_commit" "$_pkgname-$pkgver/src/pythoncapi-compat"
    mv -T "quickhull-$_quickhull_commit" "$_pkgname-$pkgver/src/quickhull"
    cd "$_pkgname-$pkgver"
    patch -p1 < ../useful_types.diff
    patch -p1 < ../fix_python_meson_req.diff
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/$_pkgname-$pkgver-"*".whl"
}
