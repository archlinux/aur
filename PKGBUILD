# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=xpdf-qtify
_debver=3.04+git20260802
pkgver=3.04.git20260802
pkgrel=1
pkgdesc="xpdf 3 (the Motif PDF viewer, poppler based) built on Qt with Motif on Qt"
arch=(x86_64 aarch64)
url="https://tracker.debian.org/pkg/xpdf"
license=(GPL-2.0-only OR GPL-3.0-only)
depends=(qt6-base poppler)
makedepends=(motif-on-qt autoconf automake pkgconf)
provides=(xpdf)
conflicts=(xpdf)
source=("https://deb.debian.org/debian/pool/main/x/xpdf/xpdf_${_debver}.orig.tar.xz")
sha256sums=('3d08a47306ac7515736cb256d63ea2f0cbaeafa4f05961fcd6cf38e3dbea83e6')

build() {
  cd "xpdf-${_debver}"
  autoreconf -fi
  # poppler 25 headers use C++20 (std::span, string::ends_with)
  CXXFLAGS="$CXXFLAGS -std=gnu++20" motif-on-qt-env ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "xpdf-${_debver}"
  # -v prints the version and exits with status 99 (xpdf's convention)
  QT_QPA_PLATFORM=offscreen ./xpdf/xpdf -v 2>&1 | grep -q 'version 3'
}

package() {
  cd "xpdf-${_debver}"
  make DESTDIR="$pkgdir" install
}

