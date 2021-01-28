# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Keep an eye on https://github.com/archlinux/svntogit-community/commits/packages/mpv/trunk for changes

_pkgname=mpv
pkgname=${_pkgname}-light-pulse
pkgver=0.33.0
pkgrel=1
pkgdesc="Free, open source, and cross-platform media player – with selection of features (pulse, dvd and cd support)."
arch=(i686 x86_64)
url="https://mpv.io"
license=(GPL)
depends=(libcdio-paranoia libdvdnav ffmpeg libxkbcommon libxrandr libxss lua52 uchardet libxinerama vulkan-icd-loader shaderc libplacebo libpulse)
makedepends=(git python-docutils wayland-protocols wayland vulkan-headers waf)
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_tag='d5ae9f70ea1f21c1d3794df5345a6a9366188660' # git rev-parse v${pkgver}
source=(git+https://github.com/mpv-player/mpv.git#tag=${_tag})
sha256sums=(SKIP)

prepare() {
	cd ${_pkgname}

  # vo_gpu: placebo: update for upstream API changes
  git cherry-pick -n 7c4465cefb27d4e0d07535d368febdf77b579566
}

build() {
  cd ${_pkgname}

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
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
    --disable-caca

  waf build
}

package() {
  cd ${_pkgname}

  waf install --destdir="${pkgdir}"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}"/usr/share/doc/mpv
}
