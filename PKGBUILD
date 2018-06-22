# mpv-vittgam PKGBUILD by Vittorio Gambaletta <archlinux@vittgam.net>
#
# Based on the mpv 1:0.17.0-3 PKGBUILD
# Original PKGBUILD maintainer: Christian Hesse <mail@eworm.de>
# Original PKGBUILD contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Original PKGBUILD contributor: Eivind Uggedal <eivind@uggedal.com>

_origpkgname=mpv
pkgname=${_origpkgname}-vittgam
epoch=1
pkgver=0.17.0
pkgrel=9
_gitcommit=16b32c9c77b73deb67057ad14c2682a4556ab639
_waf_version=1.8.12
pkgdesc='My stable and sensible version of the mpv player that does not make me curse when newer upstream versions break and/or change things at random. :)'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=(
  'ffmpeg3.4' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
conflicts=("${_origpkgname}")
provides=("${_origpkgname}")
source=("${pkgname}-${_gitcommit}.tar.gz::https://github.com/VittGam/${pkgname}/archive/${_gitcommit}.tar.gz"
  "http://www.freehackers.org/~tnagy/release/waf-${_waf_version}")
sha512sums=('fe975b62cbc7d254b2ad38a24a5dcf4006e89e12b4633464c22aae6e224652ccd1cf17340dfa4c91a440366d8555d5c8ab3e84b79571704b9d88bcd644e0734c'
  '8e47112abb134f965f15a27a600b4453cad3075afb5dadc17f2f6dac33d80ec68b679ac0ebc5f8a0245cbd07ae9fc7b899e69afc1bd021cce74e7af2ab457939')

prepare() {
  cd ${pkgname}-${_gitcommit}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${pkgname}-${_gitcommit}

  PKG_CONFIG_PATH=/usr/lib/ffmpeg3.4/pkgconfig ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-encoding \
    --enable-libmpv-shared \
    --enable-zsh-comp

  ./waf build
}

package() {
  cd ${pkgname}-${_gitcommit}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
