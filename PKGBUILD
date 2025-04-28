# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=dymo-bluetooth
pkgname=$_name-git
pkgver=0.1.0.r9.06b61ab
pkgrel=2
pkgdesc="Use DYMO LetraTag LT-200B thermal label printer over Bluetooth in Python, without depending on its app"
arch=('any')
url="https://github.com/ysfchn/dymo-bluetooth"
license=('MIT')
depends=(
    "python-barcode"
    "python-bleak"
    "python-pillow"
    "python>=3.10"
)
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-wheel"
)
provides=("$_name")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver()
{
    cd "$srcdir/$_name"
    local _version
    local _rev_num
    local _last_commit

    _version=$(grep version pyproject.toml | cut -f 2 -d '"')
    _rev_num="$(git rev-list --count HEAD)"
    _last_commit="$(git rev-parse --short HEAD)"

    echo "${_version}.r${_rev_num}.${_last_commit}"
}

prepare() {
    git -C "$srcdir/$_name" clean -dfx
}

build() {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 assets/example_image.png -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
