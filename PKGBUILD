# Maintainer: Ivan Burmin <osguot@gmail.com>
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=yandex-browser-ffmpeg-codecs
pkgver=68.0.3440.15
pkgrel=1
pkgdesc="additional support for proprietary codecs for yandex browser"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk3' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python2'
  'xdg-utils' 'ncurses5-compat-libs'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  'chromium-last-commit-position-r1.patch'
  'chromium-FORTIFY_SOURCE-r2.patch'
)
sha512sums=('683b5504dbd432b40ba00e2e29cea1c75cfbfc18bfa1f572ad86925aea9713fd41e494b141a7f3fad01a12ef1e18adc136fb96e155378daa6de1015f3065d2ae'
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

  export PATH="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin:$srcdir/path:$PATH"
  #_clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin/"
  # Bundled clang not like this.
  #CXXFLAGS="${CXXFLAGS//-fno-plt/}"
  #CFLAGS="${CFLAGS//-fno-plt/}"

  #export CC="${_clang_path}clang"
  #export CXX="${_clang_path}clang++"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_hevc_demuxing=true use_gnome_keyring=false use_sysroot=false use_gold=false use_allocator=\"none\" linux_use_bundled_binutils=false fatal_linker_warnings=false treat_warnings_as_errors=false enable_nacl=false enable_nacl_nonsfi=false is_clang=true clang_use_chrome_plugins=true is_component_build=true is_debug=false symbol_level=0 use_custom_libcxx=false use_lld=false use_jumbo_build=false"

  python2 tools/gn/bootstrap/bootstrap.py -v -s
  out/Release/gn gen out/Release -v --args="$args" --script-executable=/usr/bin/python2

  ninja -C out/Release -v media/ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/Release/libffmpeg.so \
    "$pkgdir/opt/yandex/browser-beta/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
