# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=patchance
pkgname="$_pkgname-git"
pkgver=0.2.3.r2.ga2e8c61
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK (git version)'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL2)
depends=(hicolor-icon-theme python-pyqt5)
makedepends=(git qt5-tools)
groups=(pro-audio)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Houston4444/Patchance.git"
        'HoustonPatchbay::git+https://github.com/Houston4444/HoustonPatchbay.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.HoustonPatchbay.url "$srcdir"/HoustonPatchbay
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
