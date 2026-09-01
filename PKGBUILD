# Maintainer: Lucas Balmès <lucagoc@pm.me>
pkgname=python-pypixelcolor-git
_name=pypixelcolor
pkgver=0.4.0.r15.g3c77e9d
pkgrel=1
pkgdesc="A Python library and CLI to control iPixel Color devices (Git development version)"
arch=('any')
url="https://github.com/lucagoc/pypixelcolor"
license=('MIT')
depends=(
    'python'
    'python-bleak'
    'python-crccheck'
    'python-pillow'
    'python-rich'
    'python-textual'
    'python-websockets'
)
optdepends=(
    'python-pillow-heif: HEIF/HEIC image format support'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
checkdepends=(
    'python-pytest'
)
provides=("python-pypixelcolor=${pkgver}" "pypixelcolor=${pkgver}")
conflicts=('python-pypixelcolor')
source=("$_name::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name"
    PYTHONPATH=src pytest
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
