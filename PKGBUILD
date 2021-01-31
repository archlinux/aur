# Maintainer: Benjamin Landis <bmlandis2010@gmail.com>

pkgname=mpv-vapoursynth
pkgver=0.33.0
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (with Vapoursynth libs)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
url='https://mpv.io/'
depends=('alsa-lib' 'libasound.so' 'desktop-file-utils' 'ffmpeg' 'libavcodec.so' 'libavdevice.so'
         'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
         'glibc' 'hicolor-icon-theme' 'jack' 'libjack.so' 'lcms2' 'liblcms2.so' 'libarchive'
         'libarchive.so' 'libass' 'libass.so' 'libbluray' 'libbluray.so' 'libcaca' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl' 'libglvnd'
         'libjpeg' 'libjpeg.so' 'libplacebo' 'libplacebo.so' 'libpulse' 'libpulse.so'
         'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so' 'libvdpau' 'libx11'
         'libxext' 'libxinerama' 'libxkbcommon' 'libxkbcommon.so' 'libxrandr' 'libxss'
         'libxv' 'lua52' 'mesa' 'mujs' 'rubberband' 'librubberband.so' 'shaderc'
         'libshaderc_shared.so' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland'
         'xdg-utils' 'zlib')
makedepends=('git' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers' 'waf')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
source=("mpv-${pkgver}.tar.gz"::"https://github.com/mpv-player/mpv/archive/v${pkgver}.tar.gz"
        '010-mpv-libplacebo-fix.patch'::'https://github.com/mpv-player/mpv/commit/7c4465cefb27d4e0d07535d368febdf77b579566.patch')
sha256sums=('f1b9baf5dc2eeaf376597c28a6281facf6ed98ff3d567e3955c95bf2459520b4'
            'a9f656a163e17a33050ea3ffe51203b948168437c87038239fc3a2424927b35a')

prepare() {
    patch -d "mpv-${pkgver}" -Np1 -i "${srcdir}/010-mpv-libplacebo-fix.patch"
}

build() {
  cd mpv-${pkgver}

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-libarchive \
    --enable-libmpv-shared \
    --disable-build-date \
    --enable-vapoursynth

  waf build
}

package() {
  cd mpv-${pkgver}

  waf install --destdir="$pkgdir"

  install -m0644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv

  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir"/usr/share/mpv/scripts
}
