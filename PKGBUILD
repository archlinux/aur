# $Id: PKGBUILD 183309 2016-07-19 18:14:46Z alucryd $
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv-sndio
_basepkg=mpv
epoch=1
pkgver=0.18.1
pkgrel=1
_waf_version=1.8.12
pkgdesc='a free, open source, and cross-platform media player (with sndio support)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
  'sndio'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=('mpv')
provides=('mpv')
options=('!emptydirs' '!buildflags')
source=("$_basepkg-$pkgver.tar.gz::https://github.com/mpv-player/$_basepkg/archive/v$pkgver.tar.gz"
  "http://www.freehackers.org/~tnagy/release/waf-${_waf_version}")
sha256sums=('e413d57fec4ad43b9f9b848f38d13fb921313fc9a4a64bf1e906c8d0f7a46329'
  '01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b')

prepare() {
  cd ${_basepkg}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_basepkg}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-encoding \
    --enable-libmpv-shared \
    --enable-zsh-comp \
    --enable-sndio

  ./waf build
}

package() {
  cd ${_basepkg}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
