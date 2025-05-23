# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=vivaldi-snapshot-ffmpeg-codecs
pkgver=136.0.7103.125
_vivaldi_major_version=7.5
pkgrel=1
pkgdesc="additional support for proprietary codecs for vivaldi-snapshot"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gn' 'ninja' 'python' 'nss' 'libva' 'libxkbcommon'
)
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha512sums=('0d1d4d49f8f1c910842ff500e26f5c16590eb630973cf94e08f213fc838b52713f146cbe022700e65322be08a2798e499d4ec3ceda18b45c04c4d3ae6061d88e')

#prepare() {
  #cd "$srcdir/chromium-$pkgver"
#}

_build_flags=(
  'is_component_build=false'
  'is_component_ffmpeg=true'
  'use_sysroot=false'
  'use_gtk=false'
  'use_qt5=false'
  'use_qt6=false'
  'use_glib=false'
  'use_cups=false'
  'use_pangocairo=false'
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
