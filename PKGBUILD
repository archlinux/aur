# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-beta-ffmpeg-codecs
pkgver=90.0.4430.85
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-beta"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk3' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python' 'python2'
  'xdg-utils' 'gn' 'libva'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha512sums=('90aac1f0b676e1ca5ccb9a362abb475945c1944686a8aba08509cde105a974ef115ca3ea56e3a88737bec7d0ae3ac1482d9c844cb14adc8f1bc06ac41ad60791')

#prepare() {
  #cd "$srcdir/chromium-$pkgver"
#}

build() {
  cd "$srcdir/chromium-$pkgver"

  python tools/clang/scripts/update.py

  export PATH="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin:$PATH"

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
    "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
