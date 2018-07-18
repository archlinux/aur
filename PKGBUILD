# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme python-gpgme python2-gpgme)
pkgver=1.11.1
pkgrel=2
pkgdesc="A C wrapper library for GnuPG"
arch=('x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'python2' 'swig')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f'
            'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

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
