# Maintainer:
# Contributor: Benjamin Landis <bmlandis2010@gmail.com>

_pkgname="mpv"
pkgname="$_pkgname-vapoursynth-git"
pkgver=0.36.0.r30.ga2dd78fbc0
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (with Vapoursynth enabled)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url='https://github.com/mpv-player/mpv'

depends=(
  'vapoursynth'

  # extra/mpv
  'alsa-lib'
  'desktop-file-utils'
  'ffmpeg'
  'glibc'
  'hicolor-icon-theme'
  'jack'
  'lcms2'
  'libarchive'
  'libarchive.so'
  'libasound.so'
  'libass'
  'libass.so'
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libbluray'
  'libbluray.so'
  'libcdio'
  'libcdio-paranoia'
  'libdrm'
  'libdvdnav'
  'libdvdread'
  'libegl'
  'libgl'
  'libglvnd'
  'libjack.so'
  'libjpeg'
  'libjpeg.so'
  'liblcms2.so'
  'libpipewire'
  'libplacebo'
  'libplacebo.so'
  'libpulse'
  'libpulse.so'
  'librubberband.so'
  'libshaderc_shared.so'
  'libswresample.so'
  'libswscale.so'
  'libva'
  'libva-drm.so'
  'libva-wayland.so'
  'libva-x11.so'
  'libva.so'
  'libvdpau'
  'libx11'
  'libxext'
  'libxinerama'
  'libxkbcommon'
  'libxkbcommon.so'
  'libxpresent'
  'libxrandr'
  'libxss'
  'libxv'
  'luajit'
  'mesa'
  'mujs'
  'rubberband'
  'shaderc'
  'uchardet'
  'vulkan-icd-loader'
  'wayland'
  'zlib'
)
makedepends=(
  # extra/mpv
  'ffnvcodec-headers'
  'git'
  'ladspa'
  'meson'
  'python-docutils'
  'vulkan-headers'
  'wayland-protocols'
)

optdepends=(
  'yt-dlp: for video-sharing websites playback'
  'youtube-dl: for video-sharing websites playback'
)

provides=(
  'libmpv.so'
  'mpv'
)
conflicts=('mpv')

options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _meson_options=(
    --auto-features auto

    -Dlibmpv=true

    -Dcaca=disabled
    -Dcdda=enabled
    -Ddvbin=enabled
    -Ddvdnav=enabled
    -Dlibarchive=enabled

    -Dbuild-date=false
    -Dvapoursynth=enabled
  )

  arch-meson "$_pkgname" build "${_meson_options[@]}"

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # delete private entries only required for static linking 
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "$pkgdir/usr/lib/pkgconfig/mpv.pc"

  install -Dm0644 "$_pkgname/DOCS"/{encoding.rst,tech-overview.txt} \
    -t "$pkgdir/usr/share/doc/mpv"

  install -Dm0644 "$_pkgname/TOOLS/lua"/* \
    -t "$pkgdir/usr/share/mpv/scripts"
}
