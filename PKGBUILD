# Maintainer: envolution
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xz-static
pkgver=5.8.1
pkgrel=2
pkgdesc='Statically linked library for XZ and LZMA'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'LicenseRef-custom' 'LicenseRef-Autoconf-exception-macro')
depends=('sh')
provides=("liblzma.a=$pkgver")
options=('staticlibs')
source=("https://tukaani.org/xz/xz-${pkgver}.tar.gz"{,.sig}
test_bcj_size.patch)
sha256sums=('507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543'
            'SKIP'
            '118941b517fd434f2c2e12c55d30f0ab339670d9636f9f377d6d1dc1d2ddca9d')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org> https://tukaani.org/misc/lasse_collin_pubkey.txt

prepare() {
  cd xz-${pkgver}
  patch -Np3 -i ../test_bcj_size.patch
}
build() {
  cd xz-${pkgver}

  ./configure --prefix=/usr \
    --disable-rpath \
    --enable-werror \
    --disable-shared \
    --disable-xz \
    --disable-xzdec \
    --disable-lzmadec \
    --disable-lzmainfo \
    --disable-scripts \
    --disable-doc
  make
}

check() {
  cd xz-${pkgver}
  make check
}

package() {
  cd xz-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -Rf ${pkgdir}/usr/{bin,include,share,lib/pkgconfig}
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  cp -Rf COPYING* ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
