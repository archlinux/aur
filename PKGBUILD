# Maintainer: Zirrald <zirrald at yandex dot ru>
# Based on opera-ffmpeg-codecs package <Maintainer: BlackIkeEagle>

pkgname=yandex-browser-ffmpeg-codecs
pkgver=60.0.3112.90
pkgrel=1
pkgdesc="additional support for proprietary codecs for yandex browser"
arch=('i686' 'x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk2' 'gtk3' 'libexif' 'libpulse' 'libxss' 'ninja' 'nss' 'pciutils' 'python2'
  'xdg-utils'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
  'chromium-last-commit-position-r1.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-FORTIFY_SOURCE-r1.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-gn-bootstrap-r8.patch'
)
sha256sums=('b42f7965764b4528116622a71a60f52becd4186ff8854f3051bf45c6368739e6'
            'd3dc397956a26ec045e76c25c57a1fac5fc0acff94306b2a670daee7ba15709e'
            'bbb2782f2681a3d4366ab122485497f42b4eef9856ca0dcdfa655efad2886fa5'
            '06345804c00d9618dad98a2dc04f31ef19912cdf6e9d6e577ef7ffb1fa57003f')


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
  patch -p1 -i "$srcdir/chromium-FORTIFY_SOURCE-r1.patch"
  patch -p1 -i "$srcdir/chromium-gn-bootstrap-r8.patch"
}

build() {
  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  local args="ffmpeg_branding=\"ChromeOS\" proprietary_codecs=true enable_hevc_demuxing=true use_gconf=false use_gio=false use_gnome_keyring=false use_kerberos=false use_cups=false use_sysroot=false use_gold=false linux_use_bundled_binutils=false fatal_linker_warnings=false treat_warnings_as_errors=false is_clang=false is_component_build=true is_debug=false symbol_level=0"
  python2 tools/gn/bootstrap/bootstrap.py -v --gn-gen-args "$args"
  out/Release/gn gen out/Release -v --args="$args" --script-executable=/usr/bin/python2

  ninja -C out/Release -v media/ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm 644 out/Release/libffmpeg.so \
    "$pkgdir/opt/yandex/browser-beta/libffmpeg.so"

}

# vim:set ts=2 sw=2 et:
