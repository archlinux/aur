# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributer: Ronald van Haren <ronald.archlinux.org>
# Contributer: jellysheep < max DOT mail AT dameweb DOT de >

pkgname=qwt-qt5-opengl
_pkgname=qwt
pkgver=6.1.3
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (Qt5 version with OpenGL support)"
arch=('i686' 'x86_64')
url="http://qwt.sourceforge.net/"
depends=('qt5-base' 'qt5-svg' 'qt5-tools')
license=("custom:$_pkgname")
source=("http://downloads.sourceforge.net/${_pkgname}/$_pkgname-$pkgver.tar.bz2" \
        "qwtconfig-archlinux.pri")
sha1sums=('90ec21bc42f7fae270482e1a0df3bc79cb10e5c7'
          '0b74241a5bc678ea95e801bf45f18ea4cd931567')
conflicts=('qwt')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # copy our config file to the right place
  cp ${srcdir}/qwtconfig-archlinux.pri qwtconfig.pri

  # build qwt-qt5:
  qmake-qt5 qwt.pro
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make INSTALL_ROOT=${pkgdir} install

  # install web designer plugin
  install -d ${pkgdir}/usr/lib/qt/plugins/designer/
  install -Dm755 designer/plugins/designer/libqwt_designer_plugin.so \
    ${pkgdir}/usr/lib/qt/plugins/designer/

  # needed by qmake (FS#30407)
  install -d "${pkgdir}"/usr/lib/qt/mkspecs/features/
  install -m644 qwtconfig.pri qwt.prf qwtfunctions.pri \
    "${pkgdir}"/usr/lib/qt/mkspecs/features

  # move man pages
  mv "${pkgdir}"/usr/share/doc/qwt/man/ "${pkgdir}"/usr/share/

  # install licence
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/COPYING \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
