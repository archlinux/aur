# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=68.0.3440.106
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk3' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python2'
  'xdg-utils'
)
options=('!strip')
source=(
  "https://repo.herecura.eu/herecura/x86_64/ncurses5-compat-libs-6.1-1-x86_64.pkg.tar.xz"
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  'chromium-last-commit-position-r1.patch'
  'chromium-FORTIFY_SOURCE-r2.patch'
)
sha512sums=('c2bc35f4a7a571c51b5ea0b3307094209ba663d1ef519ca61dadd8bc570128793c18a1d317a54c98ac58737f6c87a61aca262b7c01797f4df9a838cc40191b4f'
            'ab94f89e614919932d4d960bac8e5450c4d3f26dea4892e6591762bfaeeb4707a090352d4a952bcb55e34fde4950db22a36004788efd26ffb22b28770e9795c4'
            '8f63366ca998e3ee06a79c6df5b4454707bd9865913ecde2f79fcb49fdd86d291f678b9f21807e4eb61d15497cdbe4a4bdc06637882e708f34f6804453bdfd41'
            '2d78092a700788c74b86db636af303fdb63a28ce5b7b0431dd81f6b7ce501e5d0234a6327a1b49bc23e1c1d00ba98fd5334dd07d9a20bb0d81d1a4ca4487a26c')

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Use Python 2
  find -name '*.py' | xargs sed -e 's|env python|&2|g' -e 's|bin/python|&2|g' -i

  # force some 'older' binaries in the path
  [[ -d "$srcdir/path" ]] && rm -rf "$srcdir/path"
  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

  patch -p1 -i "$srcdir/chromium-last-commit-position-r1.patch"
  patch -p1 -i "$srcdir/chromium-FORTIFY_SOURCE-r2.patch"
}

build() {
  cd "$srcdir/chromium-$pkgver"

  python2 tools/clang/scripts/update.py --without-android

  cp -a "$srcdir/usr/lib/libncursesw.so.5.9" 'third_party/llvm-build/Release+Asserts/lib/'
  ( cd 'third_party/llvm-build/Release+Asserts/lib/'; ln -s libncursesw.so.5.9 libtinfo.so.5 )

  export PATH="$srcdir/path:$PATH"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_hevc_demuxing=true use_gnome_keyring=false use_sysroot=false use_gold=false use_allocator=\"none\" linux_use_bundled_binutils=false fatal_linker_warnings=false treat_warnings_as_errors=false enable_nacl=false enable_nacl_nonsfi=false is_clang=true clang_use_chrome_plugins=true is_component_build=true is_debug=false symbol_level=0 use_custom_libcxx=false use_lld=false use_jumbo_build=false"

  python2 tools/gn/bootstrap/bootstrap.py -v -s
  out/Release/gn gen out/Release -v --args="$args" --script-executable=/usr/bin/python2

  ninja -C out/Release -v media/ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/Release/libffmpeg.so \
    "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
