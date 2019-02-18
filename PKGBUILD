# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme python-gpgme)
pkgver=1.12.0
pkgrel=2
pkgdesc="A C wrapper library for GnuPG"
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'swig')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig}
        '0001-qt-Use-tofu-conflict-test-keys-without-expiry.patch')
sha256sums=('b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8'
            'SKIP'
            'd83ed2e2d3f55d8c1ba3f15b386cd2643b1a733c28dae4ba50b3494e09a9e68e')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 < ../0001-qt-Use-tofu-conflict-test-keys-without-expiry.patch
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
}
