# Maintainer: envolution
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xz-static
pkgver=5.6.3
pkgrel=1
pkgdesc='Statically linked library for XZ and LZMA'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'LicenseRef-custom' 'LicenseRef-Autoconf-exception-macro')
depends=('sh')
provides=("liblzma.a=$pkgver")
options=('staticlibs')
source=("https://tukaani.org/xz/xz-${pkgver}.tar.gz"{,.sig})
sha256sums=('b1d45295d3f71f25a4c9101bd7c8d16cb56348bbef3bbc738da0351e17c73317'
            'SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org> https://tukaani.org/misc/lasse_collin_pubkey.txt

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
