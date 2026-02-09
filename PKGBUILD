# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=patchance
pkgname="$_pkgname-git"
pkgver=1.3.0.r5.g267c832
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK (git version)'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme python-pyqt6 python-qtpy python-jack-client python-pyliblo qt6-svg)
makedepends=(git qt6-tools)
optdepends=(
  'python-pyalsa: ALSA ports connection support'
)
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
  sed -e 's/rcc -g/$(RCC) -g/' -i Makefile
}

build() {
  cd $_pkgname
  make -j 1 LRELEASE=/usr/lib/qt6/bin/lrelease RCC=/usr/lib/qt6/rcc
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  # fix permissions
  chmod -R ug+rX "$pkgdir"/usr
}
