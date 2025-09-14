# Maintainer: Alex Potapenko <opotapenko at gmail com>

pkgname=tigervnc-viewer
pkgver=1.15.0
pkgrel=1
pkgdesc="TigerVNC (Viewer only), forked from the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
options=('strip')
depends=('fltk1.3' 'gnutls' 'libjpeg-turbo')
makedepends=('cmake')
conflicts=('tigervnc' 'tightvnc')
source=(tigervnc-${pkgver}.tar.gz::https://github.com/TigerVNC/tigervnc/archive/v${pkgver}.tar.gz
        vncviewer.desktop)
sha256sums=('7f231906801e89f09a212e86701f3df1722e36767d6055a4e619390570548537'
            '5d825fee354ed7c37bd4aa0558850d3fd17b7e2423b6818afff43ba26ebfb606')

prepare() {
  cd ${srcdir}/tigervnc-${pkgver}
  sed -i -e 's/find_package(FLTK REQUIRED)/find_package(FLTK1.3 REQUIRED)/' CMakeLists.txt
}

build() {
  cd ${srcdir}/tigervnc-${pkgver}
  cmake -G "Unix Makefiles" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_EXE_LINKER_FLAGS="-L/usr/lib/fltk1.3"
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
