# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_pkgname=mpv
pkgname=${_pkgname}-light-pulse
_tag='33f10b1aee5fef45960728fe8595d1603c8a9a85' # git rev-parse v${pkgver}
pkgver=0.35.0
pkgrel=1
pkgdesc="Free, open source, and cross-platform media player – with selection of features (pulse, dvd and cd support)."
arch=(i686 x86_64)
# We link against libraries that are licensed GPLv3 explicitly, so our
# package is GPLv3 only as well. (Is this still correct?)
license=('GPL3')
url="https://mpv.io"
depends=('libcdio-paranoia' 'libdvdnav' 'ffmpeg' 'libxkbcommon' 'libxrandr' 'libxss' 'luajit' 'uchardet' 'libxinerama' 'vulkan-icd-loader' 'shaderc' 'libplacebo' 'libpulse' 'libxpresent')
makedepends=('git' 'python-docutils' 'wayland-protocols' 'wayland' 'vulkan-headers' 'waf')
optdepends=('yt-dlp: for video-sharing websites playback'
            'youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=("git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed")
sha256sums=(SKIP)

build() {
  cd ${_pkgname}

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvdnav \
    --enable-libmpv-shared \
    --disable-libarchive \
    --disable-libbluray \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-jack \
    --disable-opensles \
    --disable-xv \
    --disable-build-date \
    --disable-caca

  waf build
}

package() {
  cd ${_pkgname}

  waf install --destdir="${pkgdir}"

  install -m0644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv

  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir"/usr/share/mpv/scripts
}
# vim:set ts=2 sw=2 et:
