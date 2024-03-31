# Maintainer:
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.9.5
pkgrel=1
pkgdesc="World's most popular Open Source IRC bot"
arch=('x86_64')
url="https://www.eggheads.org"
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'openssl' 'tcl' 'zlib')
source=("https://ftp.eggheads.org/pub/${pkgname}/source/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"{,.asc})
b2sums=('80d7b44356f0c5750c276f15412fdb847bc7583c7d1e990735ad4aec1b6bec9822124b089654dfb4dfbd393127804da1019d184d01b867b0dd84ba0342167d94'
        'SKIP')
validpgpkeys=('E01C240484DE7DBE190FE141E7667DE1D1A39AFF')

prepare() {
  cd "${pkgname}-${pkgver}"

  # don't complain about language files on startup
  sed -i "s|\"./language\"|\"/usr/share/${pkgname}/language\"|g" src/eggdrop.h
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure
  make config
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DEST=fakeinstall install

  install -Dm755 "fakeinstall/eggdrop-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "fakeinstall/doc/man1/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" "fakeinstall/modules-${pkgver}/"*

  rm -r fakeinstall/doc/man1
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  mv -v fakeinstall/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  for dir in help language scripts text; do
    mv -v "fakeinstall/${dir}" "${pkgdir}/usr/share/${pkgname}"
  done

  for conf in eggdrop.conf eggdrop-basic.conf; do
    sed -i -e '2,3d' -e "1s@^.*@#!/usr/bin/${pkgname}\n@" \
      -e "s@help/@/usr/share/${pkgname}/help/@g" \
      -e "s@scripts/@/usr/share/${pkgname}/scripts/@g" \
      -e "s@text/@/usr/share/${pkgname}/text/@g" \
      -e "s@modules/@/usr/lib/${pkgname}/@g" \
      "fakeinstall/${conf}"
  done
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" fakeinstall/*.conf
}

# vim:set ts=2 sw=2 et:
