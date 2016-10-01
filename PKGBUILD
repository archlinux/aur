# Maintainer: Matthew McKinnon <support at comprofix.com>
pkgname=tigervnc-viewer-git
pkgver=1.7.0
pkgrel=2
pkgdesc="TigerVNC (Viewer only), forked from the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
options=('strip')
depends=('fltk' 'gnutls' 'libjpeg-turbo')
makedepends=('cmake')
conflicts=('tightvnc')
source=(https://github.com/TigerVNC/tigervnc/archive/v$pkgver.tar.gz
				vncviewer.desktop)
md5sums=('0930edf4f339283d856ce7027db40308'
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
