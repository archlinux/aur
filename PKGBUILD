# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-desktop-libmpv-git
epoch=1
pkgver=0.r55016.6242788
pkgrel=3
pkgdesc='libmpv for jellyfin-desktop'
arch=('x86_64')
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
url='https://mpv.io/'
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'glibc' 'hicolor-icon-theme'
         'jack' 'lcms2' 'libarchive' 'libass' 'libbluray' 'libcdio'
         'libcdio-paranoia' 'libdisplay-info' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl'
         'libglvnd' 'libjpeg-turbo' 'libplacebo' 'libpulse' 'libsixel' 'libva'
         'libvdpau' 'libx11' 'libxext' 'libxkbcommon' 'libxpresent' 'libxrandr'
         'libxss' 'libxv' 'luajit' 'mesa' 'mujs' 'libpipewire' 'rubberband' 'sdl2'
         'openal' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland' 'zlib')
makedepends=('git' 'meson' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers' 'pacman-contrib')
optdepends=('yt-dlp: for video-sharing websites playback')
provides=('jellyfin-desktop-libmpv')
replaces=('jellyfin-desktop-cef-libmpv-git')
options=('!emptydirs')
source=('git+https://github.com/andrewrabert/mpv#branch=cef-mpv'
        'find-deps.py')
sha256sums=('SKIP'
            '1ba780ede4a28b68ae5b7ab839958ff91ed01d3c6c1d24cce8a5dd24492f8d2b')

pkgver() {
  cd "$srcdir/mpv"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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

  arch-meson mpv build "${_meson_options[@]}"

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

  install -Dm755 build/libmpv.so.2 "${pkgdir}/opt/jellyfin-desktop/libmpv/lib/libmpv.so.2"

  ln -s libmpv.so.2 "${pkgdir}/opt/jellyfin-desktop/libmpv/lib/libmpv.so"

  install -Dm644 -t "${pkgdir}/opt/jellyfin-desktop/libmpv/include/mpv" \
    mpv/include/mpv/client.h \
    mpv/include/mpv/render.h \
    mpv/include/mpv/render_gl.h \
    mpv/include/mpv/stream_cb.h

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($(python3 "$srcdir"/find-deps.py "$pkgdir"/opt/jellyfin-desktop/libmpv/lib/libmpv.so.2))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends+=("${_detected_depends[@]}")
}
