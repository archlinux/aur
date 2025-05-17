# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# shellcheck disable=SC2016
declare -A _plugin_depends=(
  [aws]='"lib32-gst-plugin-hlssink3=${pkgver}-${pkgrel}" lib32-gst-plugins-bad lib32-gst-plugins-base-libs "lib32-openssl>=1.1"'
  [cdg]='lib32-gst-plugins-base-libs'
  [claxon]='lib32-gst-plugins-base-libs'
  # [csound]=''
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
  # [ndi]=''
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
  # [uriplaylistbin]=''
  [webrtchttp]='lib32-gst-plugins-bad lib32-gst-plugins-bad-libs lib32-gst-plugins-base-libs "lib32-openssl>=1.1"'
)

declare -A _plugin_license=(
  [cdg]='"MIT OR Apache-2.0"'
  [claxon]='"MIT OR Apache-2.0"'
  [dav1d]='"MIT OR Apache-2.0"'
  [ffv1]='"MIT OR Apache-2.0"'
  [gif]='"MIT OR Apache-2.0"'
  [lewton]='"MIT OR Apache-2.0"'
  [rav1e]='"MIT OR Apache-2.0"'
  [reqwest]='"MIT OR Apache-2.0"'
  [rsfile]='"MIT OR Apache-2.0"'
  [rsflv]='"MIT OR Apache-2.0"'
  [rspng]='"MIT OR Apache-2.0"'
  [sodium]='MIT'
  [threadshare]='LGPL-2.1-or-later'
)

_name="gst-plugins-rs"
pkgbase="lib32-${_name}"
for plugin in "${!_plugin_depends[@]}"; do
  pkgname+=("lib32-gst-plugin-${plugin}")
done
pkgver=0.13.6
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
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git?signed#tag=${pkgver}")
b2sums=('aa42d141a53bd9c6ed4f7e01fdeb2062101a3fcc2fbb0ca578c2ea31a756c514143733beea4215e4f223fe02c84266921a6da4e40947e12387cf15e34099cd9e')
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5') # Sebastian Dröge <sebastian@centricular.com>

# Link with libsodium from system
# export SODIUM_USE_PKG_CONFIG=1
# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false
# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
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
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   export RUSTUP_TOOLCHAIN=stable 
# 
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

for plugin in "${!_plugin_depends[@]}"; do
  eval "
package_lib32-gst-plugin-${plugin}() {
  pkgdesc+=' - ${plugin} plugin (32-bit)'
  
  $([[ -n ${_plugin_depends[$plugin]} ]]  && echo "depends+=(${_plugin_depends[$plugin]})")
  $([[ -n ${_plugin_license[$plugin]-} ]] && echo "license=(${_plugin_license[$plugin]})")
  
  export RUSTUP_TOOLCHAIN=stable
  
  cd \"\${srcdir}\"
  meson install -C \"${_pkgsrc}/build\" --destdir \"\${pkgdir}\"
  
  cd \"\${pkgdir}/usr\"
  rm -rf bin
  
  find . -type f,l ! -name \"*gst${plugin}*\" -delete
}"
done
