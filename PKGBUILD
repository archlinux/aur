# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme python-gpgme)
pkgver=1.13.1
pkgrel=2
pkgdesc="A C wrapper library for GnuPG"
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'swig')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46'
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
}
