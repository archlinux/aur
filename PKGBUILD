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
pkgrel=1
_waf_version=1.8.12
pkgdesc='my stable and sensible version of the mpv player that does not make me curse when newer upstream versions break and/or change things at random. :)'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
conflicts=('mpv')
provides=('mpv')
source=("$_origpkgname-$pkgver.tar.gz::https://github.com/VittGam/mpv/archive/v$pkgver.tar.gz"
  "https://github.com/VittGam/mpv/commit/26b6d7448421b879a3dab2e619d7e5da630966dd.patch"
  "https://github.com/VittGam/mpv/commit/6167048bed58765ec43b5f28ffd9aa9ab0624551.patch"
  "https://github.com/VittGam/mpv/commit/4664f005b6367cd3193dd91dc16348b97e018998.patch"
  "http://www.freehackers.org/~tnagy/release/waf-${_waf_version}")
sha256sums=('602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e'
  '86619c541c362f43973bbbd1f77325200287e3d38b6e2fe0236079ad7520e835'
  '0c2fd23c38635a4f87f1804264b1a0a9bc59908a47526bda246486e948a5cb01'
  'b3f59380148d6eeb2ed9ed557e2456e6910001cfa8318b1239284160ba98eca7'
  '01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b')

prepare() {
  cd ${_origpkgname}-${pkgver}

  patch -Np1 < "${srcdir}"/26b6d7448421b879a3dab2e619d7e5da630966dd.patch
  patch -Np1 < "${srcdir}"/6167048bed58765ec43b5f28ffd9aa9ab0624551.patch
  patch -Np1 < "${srcdir}"/4664f005b6367cd3193dd91dc16348b97e018998.patch

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_origpkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-encoding \
    --enable-libmpv-shared \
    --enable-zsh-comp

  ./waf build
}

package() {
  cd ${_origpkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
