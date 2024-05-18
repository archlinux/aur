# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree-part-import-git
pkgver=1.6.r15.g22ff740
pkgrel=1
pkgdesc="CLI to import parts from into your InvenTree instance"
url="https://github.com/30350n/inventree_part_import"
depends=(
    'python-beautifulsoup4'
    'python-click'
    'python-cutie'
    'python-digikey-api'
    'python-fake-useragent'
    'python-inventree'
    'python-isocodes'
    'python-platformdirs'
    'python-requests'
    'python-tablib'
    'python-thefuzz'
    'python-yaml'
)
makedepends=(python-build python-installer python-wheel python-poetry)
license=('MIT')
arch=('any')
source=(
    "$pkgname::git+https://github.com/30350n/inventree_part_import.git"
    "error_helper::git+https://github.com/30350n/error_helper.git"
)
sha256sums=('SKIP'
            'SKIP')
conflicts=('python-inventree-part-import')
provides=("python-inventree-part-import=${pkgver}")

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.inventree_part_import/error_helper.url "$srcdir/error_helper"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
