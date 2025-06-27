# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=boxes-py-git
pkgver=r1953.745db81
pkgrel=1
pkgdesc="Boxes.py - laser cutting boxes and more"
arch=("x86_64")
url="https://github.com/florianfesti/boxes"
license=('GPL3')
depends=('python' 'python-affine' 'python-numpy' 'python-shapely' 'python-markdown' 'python-qrcode')
optdepends=(
    'pstoedit: to export to DXG, gcode or PLT.'
    'python-inkex: for the inkscape extension.')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("git+https://github.com/florianfesti/boxes")
b2sums=("SKIP")

pkgver() {
    cd boxes
    # There are no tags currently
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd boxes
    python -m build --wheel --no-isolation
    python scripts/boxes2inkscape inkex
}

package() {
    cd boxes
    python -m installer -d "$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/inkscape/extensions"
    cp -a inkex/*.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp scripts/boxes_proxy.py "$pkgdir/usr/share/inkscape/extensions/"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
