# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=(gpgme-minimal-git)
pkgver=1.15.1
pkgrel=1
_python_ver=3.9
pkgdesc="A C wrapper library for GnuPG"
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base' 'python' 'swig')
#validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # Werner Koch (dist signing 2020)
source=(git://git.gnupg.org/gpgme.git)
sha256sums=('SKIP')

pkgver() {
  cd gpgme
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd gpgme

  export PYTHONHASHSEED=0
  
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test \
    --disable-gpgconf-test \
    --disable-gpg-test \
    --disable-g13-test
  make

  # ensure reproducibility of .pyc files
  touch -d @$SOURCE_DATE_EPOCH lang/python/version.py
  touch -d @$SOURCE_DATE_EPOCH lang/python/python${_python_ver}-gpg/lib.linux-x86_64-${_python_ver}/gpg/gpgme.py

  # .pyc files will be created if check() is used - generate them here

}

#check() {
#  cd gpgme

  # this test fails with gnupg (FS#66572)
#  sed -i 's#"t-keylist-secret",##' tests/json/t-json.c

#  make check

  # ensure reproducibilty whether test-suite is run or not
#  find . -name *.pyc -exec rm {} +
#}

package_gpgme-minimal-git() {
  depends=('libgpg-error' 'gnupg>=2')
  options=('!emptydirs')
  provides=('libgpgme.so'
            'libgpgmepp.so'
            'gpgme')
  conflicts=(gpgme)

  cd gpgme

  make DESTDIR="${pkgdir}" install

  # split qgpgme
  rm -r "${pkgdir}"/usr/include/{qgpgme,QGpgME}/
  rm -r "${pkgdir}"/usr/lib/{cmake/QGpgme/,libqgpgme.*}
  rm -r "${pkgdir}"/usr/lib/python*
}
