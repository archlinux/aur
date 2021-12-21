# Maintainer: lod <aur@cyber-anlage.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_pkgname=mpv
pkgname=${_pkgname}-pipewire
_tag='v0.34.0' # git rev-parse v${pkgver}
pkgver=0.34.0
pkgrel=2
pkgdesc='a free, open source, and cross-platform media player including an experimental PipeWire audio backend'
arch=('x86_64')
# We link against libraries that are licensed GPLv3 explicitly, so our
# package is GPLv3 only as well. (Is this still correct?)
license=('GPL3')
url='https://mpv.io/'
depends=('alsa-lib' 'libasound.so' 'desktop-file-utils' 'ffmpeg' 'libavcodec.so' 'libavdevice.so'
         'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
         'glibc' 'hicolor-icon-theme' 'jack' 'libjack.so' 'lcms2' 'liblcms2.so' 'libarchive'
         'libarchive.so' 'libass' 'libass.so' 'libbluray' 'libbluray.so' 'libcaca' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl' 'libglvnd'
         'libjpeg' 'libjpeg.so' 'libplacebo' 'libplacebo.so>=120-64' 'libpulse' 'libpulse.so'
         'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so' 'libvdpau' 'libx11'
         'libxext' 'libxinerama' 'libxkbcommon' 'libxkbcommon.so' 'libxrandr' 'libxss'
         'libxv' 'lua52' 'mesa' 'mujs' 'pipewire' 'rubberband' 'librubberband.so' 'shaderc'
         'libshaderc_shared.so' 'uchardet' 'vulkan-icd-loader' 'wayland' 'xdg-utils'
         'zlib')
makedepends=('git' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers' 'waf')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('libmpv.so' 'mpv')
conflicts=('mpv')
options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=("git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed"
        "01-Add-PipeWire-audio-backend-by-Oschowa.patch"
        "02-ao_pipewire-fixes-and-media-control-by-t-8ch.patch")
sha256sums=('SKIP'
            'd72a5863bceb5ac542c656ff85a9cb23d27d30c1609022e1b1735744f2777aaf'
            '1b1e69f06225b1f6c9a6ffdc7d3acccfcee3d25c350e4d1a0ab66f5dcb0d3bf3')

prepare() {
  cd ${_pkgname}

  git cherry-pick -n \
    '79bfcc672343ddbc348e040ad899d61a0bafc050' \
    'fc94c8c365ebeb038af6052bf4ea0506c1220559'
    
  # patch mpv with the PipeWire audio backend
  #https://github.com/Oschowa/mpv/commit/fddb143282fa74425a8a6f29c9566e51777759d0
  patch -Np1 -i ../01-Add-PipeWire-audio-backend-by-Oschowa.patch
  # add ao_pipewire fixes and media control
  # https://github.com/Oschowa/mpv/pull/1
  patch -Np1 -i ../02-ao_pipewire-fixes-and-media-control-by-t-8ch.patch
}

build() {
  cd ${_pkgname}

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-libarchive \
    --enable-libmpv-shared \
    --disable-build-date

  waf build
}

package() {
  cd ${_pkgname}

  waf install --destdir="$pkgdir"

  install -m0644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv

  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir"/usr/share/mpv/scripts
}
 
