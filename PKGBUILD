# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gst-plugins-rs"
pkgbase="lib32-${_name}"
_plugins=('aws' 'cdg' 'claxon' 'dav1d' 'fallbackswitch' 'ffv1' 'fmp4' 'gif'
          'gopbuffer' 'gtk4' 'hlssink3' 'hsv' 'json' 'lewton' 'livesync' 'mp4'
          'mpegtslive' 'originalbuffer' 'quinn' 'raptorq' 'rav1e' 'regex'
          'reqwest' 'rsaudiofx' 'rsclosedcaption' 'rsfile' 'rsflv' 'rsinter'
          'rsonvif' 'rspng' 'rsrtp' 'rsrtsp' 'rstracers' 'rsvideofx' 'rswebp'
          'rswebrtc' 'sodium' 'spotify' 'textahead' 'textwrap' 'threadshare'
          'togglerecord' 'webrtchttp')
pkgname=("${_plugins[@]/#/lib32-gst-plugin-}")
pkgver=0.13.5
pkgrel=1
pkgdesc="Multimedia graph framework"
url="https://gstreamer.freedesktop.org"
_url="https://gitlab.freedesktop.org/gstreamer/${_name}"
arch=('x86_64')
license=('MPL-2.0')
depends=('lib32-gcc-libs' 'lib32-glib2>=2.62' 'lib32-glibc' 'lib32-gstreamer>=1.23.90')
makedepends=('cargo-c>=0.9.21' 'git' 'lib32-cairo' 'lib32-dav1d>=1.3' 'lib32-graphene'
             'lib32-gst-plugins-bad' 'lib32-gst-plugins-base'
             'lib32-gst-plugins-base-libs' 'lib32-gst-plugins-good'
             'lib32-gtk4>=4.6' 'lib32-libsodium' 'lib32-openssl>=1.1' 'lib32-pango'
             'lib32-rust-libs' 'meson>=1.1' 'nasm' 'rust>=1.40')
options=('!lto')
source=("git+${_url}.git?signed#tag=${pkgver}")
b2sums=('19cec72c581f2e2484c110cc429b0775e7036e33bf37033cf27e807c45e799699cf7bbbcdec82b93e6ed5ea17e456b1fbc32e8619f46f82e2067197037f7691e')
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5') # Sebastian Dröge <sebastian@centricular.com>

# Link with libsodium from system
# export SODIUM_USE_PKG_CONFIG=1
# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2
# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd "${srcdir}/${_name}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local meson_options=(
    "${_name}"
    "${_name}/build"
    --cross-file lib32
    --libexecdir lib32
    -D csound=disabled   
    -D ndi=disabled   
    -D uriplaylistbin=disabled
    -D sodium-source=system
    -D doc=disabled
    -D examples=disabled
    -D tests=disabled
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_name}/build"
}

# check() {
#   export RUSTUP_TOOLCHAIN=stable 
# 
#   cd "${srcdir}"
#   meson test -C "${_name}/build" --print-errorlogs
# }

package_lib32-gst-plugin-aws() {
  pkgdesc+=" - aws plugin (32-bit)"
  depends+=("lib32-gst-plugin-hlssink3=${pkgver}-${pkgrel}"
            'lib32-gst-plugins-bad' 'lib32-gst-plugins-base-libs'
            'lib32-openssl>=1.1')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-cdg() {
  pkgdesc+=" - cdg plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-claxon() {
  pkgdesc+=" - claxon plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-dav1d() {
  pkgdesc+=" - dav1d plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-dav1d>=1.3' 'lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-fallbackswitch() {
  pkgdesc+=" - fallbackswitch plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs' 'lib32-gst-plugins-good')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-ffv1() {
  pkgdesc+=" - ffv1 plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-fmp4() {
  pkgdesc+=" - fmp4 plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-gif() {
  pkgdesc+=" - gif plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-gopbuffer() {
  pkgdesc+=" - gopbuffer plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-gtk4() {
  pkgdesc+=" - gtk4 plugin (32-bit)"
  depends+=('lib32-graphene' 'lib32-gst-plugins-base-libs' 'lib32-gtk4>=4.6')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-hlssink3() {
  pkgdesc+=" - hlssink3 plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-hsv() {
  pkgdesc+=" - hsv plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-json() {
  pkgdesc+=" - json plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-lewton() {
  pkgdesc+=" - lewton plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-livesync() {
  pkgdesc+=" - livesync plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-mp4() {
  pkgdesc+=" - mp4 plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-mpegtslive() {
  pkgdesc+=" - mpegtslive plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-originalbuffer() {
  pkgdesc+=" - originalbuffer plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-quinn() {
  pkgdesc+=" - quinn plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-raptorq() {
  pkgdesc+=" - raptorq plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rav1e() {
  pkgdesc+=" - rav1e plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-regex() {
  pkgdesc+=" - regex plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-reqwest() {
  pkgdesc+=" - reqwest plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-openssl>=1.1')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsaudiofx() {
  pkgdesc+=" - rsaudiofx plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsclosedcaption() {
  pkgdesc+=" - rsclosedcaption plugin (32-bit)"
  depends+=("lib32-gst-plugin-aws=${pkgver}-${pkgrel}"
            "lib32-gst-plugin-textwrap=${pkgver}-${pkgrel}" 'lib32-cairo'
            'lib32-gst-plugins-bad' 'lib32-gst-plugins-base-libs' 'lib32-pango')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsfile() {
  pkgdesc+=" - rsfile plugin (32-bit)"
  license=('MIT OR Apache-2.0')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsflv() {
  pkgdesc+=" - rsflv plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsinter() {
  pkgdesc+=" - rsinter plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsonvif() {
  pkgdesc+=" - rsonvif plugin (32-bit)"
  depends+=('lib32-cairo' 'lib32-gst-plugins-base-libs' 'lib32-pango')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rspng() {
  pkgdesc+=" - rspng plugin (32-bit)"
  license=('MIT OR Apache-2.0')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsrtp() {
  pkgdesc+=" - rsrtp plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsrtsp() {
  pkgdesc+=" - rsrtsp plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs' 'lib32-gst-plugins-good')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rstracers() {
  pkgdesc+=" - rstracers plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rsvideofx() {
  pkgdesc+=" - rsvideofx plugin (32-bit)"
  depends+=('lib32-cairo' 'lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rswebp() {
  pkgdesc+=" - rswebp plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs' 'lib32-libwebp')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-rswebrtc() {
  pkgdesc+=" - rswebrtc plugin (32-bit)"
  depends+=("lib32-gst-plugin-rsrtp=${pkgver}-${pkgrel}"
            'lib32-gst-plugins-bad-libs' 'lib32-gst-plugins-base'
            'lib32-gst-plugins-base-libs' 'lib32-openssl>=1.1')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-sodium() {
  pkgdesc+=" - sodium plugin (32-bit)"
  license=('MIT')
  depends+=('lib32-libsodium')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-spotify() {
  pkgdesc+=" - spotify plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-textahead() {
  pkgdesc+=" - textahead plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-textwrap() {
  pkgdesc+=" - textwrap plugin (32-bit)"

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-threadshare() {
  pkgdesc+=" - threadshare plugin (32-bit)"
  license=('LGPL-2.1-or-later')
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-togglerecord() {
  pkgdesc+=" - togglerecord plugin (32-bit)"
  depends+=('lib32-gst-plugins-base-libs')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}

package_lib32-gst-plugin-webrtchttp() {
  pkgdesc+=" - webrtchttp plugin (32-bit)"
  depends+=('lib32-gst-plugins-bad' 'lib32-gst-plugins-bad-libs'
            'lib32-gst-plugins-base-libs' 'lib32-openssl>=1.1')

  export RUSTUP_TOOLCHAIN=stable 

  cd "${srcdir}"
  meson install -C "${_name}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin"

  find . -type f,l ! -name "*gst${pkgname#lib32-gst-plugin-*}*" -delete
}
