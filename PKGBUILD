# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=103.0.5060.114
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk3' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python' 'xdg-utils' 'gn'
  'libva' 'nodejs' 'git'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha512sums=('f0e3312efcfa19d05219763184e8f8b81b847fe357cc47a6569f16bcd3bffec9ed4aa19b27c8e8f227bebb13161a126c3a07ee5480f18b5280539ae419b90dbb')

#prepare() {
  #cd "$srcdir/chromium-$pkgver"
#}

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
