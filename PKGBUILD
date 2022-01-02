# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_pkgname=mpv
pkgname=${_pkgname}-light-pulse
_tag='79b4060a573e83ae42d51d995bca1ccf80690997' # git rev-parse v${pkgver}
pkgver=0.34.0
pkgrel=2
pkgdesc="Free, open source, and cross-platform media player – with selection of features (pulse, dvd and cd support)."
arch=(i686 x86_64)
# We link against libraries that are licensed GPLv3 explicitly, so our
# package is GPLv3 only as well. (Is this still correct?)
license=('GPL3')
url="https://mpv.io"
depends=(libcdio-paranoia libdvdnav ffmpeg libxkbcommon libxrandr libxss lua52 uchardet libxinerama vulkan-icd-loader shaderc libplacebo libpulse)
makedepends=(git python-docutils wayland-protocols wayland vulkan-headers waf)
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
