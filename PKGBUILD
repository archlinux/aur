# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme-1
pkgver=1.24.3
pkgrel=1
pkgdesc='C wrapper library for GnuPG - 1.x'
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
  LGPL-2.1-or-later
  MIT)
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'libassuan'
  'libgpg-error'
  'gnupg>=2')
makedepends=('git')
provides=('libgpgme.so')
options=('!emptydirs')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=("git+https://dev.gnupg.org/source/gpgme.git#tag=gpgme-${pkgver}?signed")
sha256sums=('630d7301a614bf22916cecdb78bbb34ea1dd724071a9ea9aee67aab06ba3dea1')

prepare() {
  cd gpgme

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd gpgme

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd gpgme

  install -D -m0755 ./src/.libs/libgpgme.so.11.33.2 "${pkgdir}/usr/lib/libgpgme.so.11.33.2"
  ln -s 'libgpgme.so.11.33.2' "${pkgdir}/usr/lib/libgpgme.so.11" 
}
