# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=vivaldi-ffmpeg-codecs
pkgver=45.0.2454.99
pkgrel=1
pkgdesc="additional support for proprietary codecs for vivaldi"
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
sha256sums=('15d1a31fd0acfca07d614249518192983890507641e09db8d4c91d9ddf7ea340')


prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  [[ -d "$srcdir/python2-path" ]] && rm -rf "$srcdir/python2-path"
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
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
    "$pkgdir/usr/lib/vivaldi-ffmpeg-codecs/libffmpeg.so"
}

# vim:set ts=2 sw=2 et:
