# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -A _plugin_deps=(
  [aws]='"lib32-gst-plugin-hlssink3=${pkgver}-${pkgrel}" lib32-gst-plugins-bad lib32-gst-plugins-base-libs "lib32-openssl>=1.1"'
  [cdg]='lib32-gst-plugins-base-libs'
  [claxon]='lib32-gst-plugins-base-libs'
  [dav1d]='"lib32-dav1d>=1.3" lib32-gst-plugins-base-libs'
  [fallbackswitch]='lib32-gst-plugins-base-libs lib32-gst-plugins-good'
  [ffv1]='lib32-gst-plugins-base-libs'
  [fmp4]='lib32-gst-plugins-base-libs'
  [gif]='lib32-gst-plugins-base-libs'
  [gopbuffer]='lib32-gst-plugins-base-libs'
  [gtk4]='lib32-graphene lib32-gst-plugins-base-libs "lib32-gtk4>=4.6"'
  [hlssink3]='lib32-gst-plugins-base-libs'
  [hsv]='lib32-gst-plugins-base-libs'
  [json]=''
  [lewton]='lib32-gst-plugins-base-libs'
  [livesync]='lib32-gst-plugins-base-libs'
  [mp4]='lib32-gst-plugins-base-libs'
  [mpegtslive]=''
  [originalbuffer]='lib32-gst-plugins-base-libs'
  [quinn]=''
  [raptorq]='lib32-gst-plugins-base-libs'
  [rav1e]='lib32-gst-plugins-base-libs'
  [regex]=''
  [reqwest]='"lib32-openssl>=1.1"'
  [rsaudiofx]='lib32-gst-plugins-base-libs'
  [rsclosedcaption]='"lib32-gst-plugin-aws=${pkgver}-${pkgrel}" "lib32-gst-plugin-textwrap=${pkgver}-${pkgrel}" lib32-cairo lib32-gst-plugins-bad lib32-gst-plugins-base-libs lib32-pango'
  [rsfile]=''
  [rsflv]='lib32-gst-plugins-base-libs'
  [rsinter]='lib32-gst-plugins-base-libs'
  [rsonvif]='lib32-cairo lib32-gst-plugins-base-libs lib32-pango'
  [rspng]='lib32-gst-plugins-base-libs'
  [rsrtp]='lib32-gst-plugins-base-libs'
  [rsrtsp]='lib32-gst-plugins-base-libs lib32-gst-plugins-good'
  [rstracers]=''
  [rsvideofx]='lib32-cairo lib32-gst-plugins-base-libs'
  [rswebp]='lib32-gst-plugins-base-libs lib32-libwebp'
  [rswebrtc]='"lib32-gst-plugin-rsrtp=${pkgver}-${pkgrel}" lib32-gst-plugins-bad-libs lib32-gst-plugins-base lib32-gst-plugins-base-libs "lib32-openssl>=1.1"'
  [sodium]='lib32-libsodium'
  [spotify]=''
  [textahead]=''
  [textwrap]=''
  [threadshare]='lib32-gst-plugins-base-libs'
  [togglerecord]='lib32-gst-plugins-base-libs'
  [webrtchttp]='lib32-gst-plugins-bad lib32-gst-plugins-bad-libs lib32-gst-plugins-base-libs "lib32-openssl>=1.1"'
)

declare -A _plugin_licenses=(
  [cdg]='MIT OR Apache-2.0'
  [claxon]='MIT OR Apache-2.0'
  [dav1d]='MIT OR Apache-2.0'
  [ffv1]='MIT OR Apache-2.0'
  [gif]='MIT OR Apache-2.0'
  [lewton]='MIT OR Apache-2.0'
  [rav1e]='MIT OR Apache-2.0'
  [reqwest]='MIT OR Apache-2.0'
  [rsfile]='MIT OR Apache-2.0'
  [rsflv]='MIT OR Apache-2.0'
  [rspng]='MIT OR Apache-2.0'
  [sodium]='MIT'
  [threadshare]='LGPL-2.1-or-later'
)

_name="gst-plugins-rs"
pkgbase="lib32-${_name}"
for plugin in "${!_plugin_deps[@]}"; do
  pkgname+=("lib32-gst-plugin-${plugin}")
done
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

for plugin in "${!_plugin_deps[@]}"; do
  eval "
package_lib32-gst-plugin-${plugin}() {
  pkgdesc+=' - ${plugin} plugin (32-bit)'
  
  $([[ -n ${_plugin_deps[$plugin]} ]] && echo "depends+=(${_plugin_deps[$plugin]})")
  $([[ -n ${_plugin_licenses[$plugin]-} ]] && echo "license=('${_plugin_licenses[$plugin]}')")
  
  export RUSTUP_TOOLCHAIN=stable
  
  cd \"\${srcdir}\"
  meson install -C \"\${_name}/build\" --destdir \"\${pkgdir}\"
  
  cd \"\${pkgdir}/usr\"
  rm -rf bin
  
  find . -type f,l ! -name \"*gst${plugin}*\" -delete
}"
done
