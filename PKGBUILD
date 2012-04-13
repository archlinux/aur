# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# Building for x86_64 requires lib32-glibc & lib32-zlib from [multilib]. These
# libraries are linked from the NaCl toolchain, and are only needed during
# build time.

pkgname=chromium
pkgver=18.0.1025.162
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'dbus-glib' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent'
         'libxss' 'libgcrypt' 'ttf-dejavu' 'desktop-file-utils'
         'hicolor-icon-theme')
# Building with GCC 4.7 causes segfaults; build with 4.6 for the time being
# https://bugs.archlinux.org/task/29309
# Mirror snapshop before GCC 4.7 moved to [core]:
# Server = http://arm.konnichi.com/2012/04/02/$repo/os/$arch
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring'
             'elfutils' 'gcc<4.7')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE')
# Needed for the NaCl toolchain
[[ $CARCH == x86_64 ]] && makedepends+=('lib32-zlib')
provides=('chromium-browser')
conflicts=('chromium-browser')
install=chromium.install
source=(http://commondatastorage.googleapis.com/chromium-browser-official/$pkgname-$pkgver.tar.bz2
        http://commondatastorage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk/nacl_sdk.zip
        chromium.desktop
        chromium.sh
        chromium-gcc47.patch
        chromium-media-no-sse-r0.patch
        chromium-revert-jpeg-swizzle-r2.patch)
sha256sums=('c85875188c40c41225977eef58f3b04def16cae9877d32ced8e13a75207c73cd'
            '8cf762587e547588b9461686f7d2655d5a23d09e1260b5f97137fa7d41c767a9'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322'
            'c53bfc4db9dde684fbaed6a4bbecb207e3e7a0a2703233426fe076a6d3c557f3'
            'f607347ba8477d3c8e60eb3803d26f3c9869f77fd49986c60887c59a6aa7d30d'
            '71751bf5913da1eec3c88c433044224c869b0abd5a29172cf239bddbb4eff761'
            'd99162aa6bae562f116a42347254bbec3752464f0a3e4d8675e2b287b2a838a2')

build() {
  cd "$srcdir/chromium-$pkgver"

  # Fix build with gcc 4.7 (patch from openSUSE)
  #patch -Np2 -i "$srcdir/chromium-gcc47.patch"
  # Add missing include that defines OS_POSIX
  #sed -i '1 i\
  #  #include "build/build_config.h"' \
  #  chrome/browser/diagnostics/diagnostics_main.cc

  # Remove unconditional use of SSE3 (patch from Gentoo)
  patch -Np0 -i "$srcdir/chromium-media-no-sse-r0.patch"

  # Fix JPEG image rendering problem (patch from Gentoo bug #393471)
  patch -Np0 -i "$srcdir/chromium-revert-jpeg-swizzle-r2.patch"

  # Use Python 2
  find . -type f -exec sed -i -r \
    -e 's|/usr/bin/python$|&2|g' \
    -e 's|(/usr/bin/python2)\.4$|\1|g' \
    {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
  export PATH="$srcdir/python2-path:$PATH"

  pushd "$srcdir/nacl_sdk"
  ./naclsdk update pepper_18
  popd

  ln -s "$srcdir/nacl_sdk/pepper_18/toolchain/linux_x86_newlib" \
    native_client/toolchain/linux_x86_newlib

  # We need to disable system_ssl until "next protocol negotiation" support is
  # available in our nss package.
  # (See https://bugzilla.mozilla.org/show_bug.cgi?id=547312)

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

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
    $([[ $CARCH == i686 ]] && echo '-Ddisable_sse2=1')

  make chrome chrome_sandbox BUILDTYPE=Release
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 -o root -g root out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chromium-sandbox"

  cp out/Release/{{chrome,resources}.pak,libffmpegsumo.so} \
    out/Release/nacl_helper{,_bootstrap} \
    out/Release/{libppGoogleNaClPluginChrome.so,nacl_irt_x86_*.nexe} \
    "$pkgdir/usr/lib/chromium/"

  # These links are only needed when building with system ffmpeg
  #ln -s /usr/lib/libavcodec.so.52 "$pkgdir/usr/lib/chromium/"
  #ln -s /usr/lib/libavformat.so.52 "$pkgdir/usr/lib/chromium/"
  #ln -s /usr/lib/libavutil.so.50 "$pkgdir/usr/lib/chromium/"

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
