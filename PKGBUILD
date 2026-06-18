# Maintainer: Jiachen Yang <farseerfc@gmail.com>

pkgname=pacvis-git
_pkgname=pacvis
pkgver=0.2.7.r12.g34f7494
pkgrel=2
pkgdesc="Visualize pacman local database using Vis.js, inspired by pacgraph"
arch=('any')
url="https://github.com/farseerfc/pacvis"
license=('MIT')
depends=('python-tornado' 'pyalpm' 'python-setuptools' 'systemd')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/farseerfc/pacvis.git")
provides=("pacvis")
conflicts=("pacvis")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build () {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 "pacvis@.service" "${pkgdir}/usr/lib/systemd/system/pacvis@.service"
}

# vim:set ts=2 sw=2 et:
