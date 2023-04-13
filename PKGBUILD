# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qtav
pkgver=1.13.0
pkgrel=4
pkgdesc="A cross-platform multimedia playback framework based on Qt and FFmpeg"
arch=('x86_64')
url="https://www.qtav.org/"
license=('LGPL')
depends=('qt5-declarative' 'ffmpeg4.4' 'libxv' 'openal' 'uchardet' 'qt5-quickcontrols' 'qt5-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wang-bin/QtAV/archive/v$pkgver.tar.gz"
        https://raw.githubusercontent.com/wang-bin/capi/6a5f3006533b79aa57a3a54cf9df4442a356dd48/capi.h
        https://github.com/wang-bin/QtAV/commit/5263d9d9.patch
        https://github.com/wang-bin/QtAV/commit/5abba7f0.patch)
sha512sums=('93ffbf38c49b35bddc08dd93d5cee73369f0693e5a09b087a5295b454b970fed58076bcddb101aa061f48b0350b8e7c7d1ef1045e81f28b146de73d4b82480c8'
            '7bb96607ddd46f58dca6c9a5cc072982fe847f75b0adb6fc348cb11c1c6bc31478d93fce27c87ff53ddd3b3dbf277a5d5d8728d4d98b86a2f1a21b02879c2725'
            '156d6feb8bf0d9a3660f0341ceb3d2728d7b044ef4e3a9c7f81adbc262e3d30c4e8769a6059ef90601006d17f50f2259dcc533f223d0bcdc7467376b11f10899'
            '915e3852a851a171737c254b9b9ef305d6dc1955eec1fda8fa435d3ee1fcd1aa45d7ff67a67c539b2562a5f9af585601985bf2a000aed27dc34321fcb25370b8')

prepare() {
# Fix build with Qt 5.15
  patch -d QtAV-$pkgver -p1 < 5263d9d9.patch
  patch -d QtAV-$pkgver -p1 < 5abba7f0.patch
# Missing header
  mv capi.h QtAV-$pkgver/contrib/capi
}

build() {
  cd QtAV-$pkgver

  CXXFLAGS+=" -I/usr/include/ffmpeg4.4" \
  LDFLAGS+=" -L/usr/lib/ffmpeg4.4" \
  qmake-qt5 "CONFIG+=no_rpath recheck" \
    QMAKE_CXXFLAGS="$CXXFLAGS -I/usr/include/ffmpeg4.4" \
    QMAKE_LFLAGS="$LDFLAGS -L/usr/lib/ffmpeg4.4"
  make
}
 
package() {
  cd QtAV-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}
