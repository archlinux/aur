# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

_pkgname=mpv
pkgname=${_pkgname}-light
pkgver=0.33.1
pkgrel=1
pkgdesc="Free, open source, and cross-platform media player – with selection of features."
arch=(i686 x86_64)
url="https://mpv.io"
license=(GPL)
depends=(ffmpeg libxkbcommon libxrandr libxss lua52 uchardet libxinerama vulkan-icd-loader shaderc libplacebo)
makedepends=(git python-docutils wayland-protocols wayland vulkan-headers waf)
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_tag='d5ae9f70ea1f21c1d3794df5345a6a9366188660' # git rev-parse v${pkgver}
source=(git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed)
sha256sums=(SKIP)
validpgpkeys=(145077D82501AA20152CACCE8D769208D5E31419) # sfan5 <sfan5@live.de>

build() {
  cd ${_pkgname}

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-libmpv-shared \
    --disable-libarchive \
    --disable-libbluray \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-pulse \
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
