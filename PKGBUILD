# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=64.0.3282.186
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
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  'chromium-last-commit-position-r1.patch'
  'chromium-FORTIFY_SOURCE-r2.patch'
  'chromium-memcpy-r0.patch'
  'chromium-angle-r0.patch'
)
sha512sums=('a8a435ee8506cfefaaf2df7447010df5db69fa6907844872d00643f55723a9bd7771649658f5151c857ac037adcbc8bdf2a5375dd105f78d068277ef021af7d8'
            '8f63366ca998e3ee06a79c6df5b4454707bd9865913ecde2f79fcb49fdd86d291f678b9f21807e4eb61d15497cdbe4a4bdc06637882e708f34f6804453bdfd41'
            '2d78092a700788c74b86db636af303fdb63a28ce5b7b0431dd81f6b7ce501e5d0234a6327a1b49bc23e1c1d00ba98fd5334dd07d9a20bb0d81d1a4ca4487a26c'
            '1aeeb70929acee529dea66860b42f106afe18c0f6219eb03c9c710faf8d20a997135550e289839599ec325d8f032243fd70c07d397bd89302a192c41e8c4660a'
            'c5fa18dbaa82a0fc089c6c88857089f19c83f6d3ff7c7034e6ca3cde20f1615cd84ac13fde14b55dcfa7d3c85eb0f023fbe337bb96d7d8199b5729b269a5ccc7')

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Use Python 2
  find . -name '*.py' -exec sed -r 's|/usr/bin/python$|&2|g' -i {} +
  find . -name '*.py' -exec sed -r 's|/usr/bin/env python$|&2|g' -i {} +
  # There are still a lot of relative calls which need a workaround
  [[ -d "$srcdir/python2-path" ]] && rm -rf "$srcdir/python2-path"
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # chromium 46 gives an error about a missing file
  # workaround create empty
  touch chrome/test/data/webui/i18n_process_css_test.html

  patch -p1 -i "$srcdir/chromium-last-commit-position-r1.patch"
  patch -p1 -i "$srcdir/chromium-FORTIFY_SOURCE-r2.patch"
  patch -p1 -i "$srcdir/chromium-memcpy-r0.patch"
  patch -p1 -i "$srcdir/chromium-angle-r0.patch"
}

build() {
  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_hevc_demuxing=true use_gconf=false use_gio=false use_gnome_keyring=false use_pulseaudio=false link_pulseaudio=false use_kerberos=false use_cups=false use_sysroot=false use_gold=false use_allocator=\"none\" linux_use_bundled_binutils=false fatal_linker_warnings=false treat_warnings_as_errors=false enable_nacl=false enable_nacl_nonsfi=false is_clang=false clang_use_chrome_plugins=false is_component_build=true is_debug=false symbol_level=0 use_custom_libcxx=false"

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
