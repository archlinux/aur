# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-developer-ffmpeg-codecs
pkgver=51.0.2687.0
pkgrel=1
pkgdesc="additional support for proprietary codecs for opera-developer"
arch=('i686' 'x86_64')
url="https://ffmpeg.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=(
  'gtk2' 'libexif' 'libpulse' 'libxss' 'ninja' 'nss' 'pciutils' 'python2'
  'xdg-utils'
)
options=('!strip')
source=(
  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz"
)
sha256sums=('2453e8c43cec937e8ec38e69714a2a18827fffbd4646c62e50f64d99fb9d32f0')


prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  [[ -d "$srcdir/python2-path" ]] && rm -rf "$srcdir/python2-path"
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # chromium 46 gives an error about a missing file
  # workaround create empty
  touch chrome/test/data/webui/i18n_process_css_test.html
}

build() {
  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  build/gyp_chromium \
    --depth=. \
    -Dclang=0 \
    -Duse_gnome_keyring=0 \
    -Duse_gconf=0 \
    -Dlinux_use_bundled_binutils=0 \
    -Dlinux_use_bundled_gold=0 \
    -Dlinux_use_gold_flags=0 \
    -Dsysroot='' \
    -Dcomponent=shared_library \
    -Dffmpeg_branding=ChromeOS

  ninja -C out/Release ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -Dm644 out/Release/lib/libffmpeg.so \
    "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
