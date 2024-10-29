# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=vivaldi-snapshot-ffmpeg-codecs
pkgver=130.0.6723.63
_vivaldi_major_version=7.1
pkgrel=2
pkgdesc="additional support for proprietary codecs for vivaldi"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gn' 'ninja' 'python' 'gtk3' 'nss' 'libva' 'libevdev'
)
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha512sums=('ce75e286bde30bea8c4a27399e9f8c669b2e949893fbaf81661251ed890006305a65ac5b24329ec0306c7fc74721d27d9f03734efcabba84743a7fd0cf7c8a01')

#prepare() {
  #cd "$srcdir/chromium-$pkgver"
#}

_build_flags=(
  'is_component_build=false'
  'is_component_ffmpeg=true'
  'use_sysroot=false'
  'use_qt=false'
  'use_glib=false'
  'ozone_platform_x11=false'
)

_ffmpeg_build_flags=(
  "ffmpeg_branding=\"ChromeOS\""
  "proprietary_codecs=true"
  "enable_platform_hevc=true"
  "enable_platform_ac3_eac3_audio=true"
  "enable_platform_mpeg_h_audio=true"
  "enable_platform_dolby_vision=true"
  "enable_mse_mpeg2ts_stream_parser=true"
)
build() {
  cd "$srcdir/chromium-$pkgver"

  # chromium clang and rust
  python tools/clang/scripts/update.py
  python tools/rust/update_rust.py

  export PATH="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin:$PATH"

  export CC="clang"
  export CXX="clang++"

  gn gen -v \
    --fail-on-unused-args \
    --args="${_build_flags[*]} ${_ffmpeg_build_flags[*]}" \
    --script-executable=/usr/bin/python \
    out/ffmpegso

  ninja -C out/ffmpegso libffmpeg.so
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/ffmpegso/libffmpeg.so \
    "$pkgdir/opt/vivaldi-snapshot/libffmpeg.so.$_vivaldi_major_version"
}

# vim:set ts=2 sw=2 et:
