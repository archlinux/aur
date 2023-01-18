# Maintainer: Benjamin Landis <bmlandis2010@gmail.com>

pkgname=mpv-vapoursynth
_tag='33f10b1aee5fef45960728fe8595d1603c8a9a85' # git rev-parse v${pkgver}
pkgver=0.35.0
pkgrel=3
pkgdesc='A free, open source, and cross-platform media player (with Vapoursynth libs)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url='https://mpv.io/'
depends=('alsa-lib' 'libasound.so' 'desktop-file-utils' 'ffmpeg' 'libavcodec.so' 'libavdevice.so'
         'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
         'glibc' 'hicolor-icon-theme' 'jack' 'libjack.so' 'lcms2' 'liblcms2.so' 'libarchive'
         'libarchive.so' 'libass' 'libass.so' 'libbluray' 'libbluray.so' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl' 'libglvnd'
         'libjpeg' 'libjpeg.so' 'libplacebo' 'libplacebo.so' 'libpulse' 'libpulse.so'
         'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so' 'libvdpau' 'libx11'
         'libxext' 'libxinerama' 'libxkbcommon' 'libxkbcommon.so' 'libxpresent' 'libxrandr' 'libxss'
         'libxv' 'lua52' 'mesa' 'mujs' 'pipewire' 'rubberband' 'librubberband.so' 'shaderc'
         'libshaderc_shared.so' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland' 'zlib')
makedepends=('git' 'meson' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=("git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed")
sha256sums=('SKIP')

build() {

  local _meson_options=(
    --auto-features auto

    -Dlibmpv=true

    -Dcaca=disabled
    -Dcdda=enabled
    -Ddvbin=enabled
    -Ddvdnav=enabled
    -Dlibarchive=enabled
    -Dvapoursynth=enabled
  )

  arch-meson mpv build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -m0644 mpv/DOCS/{encoding.rst,tech-overview.txt} \
    "${pkgdir}"/usr/share/doc/mpv

  install -m0644 mpv/TOOLS/lua/* \
    -D -t "${pkgdir}"/usr/share/mpv/scripts
}
