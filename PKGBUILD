# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: kaptoxic <kaptoxic@yahoo.com>
# Contributor: Arthur Skowronek <eisensheng@mailbox.org>

pkgname=librtmp0
pkgver=2.4
pkgrel=5
pkgdesc='Toolkit for RTMP streams'
arch=('x86_64')
url='https://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('glibc' 'gnutls' 'zlib')
makedepends=('git')
provides=('librtmp.so')
options=('!makeflags')
_commit='c28f1bab7822de97353849e7787b59e50bbb1428'
source=("git+https://git.ffmpeg.org/rtmpdump#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd rtmpdump
  git cherry-pick -n eea470fa5f9a5481a36dedd257549595ef7480d6
  git cherry-pick -n 8e3064207fa7535baad07fd06b65630ec8b31a08
  git cherry-pick -n 7340f6dbc6b3c8e552baab2e5a891c2de75cddcc
}

build() {
  cd rtmpdump
  sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile

  make \
    OPT="$CFLAGS" \
    XLDFLAGS="$LDFLAGS"
}

package() {
  cd rtmpdump

  make \
    prefix='/usr' \
    sbindir='/usr/bin' \
    mandir='/usr/share/man' \
    DESTDIR="${pkgdir}" \
    install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{librtmp.{a,so},pkgconfig},share}
}

# vim: ts=2 sw=2 et:
