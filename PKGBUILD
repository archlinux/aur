# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=tigervnc-viewer
pkgver=1.3.1
pkgrel=2
pkgdesc="TigerVNC (Viewer only), forked from the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
options=('strip')
depends=('fltk' 'gnutls' 'libjpeg-turbo')
makedepends=('cmake')
conflicts=('tightvnc')
source=(http://downloads.sourceforge.net/project/tigervnc/tigervnc/$pkgver/tigervnc-$pkgver.tar.gz
	vncviewer.desktop)
md5sums=('e80b16aa74f1d8e89f284a6aef99955d'
         '71cac0fb9701b0a041430f0fddfe00c8')

build() {
  cd ${srcdir}/tigervnc-${pkgver}
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
  cd vncviewer
  make
}

package() {
  cd ${srcdir}/tigervnc-${pkgver}
  mv vncviewer/vncviewer.man vncviewer.1 && gzip -9 vncviewer.1

  install -Dm755 vncviewer/vncviewer $pkgdir/usr/bin/vncviewer
  install -Dm644 $srcdir/vncviewer.desktop $pkgdir/usr/share/applications/vncviewer.desktop
  install -Dm644 vncviewer.1.gz $pkgdir/usr/share/man/man1/vncviewer.1.gz

  for i in 16 22 24 32 48; do
    install -Dm644 media/icons/tigervnc_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/tigervnc.png
  done
}
