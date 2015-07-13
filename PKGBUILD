# Contributer: Ronald van Haren <ronald.archlinux.org>
# Contributer: jellysheep < max DOT mail AT dameweb DOT de >

pkgname=qwt-qt5
_pkgname=qwt
pkgver=6.1.2
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (Qt5 version)"
arch=('i686' 'x86_64')
url="http://qwt.sourceforge.net/"
depends=('qt5-base' 'qt5-svg' 'qt5-tools')
license=("custom:$_pkgname")
source=("http://downloads.sourceforge.net/${_pkgname}/$_pkgname-$pkgver.tar.bz2" \
        "qwtconfig-archlinux.pri")
sha1sums=('6af82b6ee4132f779d1c8c2db872f01463b0d61c'
          '238fb9b58249833f6b5522777c56d32399b6854c')
provides=('qwt')
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
