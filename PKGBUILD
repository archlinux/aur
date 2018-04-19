# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme python-gpgme python2-gpgme)
pkgver=1.11.0
pkgrel=1
pkgdesc="A C wrapper library for GnuPG"
arch=('x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'python2' 'swig')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig}
        '0001-tests-Fix-t-verify-test-for-GnuPG-before-2.2.7.patch')
sha256sums=('5b03adbafadab74474ded30b74c882de28d3c5c3b9ee3016ef24023d4c35d492'
            'SKIP'
            '7cd9d8385493351ce1372e967933c470617b59f7493bb35a2c148cb489f7c498')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

prepare() {
  cd ${pkgbase}-${pkgver}

  # tests: Fix t-verify test for GnuPG < 2.2.7.
  patch -Np1 < ../0001-tests-Fix-t-verify-test-for-GnuPG-before-2.2.7.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_gpgme() {
  depends=('libgpg-error' 'gnupg>=2')
  options=('!emptydirs')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # split qgpgme
  rm -r "${pkgdir}"/usr/include/{qgpgme,QGpgME}/
  rm -r "${pkgdir}"/usr/lib/{cmake/QGpgme/,libqgpgme.*}
  rm -r "${pkgdir}"/usr/lib/python*
}

package_qgpgme() {
  pkgdesc="Qt bindings for GPGme"
  depends=('gpgme' 'qt5-base')

  cd ${pkgbase}-${pkgver}/lang/qt
  make DESTDIR="${pkgdir}" install
}

package_python-gpgme() {
  pkgdesc="Python bindings for GPGme"
  depends=('gpgme' 'python')

  cd ${pkgbase}-${pkgver}/lang/python
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib"/python2*/
}

package_python2-gpgme() {
  pkgdesc="Python 2 bindings for GPGme"
  depends=('gpgme' 'python2')

  cd ${pkgbase}-${pkgver}/lang/python
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib"/python3*/
}
