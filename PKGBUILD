# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-beta-ffmpeg-codecs
pkgver=121.0.6156.3
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-beta"
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
sha512sums=('1f8b5280f562776b37c91714c709e4d0941bb5c3b2a3677266585911bd8a4a5ea1f65382c66a9920af5847f7d5dc25ff29f8d0acc0678ed1fd14d80480f9c9ef')

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
    "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
