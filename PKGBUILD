# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv-phoenix
epoch=1
pkgver=0.41.0
pkgrel=3
_commit=ad0e943a93854a888d1bea22ed25e6b1f2dc1b18
_srcname=mpv-${_commit}
pkgdesc='A fork of mpv with HDR support on X11'
arch=('x86_64')
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
url='https://github.com/dec05eba/mpv'
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'glibc' 'hicolor-icon-theme'
         'jack' 'lcms2' 'libarchive' 'libass' 'libbluray' 'libcdio'
         'libcdio-paranoia' 'libdisplay-info' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl'
         'libglvnd' 'libjpeg-turbo' 'libplacebo' 'libpulse' 'libsixel' 'libva'
         'libvdpau' 'libx11' 'libxext' 'libxkbcommon' 'libxpresent' 'libxrandr'
         'libxss' 'libxv' 'luajit' 'mesa' 'mujs' 'libpipewire' 'rubberband' 'sdl2'
         'openal' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland' 'zlib')
makedepends=('meson' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers')
optdepends=('yt-dlp: for video-sharing websites playback')
provides=("mpv=${epoch}:${pkgver}" 'libmpv.so')
conflicts=('mpv')
options=('!emptydirs')
source=("${_srcname}.tar.gz::https://github.com/dec05eba/mpv/archive/${_commit}.tar.gz")
sha256sums=('1aae7a3948bdf589b17a5a61b2bb7af692a80fa88450e36bc0be2057348a65d0')

build() {
  local _meson_options=(
    --auto-features auto

    -Dlibmpv=true
    -Dgl-x11=enabled
    -Dcaca=disabled
    -Dcdda=enabled
    -Ddrm=enabled
    -Ddvbin=enabled
    -Ddvdnav=enabled
    -Dlibarchive=enabled
    -Dopenal=enabled
    -Dsdl2-audio=enabled
    -Dsdl2-video=enabled
    -Dsdl2-gamepad=enabled
  )

  arch-meson "${_srcname}" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  depends+=('libasound.so' 'libavcodec.so' 'libavdevice.so' 'libavfilter.so'
            'libavformat.so' 'libavutil.so' 'libdisplay-info.so' 'libswresample.so' 'libswscale.so'
            'libjack.so' 'liblcms2.so' 'libarchive.so' 'libass.so' 'libbluray.so'
            'libjpeg.so' 'libplacebo.so' 'libpulse.so' 'libva.so' 'libva-drm.so'
            'libva-wayland.so' 'libva-x11.so' 'libxkbcommon.so' 'librubberband.so')

  meson install -C build --destdir "${pkgdir}"

  # delete private entries only required for static linking
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}"/usr/lib/pkgconfig/mpv.pc

  install -m0644 "${_srcname}"/DOCS/{encoding.rst,tech-overview.txt} \
    "${pkgdir}"/usr/share/doc/mpv

  install -m0644 "${_srcname}"/TOOLS/{umpv,mpv_identify.sh,stats-conv.py,idet.sh,lua/*} \
    -D -t "${pkgdir}"/usr/share/mpv/scripts
}
