# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=patchance
pkgname="$_pkgname-git"
pkgver=1.1.0.r6.g9d279f4
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK (git version)'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme python-pyalsa python-pyqt5)
makedepends=(git qt5-tools)
groups=(pro-audio)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Houston4444/Patchance.git"
        'HoustonPatchbay::git+https://github.com/Houston4444/HoustonPatchbay.git'
        'patchance-disable-alsa.patch')
sha256sums=('SKIP'
            'SKIP'
            'f6efe60272b10759f2dcbd3676e4bc1cdaaafad5e22bf5a0da554260c24ace59')

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

  patch -p1 -N -r - -i "$srcdir"/patchance-disable-alsa.patch
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
