# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-developer-ffmpeg-codecs
pkgver=59.0.3053.3
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-developer"
arch=('i686' 'x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('gcc-libs' 'zlib')
makedepends=(
  'gtk3' 'gtk2' 'libexif' 'libxss' 'ninja' 'nss' 'pciutils' 'python2'
  'xdg-utils'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  'chromium-last-commit-position-r1.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-gn-bootstrap-r4.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-dma-buf-r1.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-FORTIFY_SOURCE.patch'
)
sha512sums=('5a5d0f6d06ffbaf13e6e1e7442a86418f07ed00654926fad9ba1ae3458f0a67374da3a43d8235abd5a6db0827f57c25a631d537e6475c23488ffc272a65fbfee'
            '8f63366ca998e3ee06a79c6df5b4454707bd9865913ecde2f79fcb49fdd86d291f678b9f21807e4eb61d15497cdbe4a4bdc06637882e708f34f6804453bdfd41'
            '820d8f96c4bca9db896529b9f1d5e1a8209fb3509c60c3691e91f30dcdbdeb4cded6fbfdc58ca2aac4dee0e1cbc2256c4e30dd8e6c8158b225f63572596b689c'
            '279185af77d504a9be7fb3f0f8c85ebbb422fa15a716614989288921d546179ed04d238c7b176a8eb64e6e4a7ae5147d200d694d7df1647fc0382c884a53f3cd'
            'd404976ebeca7ffe4e07770055aa9ec8db8761fcbbbf1e463523232a135e11d201c6263d468124190372b3178fda4ea36bdf9be34c50183b7ca93f14ab9d83b0')

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
  patch -p1 -i "$srcdir/chromium-gn-bootstrap-r4.patch"
  patch -p1 -i "$srcdir/chromium-dma-buf-r1.patch"
  patch -p1 -i "$srcdir/chromium-FORTIFY_SOURCE.patch"
}

build() {
  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_hevc_demuxing=true use_gconf=false use_gio=false use_gnome_keyring=false use_pulseaudio=false link_pulseaudio=false use_kerberos=false use_cups=false use_sysroot=false use_gold=false use_allocator=\"none\" linux_use_bundled_binutils=false fatal_linker_warnings=false treat_warnings_as_errors=false enable_nacl=false enable_nacl_nonsfi=false is_clang=false clang_use_chrome_plugins=false is_component_build=true is_debug=false symbol_level=0"
  python2 tools/gn/bootstrap/bootstrap.py -v --gn-gen-args "$args"
  out/Release/gn gen out/Release -v --args="$args" --script-executable=/usr/bin/python2

  ninja -C out/Release -v media/ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/Release/libffmpeg.so \
    "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
