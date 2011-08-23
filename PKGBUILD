# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=13.0.782.215
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'dbus-glib' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent'
         'libxss' 'libgcrypt' 'ttf-dejavu' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring')
provides=('chromium-browser')
conflicts=('chromium-browser')
install=chromium.install
source=(http://build.chromium.org/official/chromium-$pkgver.tar.bz2
        chromium.desktop
        chromium.sh
        gcc-4.6.patch
        glibc-2.14.patch
        make-hash-tools-use-if-instead-of-switch.patch
        v8-r8472-crbug-77625-huge-number-of-cpu-wakeups.patch)
md5sums=('631cb4c3db4b4a05a3214d903ae1a3b5'
         '075c3c2fa5902e16b8547dd31d437191'
         '096a46ef386817988250d2d7bddd1b34'
         '690f2be42bf2a31755753a466653eb33'
         '543a32b09f138fd47858b9a4a7c82dfb'
         '9d9e66c8365d7333e55305796b49fd77'
         '19c08d35303be15e414f2e881000140d')

build() {
  cd "$srcdir/chromium-$pkgver"

  # Fix build with gcc 4.6
  # http://code.google.com/p/chromium/issues/detail?id=80071
  patch -Np0 -i "$srcdir/gcc-4.6.patch"

  # Fix build with glibc 2.14
  # http://code.google.com/p/chromium/issues/detail?id=86646
  patch -Np2 -i "$srcdir/glibc-2.14.patch"

  # Fix build with Perl 5.14
  patch -d third_party/WebKit -Np2 -i \
    "$srcdir/make-hash-tools-use-if-instead-of-switch.patch"

  # Fix upstream issue #77625: Chromium Generates HUGE numbers of CPU wakeups
  # and uses massive amounts of power
  # http://code.google.com/p/chromium/issues/detail?id=77625
  # Patch from: http://code.google.com/p/v8/source/detail?r=8472
  patch -d v8/src -Np0 -i \
    "$srcdir/v8-r8472-crbug-77625-huge-number-of-cpu-wakeups.patch"

  # Use Python 2
  find . -type f -exec sed -i -r \
    -e 's|/usr/bin/python$|\02|g' \
    -e 's|(/usr/bin/python2)\.4$|\1|g' \
    {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
  export PATH="$srcdir/python2-path:$PATH"

  # We need to disable system_ssl until "next protocol negotiation" support is
  # available in our nss package.
  # (See https://bugzilla.mozilla.org/show_bug.cgi?id=547312)

  build/gyp_chromium -f make build/all.gyp --depth=. \
    -Dno_strict_aliasing=1 \
    -Dwerror= \
    -Dlinux_sandbox_path=/usr/lib/chromium/chromium-sandbox \
    -Dlinux_strip_binary=1 \
    -Drelease_extra_cflags="$CFLAGS" \
    -Dffmpeg_branding=Chrome \
    -Dproprietary_codecs=1 \
    -Duse_system_bzip2=1 \
    -Duse_system_ffmpeg=0 \
    -Duse_system_libevent=1 \
    -Duse_system_libjpeg=1 \
    -Duse_system_libpng=1 \
    -Duse_system_libxml=0 \
    -Duse_system_ssl=0 \
    -Duse_system_yasm=1 \
    -Duse_system_zlib=1 \
    -Duse_gconf=0 \
    -Ddisable_sse2=1 \
    $([[ $CARCH == i686 ]] && echo '-Ddisable_sse2=1')

  make chrome chrome_sandbox BUILDTYPE=Release
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome ${pkgdir}/usr/lib/chromium/chromium

  install -Dm4755 -o root -g root out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chromium-sandbox"

  cp out/Release/{{chrome,resources}.pak,libffmpegsumo.so} \
    out/Release/{libppGoogleNaClPluginChrome.so,nacl_irt_x86_*.nexe} \
    "$pkgdir/usr/lib/chromium/"

  # These links are only needed when building with system ffmpeg
  #ln -s /usr/lib/libavcodec.so.52 ${pkgdir}/usr/lib/chromium/
  #ln -s /usr/lib/libavformat.so.52 ${pkgdir}/usr/lib/chromium/
  #ln -s /usr/lib/libavutil.so.50 ${pkgdir}/usr/lib/chromium/

  cp -a out/Release/locales out/Release/resources "$pkgdir/usr/lib/chromium/"

  find "$pkgdir/usr/lib/chromium/" -name '*.d' -type f -delete

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -D "$srcdir/chromium.sh" "$pkgdir/usr/bin/chromium"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
