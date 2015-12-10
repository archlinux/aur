# Maintainer: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>

pkgname=libdecodeqr-git
_gitname=libdecodeqr
pkgver=0.9.4.rbbba977
pkgrel=2
pkgdesc="A C/C++ library for decoding QR code 2D barcodes"
arch=('i686' 'x86_64')
url="https://github.com/josephholsten/libdecodeqr"
license=('LGPL2')
depends=('opencv')
optdepends=()
makedepends=('git')
provides=('libdecodeqr')
conflicts=('libdecodeqr')
source=("git+https://github.com/josephholsten/libdecodeqr.git"
        "automake.patch")
sha256sums=('SKIP'
            'a087f21fe3cf7bccf9773afc54537a27b0cb94eda3fb81836b368bfb81120019')
install="${_gitname}.install"

pkgver() {
  cd "$srcdir/$_gitname"
  _revision=$(git rev-parse --short HEAD)
  _major_version=$(sed -ne "s/^#define LIBDECODEQR_VERSION_MAJOR \([0-9]\+\)/\1/p" libdecodeqr/version.h)
  _minor_version=$(sed -ne "s/^#define LIBDECODEQR_VERSION_MINOR \([0-9]\+\)/\1/p" libdecodeqr/version.h)
  _patch_version=$(sed -ne "s/^#define LIBDECODEQR_VERSION_TEENY \([0-9]\+\)/\1/p" libdecodeqr/version.h)
  echo ${_major_version}.${_minor_version}.${_patch_version}.r${_revision}
}

prepare() {
  cd "$srcdir/$_gitname"

  msg "Patching automake bug..."
  git apply "$srcdir/automake.patch"

  autoreconf -i
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"

  make install DESTDIR="$pkgdir"
}
