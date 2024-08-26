# Maintainer: Alex Potapenko <opotapenko at gmail com>

pkgname=tigervnc-viewer
pkgver=1.14.0
pkgrel=2
pkgdesc="TigerVNC (Viewer only), forked from the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
options=('strip')
depends=('fltk' 'gnutls' 'libjpeg-turbo')
makedepends=('cmake')
conflicts=('tigervnc' 'tightvnc')
source=(tigervnc-${pkgver}.tar.gz::https://github.com/TigerVNC/tigervnc/archive/v${pkgver}.tar.gz
        vncviewer.desktop)
sha256sums=('5700f9919802a2f0529cc058b8caded03281cdbf0335581f2dcc7df03f783419'
            '96421b30e8ead2477dfdacf95eb6639998a697151640f34204535a10c66a5cc7')

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
