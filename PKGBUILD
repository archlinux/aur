# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=46.0.2490.6
_opver=32
_opbver=33
_opdver=34
pkgrel=2
pkgdesc="additional support for proprietary codecs for opera"
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
sha256sums=('c3fcb3f8c0d150fb10dc921621bc6f047a62247e2297c7b78bfa237f10bcaa16')


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
    -Dcomponent=shared_library \
    -Dffmpeg_branding=ChromeOS

  ninja -C out/Release ffmpeg
}

package() {
  cd "$srcdir/chromium-$pkgver"

	install -Dm644 out/Release/lib/libffmpeg.so \
    "$pkgdir/usr/lib/opera-ffmpeg-codecs/libffmpeg.so"

  install -dm755 "$pkgdir/usr/lib/opera/lib_extra"
  install -dm755 "$pkgdir/usr/lib/opera-beta/lib_extra"
  install -dm755 "$pkgdir/usr/lib/opera-developer/lib_extra"

  ln -sf /usr/lib/opera-ffmpeg-codecs/libffmpeg.so \
    "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so.$_opver"
  ln -sf /usr/lib/opera-ffmpeg-codecs/libffmpeg.so \
    "$pkgdir/usr/lib/opera-beta/lib_extra/libffmpeg.so.$_opbver"
  ln -sf /usr/lib/opera-ffmpeg-codecs/libffmpeg.so \
    "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so.$_opdver"
}

# vim:set ts=2 sw=2 et:
