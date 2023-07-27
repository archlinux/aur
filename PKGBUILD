# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=115.0.5790.102
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera"
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
sha512sums=('04add3005a0c8c84138edd0e1ebf197f2e1c5edd3a48ce4e16184940ce9095088e27824c92fa9c85a36d09eaccea5aba24f9806096e4be63a30d625f386ab665')

#prepare() {
  #cd "$srcdir/chromium-$pkgver"
#}

_build_flags=(
  'is_component_build=false'
  'is_component_ffmpeg=true'
  'use_sysroot=false'
  'use_gnome_keyring=false'
  'use_qt=false'
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

  # chromium clang
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
    "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
