# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>
# Contributor: Frédéric Mangano <fmang+aur@mg0.fr>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - armv7/aarch64 needs to be built with fPIC
# Upstream: https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/community/mpv/PKGBUILD

pkgname=mpv-rpi
_pkgname=mpv
epoch=1
pkgver=0.20.0
pkgrel=1
_waf_version=1.8.12
pkgdesc='mpv with Raspberry Pi support'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg-mmal' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper' 'git')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz"
  "http://www.freehackers.org/~tnagy/release/waf-${_waf_version}")
sha256sums=('fe6ec9d2ded5ce84b963f54b812d579d04f944f4a737f3ae639c4d5d9e842b56'
  '01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b')
provides=('mpv')
conflicts=('mpv')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CFLAGS+=" -fPIC" && CXXFLAGS+=" -fPIC"

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-encoding \
    --enable-libmpv-shared \
    --enable-zsh-comp \
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
