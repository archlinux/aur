# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme-1
_pkgname=gpgme
pkgver=1.24.3
pkgrel=4
pkgdesc='C wrapper library for GnuPG - 1.x'
arch=('x86_64' 'pentium4' 'i686' 'i486')
url='https://www.gnupg.org/related_software/gpgme/'
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
  LGPL-2.1-or-later
  MIT
)
options+=('!emptydirs')
makedepends=(
  'git'
  'gnupg'
  'libassuan'
  'libgpg-error'
)
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'libassuan'
  'libgpg-error'
  'gnupg>=2'
)
makedepends=('git')
provides=('libgpgme.so')
options=('!emptydirs')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=("git+https://dev.gnupg.org/source/gpgme.git#tag=${_pkgname}-${pkgver}?signed"
        '0025_debian_default_is_openpgp.diff')
sha256sums=('630d7301a614bf22916cecdb78bbb34ea1dd724071a9ea9aee67aab06ba3dea1'
            'f8bdaba4732347067ce291ca2acd6096e7a02c162a760be3515e0c4cdac60d6f')

prepare() {
  cd ${_pkgname}

  # Adapt testsuite to changed gnupg defaults in Debian
  patch -Np1 < ../0025_debian_default_is_openpgp.diff

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd ${_pkgname}

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test \
    --disable-python \
    --enable-languages=cpp

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${_pkgname}

  # this test fails with gnupg (FS#66572)
  sed -i 's#"t-keylist-secret",##' tests/json/t-json.c

  make check
}

package() {

  cd ${_pkgname}

  make DESTDIR="${pkgdir}" install

  # remove everything but the header files and the libraries
  # also remove all compilation helpers, as they fail anyway probably
  rm -rf "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/lib/cmake"
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -rf "$pkgdir/usr/lib/"*.so
  rm -rf "$pkgdir/usr/share"

  # move include files out of the way
  mkdir "$pkgdir/usr/include/gpgme1"
  mv -vn "$pkgdir/usr/include/gpgme.h" "$pkgdir/usr/include/gpgme1/."
  mv -vn "$pkgdir/usr/include/gpgme++" "$pkgdir/usr/include/gpgme1/."

  # add a license
  install -vDm 644 LICENSES "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
}
