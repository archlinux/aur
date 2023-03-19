# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme python-gpgme)
pkgver=1.19.0
pkgrel=1
_python_ver=3.10
pkgdesc='A C wrapper library for GnuPG'
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'python-setuptools' 'swig')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('cb58494dc415fba9eeb12b826550ad3190dc92e265c5bb2ae1a21c92841cfd38'
            'SKIP')

build() {
  cd ${pkgbase}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test
  make

  # ensure reproducibility of .pyc files
  touch -d @$SOURCE_DATE_EPOCH lang/python/version.py
  touch -d @$SOURCE_DATE_EPOCH lang/python/python${_python_ver}-gpg/lib.linux-x86_64-cpython-${_python_ver/./}/gpg/gpgme.py

  # .pyc files will be created if check() is used - generate them here
}

check() {
  cd ${pkgbase}-${pkgver}

  # this test fails with gnupg (FS#66572)
  sed -i 's#"t-keylist-secret",##' tests/json/t-json.c

  make check

  # ensure reproducibilty whether test-suite is run or not
  find . -name *.pyc -exec rm {} +
}

package_gpgme() {
  depends=('libgpg-error' 'gnupg>=2')
  options+=('!emptydirs')
  provides=('libgpgme.so'
            'libgpgmepp.so')

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
