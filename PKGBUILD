# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>
# Contributor: Frédéric Mangano <fmang+aur@mg0.fr>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - armv7/aarch64 needs to be built with fPIC

pkgname=mpv-rpi
_pkgname=mpv
epoch=1
pkgver=0.16.0
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper' 'git')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
provides=('mpv')
conflicts=('mpv')
install=mpv.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fc3619de0ede16fbb023ac72589090e8e77fd9d9e03a81adc728105d50ef38ba')

prepare() {
  cd ${_pkgname}-${pkgver}

  ./bootstrap.py
}

build() {
  cd ${_pkgname}-${pkgver}

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CFLAGS+=" -fPIC" && CXXFLAGS+=" -fPIC"

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-cdda \
    --enable-egl-x11 \
    --enable-rpi

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
