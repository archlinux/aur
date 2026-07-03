# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=(yacreader yacreaderlibraryserver)
pkgbase=yacreader
pkgver=10.1.0
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg' 'qt6-imageformats'
'qt6-speech' 'qt6-5compat' 'hicolor-icon-theme' 'libpdfium-nojs')
makedepends=('qt6-tools' 'cmake' 'ninja')
conflicts=('yacreader-bin' 'yacreaderlibraryserver-standalone' 'yacreader-git')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}-src.tar.xz")
sha256sums=('86f9b3418ee8be753fcbcedcfc2f56446350d888f362ef6185a94f7aef83b4ff')

build() {
  cd $srcdir/$pkgbase-$pkgver/
  cmake -B build -DDECOMPRESSION_BACKEND=7zip -DPDF_BACKEND=pdfium -DCMAKE_INSTALL_PREFIX=/usr -GNinja
  cmake --build build
  }

package_yacreader() {
  cd $srcdir/$pkgbase-$pkgver/
  DESTDIR="$pkgdir" cmake --install build
  rm $pkgdir/usr/bin/YACReaderLibraryServer
  rm $pkgdir/usr/lib/systemd/user/yacreaderlibraryserver.service
}

package_yacreaderlibraryserver() {
  pkgdesc="Headless YACReaderLibrary server for use with YACReader for iOS."
  install=yacreaderlibraryserver.install
  cd $srcdir/$pkgbase-$pkgver/
  
  # install binary
  install -Dm755 \
    "build/YACReaderLibraryServer/YACReaderLibraryServer" \
    "$pkgdir/usr/bin/YACReaderLibraryServer"

  # install systemd service
  install -Dm644 \
    "YACReaderLibraryServer/yacreaderlibraryserver.service" \
    "$pkgdir/usr/lib/systemd/system/yacreaderlibraryserver.service"
}
