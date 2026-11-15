# SPDX-FileCopyrightText: 2026 Pavel Ruzicka
# SPDX-License-Identifier: 0BSD
# Maintainer: Pavel Ruzicka <rossettidesign at gmail dot com>

pkgname=qvampeditor
pkgver=0.2.1
pkgrel=1
_qrtmidiver=0.4.1
pkgdesc='Editor and librarian for the Behringer V-AMP 2 guitar amp modeler'
arch=('x86_64')
url='https://gitlab.com/rossettidesignsw/musicutility/qvampeditor'
# QRtMidi (MIT) is linked statically
license=('GPL-2.0-or-later' 'MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'rtmidi')
makedepends=('cmake' 'ninja')
optdepends=('qt6-svg: sharp application icon in the windows (otherwise 64 px)')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "qrtmidi-$_qrtmidiver.tar.gz::https://gitlab.com/rossettidesignsw/musicutility/qrtmidi/-/archive/v$_qrtmidiver/qrtmidi-v$_qrtmidiver.tar.gz")
sha256sums=('27f64f49b0c769177c9b5d9638c85dfffe72949d3ccaae4657e99e408b981546'
            'a5077f36c9ee0537c40fc024d22dadf69b7d94cf2f71a4e3d2474ed817c3bd27')

build() {
  # QRtMidi from the second source instead of a download by FetchContent
  cmake -B build -S "$pkgname-v$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DOCDIR=share/doc/$pkgname \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_QRTMIDI="$srcdir/qrtmidi-v$_qrtmidiver" \
    -Wno-dev
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "qrtmidi-v$_qrtmidiver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/QRtMidi-LICENSE"
}
