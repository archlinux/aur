# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
pkgver=46.0.2486.0
_opver=31
_opbver=32
_opdver=33
pkgrel=1
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
  "patch_ffmpeg_gyp.patch"
)
sha256sums=('50b1b3a895cbb5142df6455ae3cb9e25dda8a41ce48f936983f5c75b2d4de9a6'
            '73127edde4450f007cc696711ab0ea84a8c498d7fe369df7bad3c29a0ac075a8')


prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # chromium 46 gives an error about a missing file
  # workaround create empty
  touch chrome/test/data/webui/i18n_process_css_test.html

  # make sure we can build ffmpeg so
  (
    cd third_party/ffmpeg
    patch -Np1 -i "$srcdir/patch_ffmpeg_gyp.patch"
  )
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
