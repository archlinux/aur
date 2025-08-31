# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=(yacreader yacreaderlibraryserver)
pkgbase=yacreader
pkgver=9.15.0
pkgrel=2
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg' 'qt6-imageformats' 'qt6-5compat' 'hicolor-icon-theme' 'libunarr' 'libpdfium-nojs')
makedepends=('qt6-tools')
conflicts=('yacreader-bin' 'yacreaderlibraryserver-standalone' 'yacreader-git')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}-src.tar.xz"
		"qt6_9_patch.patch::https://github.com/YACReader/yacreader/pull/471.patch"
)
sha256sums=('d0f69b7446dd36fdd29ce1a69787a8b563db8b52d2d2444dab678a2d9ae7e6ea'
            '2e7894acfd5d84e6fa8c33486288d529b7c7aafdb6fb293c6748de4811fe3ef9')

build() {
  cd $srcdir/$pkgbase-$pkgver/
  patch -p1 < $srcdir/qt6_9_patch.patch
  qmake6 CONFIG+="pdfium server_bundled"
  make
}

package_yacreader() {
  cd $srcdir/$pkgbase-$pkgver/
  make INSTALL_ROOT="$pkgdir" sub-YACReader-install_subtargets sub-YACReaderLibrary-install_subtargets
}

package_yacreaderlibraryserver() {
  pkgdesc="Headless YACReaderLibrary server for use with YACReader for iOS."
  install=yacreaderlibraryserver.install
  cd $srcdir/$pkgbase-$pkgver/
  make INSTALL_ROOT="$pkgdir" sub-YACReaderLibraryServer-install_subtargets
}
