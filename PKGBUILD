# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>
_pkgname=mpv
pkgname="${_pkgname}-caca"
epoch=1
_tag='df6d84c1cf4bbc2b998f4d320542c78df674512d' # git rev-parse v${pkgver}
pkgver=0.34.1
pkgrel=5
pkgdesc='a free, open source, and cross-platform media player (libcaca support)'
arch=('x86_64')
# We link against libraries that are licensed GPLv3 explicitly, so our
# package is GPLv3 only as well. (Is this still correct?)
license=('GPL3')
url='https://mpv.io/'
depends=('alsa-lib' 'libasound.so' 'desktop-file-utils' 'ffmpeg5.1' 'libavcodec.so' 'libavdevice.so'
         'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
         'glibc' 'hicolor-icon-theme' 'jack' 'libjack.so' 'lcms2' 'liblcms2.so' 'libarchive'
         'libarchive.so' 'libass' 'libass.so' 'libbluray' 'libbluray.so' 'libcaca' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl' 'libglvnd'
         'libjpeg' 'libjpeg.so' 'libplacebo4.208' 'libplacebo.so' 'libpulse' 'libpulse.so'
         'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so' 'libvdpau' 'libx11'
         'libxext' 'libxinerama' 'libxkbcommon' 'libxkbcommon.so' 'libxrandr' 'libxss'
         'libxv' 'lua52' 'mesa' 'mujs' 'rubberband' 'librubberband.so' 'shaderc'
         'libshaderc_shared.so' 'uchardet' 'vulkan-icd-loader' 'wayland' 'xdg-utils'
         'zlib')
makedepends=('git' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers' 'waf')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('libmpv.so' 'mpv' 'mpv0.34')
# conflicts=('mpv')
options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=("git+https://github.com/mpv-player/mpv.git#tag=${_tag}?signed")
sha256sums=('SKIP')
prepare() {
  cd ${_pkgname}
  git cherry-pick -n \
    '79bfcc672343ddbc348e040ad899d61a0bafc050' \
    'fc94c8c365ebeb038af6052bf4ea0506c1220559'
}
build() {
  cd ${_pkgname}
  local _cflags=("-Wl,-rpath"
                 "-I/usr/include/ffmpeg5.1"
                 "-L/usr/lib/ffmpeg5.1"
                 "-lavfilter"
                 "-lavformat"
                 "-lavcodec"
                 "-lavswscale"
                 "-I/usr/include/libplacebo-4.208"
                 "-L/usr/lib/libplacebo-4.208")
  local _ldflags=("-lpostproc")
  export CCXFLAGS="${_cflags[*]}"
  export CFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg5.1/pkgconfig:$PKG_CONFIG_PATH"
  export LIBDIR="/usr/lib/${pkgname}"
  export DATADIR="/usr/share/${pkgname}"
  export INCLUDEDIR="/usr/include/${pkgname}"
 
  CCXFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  LIBDIR="/usr/lib/${pkgname}" \
  DATADIR="/usr/share/${pkgname}" \
  INCLUDEDIR="/usr/include/${pkgname}" \
  waf configure --prefix=/usr \
    --libdir="/usr/lib/${pkgname}" \
    --includedir="/usr/include/${pkgname}" \
    --confdir="/etc/${pkgname}" \
    --docdir="/usr/share/doc/${pkgname}" \
    --disable-manpage-build \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-libarchive \
    --disable-vulkan \
    --enable-libmpv-shared \
    --disable-build-date

  LIBDIR="/usr/lib/mpv-caca" \
  CCXFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  LIBDIR="/usr/lib/${pkgname}" \
  DATADIR="/usr/share/${pkgname}" \
  INCLUDEDIR="/usr/include/${pkgname}" \
  waf build
}

package() {
  cd ${_pkgname}
  export LIBDIR="/usr/lib/${pkgname}"
  export DATADIR="/usr/share/${pkgname}"
  export INCLUDEDIR="/usr/include/${pkgname}"
 
  LIBDIR="/usr/lib/${pkgname}" \
  DATADIR="/usr/share/${pkgname}" \
  INCLUDEDIR="/usr/include/${pkgname}" \
  waf install --destdir="$pkgdir"
  rm -rf "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir/usr/share/${pkgname}/scripts"
  cd "${pkgdir}/usr/bin"
  mv "${_pkgname}" "${pkgname}"
  cd "${pkgdir}/usr/share"
  mv "applications/${_pkgname}.desktop" "applications/${pkgname}.desktop"
  mv "bash-completion/completions/${_pkgname}" \
     "bash-completion/completions/${pkgname}"
  rm -rf "icons"
  mv "zsh/site-functions/_${_pkgname}" "zsh/site-functions/_${pkgname}"
}
