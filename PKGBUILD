# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

_pkgname=mpv
_variant="caca"
pkgname="${_pkgname}-${_variant}"
epoch=1
_tag='df6d84c1cf4bbc2b998f4d320542c78df674512d' # git rev-parse v${pkgver}
pkgver=0.34.1
pkgrel=6
_pkgdesc=('a free, open source, and cross-platform'
	  "media player (lib${_variant} support)")
pkgdesc="${_pkgdesc[*]}"
arch=(
  x86_64
  i686
  pentium4
  aarm64
  armv7h
  armv6l
  powerpc
)
# We link against libraries that are licensed GPLv3 explicitly, so our
# package is GPLv3 only as well. (Is this still correct?)
license=(
  GPL3)
url="https://${_pkgname}.io"
_ns="${_pkgname}-player"
_url="https://github.com/${_ns}/${_pkgname}"
depends=(
  'alsa-lib'
  'libasound.so'
  'desktop-file-utils'
  'ffmpeg5.1'
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libswresample.so'
  'libswscale.so'
  'glibc'
  'hicolor-icon-theme'
  'jack'
  'libjack.so'
  'lcms2'
  'liblcms2.so'
  'libarchive'
  'libarchive.so'
  'libass'
  'libass.so'
  'libbluray'
  'libbluray.so'
  "lib${_variant}"
  'libcdio'
  'libcdio-paranoia'
  'libdrm'
  'libdvdnav'
  'libdvdread'
  'libegl'
  'libgl'
  'libglvnd'
  'libjpeg'
  'libjpeg.so'
  'libplacebo4.208'
  'libplacebo.so'
  'libpulse'
  'libpulse.so'
  'libva'
  'libva.so'
  'libva-drm.so'
  'libva-wayland.so'
  'libva-x11.so'
  'libvdpau'
  'libx11'
  'libxext'
  'libxinerama'
  'libxkbcommon'
  'libxkbcommon.so'
  'libxrandr'
  'libxss'
  'libxv'
  'lua52'
  'mesa'
  'mujs'
  'rubberband'
  'librubberband.so'
  'shaderc'
  'libshaderc_shared.so'
  'uchardet'
  'vulkan-icd-loader'
  'wayland'
  'xdg-utils'
  'zlib'
)
makedepends=(
  'git'
  'python-docutils'
  'ladspa'
  'wayland-protocols'
  'ffnvcodec-headers'
  'vulkan-headers'
  'waf'
)
optdepends=(
  'youtube-dl: for video-sharing websites playback'
)
provides=(
  "lib${_pkgname}.so"
  "${_pkgname}"
  "${_pkgname}0.34"
)
options=(
  '!emptydirs'
)
validpgpkeys=(
  '145077D82501AA20152CACCE8D769208D5E31419'  # sfan5 <sfan5@live.de>
)
source=(
  "git+${_url}.git#tag=${_tag}?signed"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd ${_pkgname}
  git cherry-pick -n \
    '79bfcc672343ddbc348e040ad899d61a0bafc050' \
    'fc94c8c365ebeb038af6052bf4ea0506c1220559'
}

build() {
  cd ${_pkgname}
  local _cflags=() \
	_confdir \
	_datadir \
	_docdir \
        _includedir \
	_ldflags=() \
	_libdir \
	_pkg_config_path=() \
	_prefix="/usr"
	_waf_opts=()
  _confdir="/etc/${pkgname}"
  _datadir="${_prefix}/share/${pkgname}"
  _docdir="${_prefix}/share/doc/${pkgname}"
  _includedir="${_prefix}/include/${pkgname}"
  _libdir="${_prefix}/lib/${pkgname}"
  _cflags=(
    "-Wl,-rpath"
    "-I${_prefix}/include/ffmpeg5.1"
    "-L${_prefix}/lib/ffmpeg5.1"
    "-lavfilter"
    "-lavformat"
    "-lavcodec"
    "-lavswscale"
    "-I${_prefix}/include/libplacebo-4.208"
    "-L${_prefix}/lib/libplacebo-4.208"
  )
  _ldflags=(
    "-lpostproc"
  )
  _pkg_config_path=(
    "${_prefix}/lib/ffmpeg5.1/pkgconfig"
    "${PKG_CONFIG_PATH}")
  _waf_opts=(
    --prefix="${_prefix}"
    --libdir="${_libdir}"
    --includedir="${_includedir}"
    --confdir="${_confdir}"
    --docdir="${_docdir}"
    --disable-manpage-build
    --enable-cdda
    --enable-dvb
    --enable-dvdnav
    --enable-libarchive
    --disable-vulkan
    "--enable-lib${_pkgname}-shared"
    --disable-build-date
  )
  export CCXFLAGS="${_cflags[*]}"
  export CFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PKG_CONFIG_PATH="$(IFS=: ; \
	                    echo "${_pkg_config_path[*]}")"
  export DATADIR="${_datadir}"
  export INCLUDEDIR="${_includedir}"
  export LIBDIR="${_libdir}"
 
  CCXFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  DATADIR="${_datadir}" \
  INCLUDEDIR="${_includedir}" \
  LIBDIR="${_libdir}" \
    waf configure "${_waf_opts[@]}"

  CCXFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  DATADIR="${_datadir}" \
  INCLUDEDIR="${_includedir}" \
  LIBDIR="${_libdir}" \
    waf build
}

package() {
  local _datadir \
	_includedir \
	_libdir
  _datadir="/usr/share/${pkgname}"
  _docdir="/usr/share/doc/${_pkgname}"
  _includedir="/usr/include/${pkgname}"
  _libdir="/usr/lib/${pkgname}"
  cd ${_pkgname}
  export DATADIR="${_datadir}"
  export INCLUDEDIR="${_includedir}"
  export LIBDIR="${_libdir}"
 
  DATADIR="${_datadir}" \
  INCLUDEDIR="${_includedir}" \
  LIBDIR="${_libdir}" \
    waf install --destdir="${pkgdir}"
  install -D \
	  -m0644 \
	  "TOOLS/lua/"* \
	  -t "${pkgdir}${_datadir}/scripts"
  cd "${pkgdir}/usr/bin"
  mv "${_pkgname}" \
     "${pkgname}"
  cd "${pkgdir}/usr/share"
  mv "applications/${_pkgname}.desktop" \
     "applications/${pkgname}.desktop"
  mv "bash-completion/completions/${_pkgname}" \
     "bash-completion/completions/${pkgname}"
  rm -rf "icons"
  mv "zsh/site-functions/_${_pkgname}" \
     "zsh/site-functions/_${pkgname}"
}

# vim:set sw=2 sts=-1 et:
