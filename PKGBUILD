# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=110.0.5481.77
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gn' 'ninja' 'python' 'gtk3' 'nss' 'libva'
)
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha512sums=('5c10732a506c3f994bf4618aa1b0cac2a69f638095320d1c2c0ccff1853398073b28cf5c5c476138eb5b26af86ad8c0abc5619cdc8caaa6f080d236e4352ac82')

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
