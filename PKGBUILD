# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

_pkgname=mpv
pkgname=${_pkgname}-light
pkgver=0.32.0
pkgrel=1
_waf_version=2.0.9
pkgdesc="Free, open source, and cross-platform media player – with selection of features."
arch=(i686 x86_64)
url="https://mpv.io"
license=(GPL)
depends=(ffmpeg libxkbcommon libxrandr libxss lua52 uchardet libxinerama vulkan-icd-loader shaderc libplacebo)
makedepends=(mesa python-docutils wayland-protocols wayland vulkan-headers)
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "https://waf.io/waf-${_waf_version}")
sha256sums=('9163f64832226d22e24bbc4874ebd6ac02372cd717bef15c28a0aa858c5fe592'
            '2a8e0816f023995e557f79ea8940d322bec18f286917c8f9a6fa2dc3875dfa48')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-libmpv-shared \
    --disable-libarchive \
    --disable-libbluray \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-oss-audio \
    --disable-rsound \
    --disable-pulse \
    --disable-jack \
    --disable-opensles \
    --disable-xv \
    --disable-caca

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="${pkgdir}"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}"/usr/share/doc/mpv
}
