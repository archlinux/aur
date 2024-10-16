# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.10.0
pkgrel=1
pkgdesc="World's most popular Open Source IRC bot"
arch=('x86_64')
url="https://www.eggheads.org"
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'openssl' 'tcl' 'zlib')
source=("https://ftp.eggheads.org/pub/${pkgname}/source/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"{,.asc})
b2sums=('86d8ab27c0ce5ce4525095455420a4172f1bad23e3dd00772a60901ba3050d0db57d52c9cb093be2f3a77f8d8894f868da8876a9ea4533247d76d0b43cb4c9e2'
        'SKIP')
validpgpkeys=('E01C240484DE7DBE190FE141E7667DE1D1A39AFF')

prepare() {
  cd "${pkgname}-${pkgver}"

  # don't complain about language files on startup
  sed "s|\"./language\"|\"/usr/share/${pkgname}/language\"|g" -i src/eggdrop.h
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure
  make config
  make
  make DEST=build install
}

package() {
  cd "${pkgname}-${pkgver}/build"
  install -Dm755 "eggdrop-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 modules/* -t "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "doc/man1/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  rm -r doc/man1
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -r doc "${pkgdir}/usr/share/doc/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  for dir in help language scripts text; do
    cp -r "${dir}" "${pkgdir}/usr/share/${pkgname}"
  done

  for conf in eggdrop.conf eggdrop-basic.conf; do
    sed -e '2,3d' \
      -e "1s@^.*@#!/usr/bin/${pkgname}\n@" \
      -e "s@help/@/usr/share/${pkgname}/help/@g" \
      -e "s@scripts/@/usr/share/${pkgname}/scripts/@g" \
      -e "s@text/@/usr/share/${pkgname}/text/@g" \
      -e "s@modules/@/usr/lib/${pkgname}/@g" \
      -i "${conf}"
  done
  install -Dm644 *.conf -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
