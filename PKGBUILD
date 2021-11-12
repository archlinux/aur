# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=95.0.4638.54
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk3' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python' 'xdg-utils' 'gn'
  'libva' 'nodejs'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  "gn-visibility-webrtc.patch"
)
sha512sums=('159c8d37e8cfb5bb0e55d3d1329295dab585164b84b8c514ea80f0f68ce0b491f4c40a186a2bc108baae2341cf320dee78c654c0a038d5aeb17b5a19c7f043d9'
            'a0d2b31b870a53af6c68ef1f66c6e6bdeb63ca4bf49120c389dfbd41f98818c387295b0b9330d5e446ebdb46e20a7eb69ab2007eb5c5efdeb16e83e7e01b2e3b')

prepare() {
  cd "$srcdir/chromium-$pkgver"
  patch -Np1 -i ../gn-visibility-webrtc.patch
}

build() {
  cd "$srcdir/chromium-$pkgver"

  python tools/clang/scripts/update.py

  export PATH="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin:$PATH"

  # Setup nodejs dependency.
  mkdir -p third_party/node/linux/node-linux-x64/bin/
  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin/node

  # error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
  ln -s /usr/lib/libtinfo.so.6 \
    third_party/llvm-build/Release+Asserts/lib/libtinfo.so.5

  export CC="clang"
  export CXX="clang++"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_platform_hevc=true enable_platform_ac3_eac3_audio=true enable_platform_mpeg_h_audio=true enable_platform_dolby_vision=true enable_mse_mpeg2ts_stream_parser=true use_gnome_keyring=false use_sysroot=false use_gold=false linux_use_bundled_binutils=false treat_warnings_as_errors=false enable_nacl=false enable_nacl_nonsfi=false clang_use_chrome_plugins=true is_component_build=true is_debug=false symbol_level=0 use_custom_libcxx=true"

  gn gen out/Release -v --args="$args" --script-executable=/usr/bin/python

  ninja -C out/Release -v media/ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/Release/libffmpeg.so \
    "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
