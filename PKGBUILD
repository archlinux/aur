# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=24.0.1312.52
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss'
         'libgcrypt' 'ttf-dejavu' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring'
             'elfutils' 'subversion' 'nacl-toolchain-newlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE')
backup=('etc/chromium/default')
install=chromium.install
source=(http://commondatastorage.googleapis.com/chromium-browser-official/$pkgname-$pkgver.tar.bz2
        chromium.desktop
        chromium.default
        chromium.sh
        chromium-20.0.1132.57-glib-2.16-use-siginfo_t.patch
        chromium-ppapi-r0.patch
        chromium-no-pnacl-r0.patch)
sha256sums=('f30df8b0f4c999185bb11d873f0caa5d8bc581eb4f37ce0fe85fb7900a01d711'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322'
            '478340d5760a9bd6c549e19b1b5d1c5b4933ebf5f8cfb2b3e2d70d07443fe232'
            '4999fded897af692f4974f0a3e3bbb215193519918a1fa9b31ed51e74a2dccb9'
            'c1baf14121502efbc2a31b64029dcafa0e28ca5b71ad0e28a3c6342d18198615'
            '1f4b57670d317959bc2dc60e5d2a44aa8fc6028f7ed540cdb502fa0aa99c81bd'
            '44061e1648ac4674ad0b9990c265c96c33de435679f6854e4b54a421d81cbe6c')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

build() {
  cd "$srcdir/chromium-$pkgver"

  # Fix build with glibc 2.16
  patch -Np1 -i "$srcdir/chromium-20.0.1132.57-glib-2.16-use-siginfo_t.patch"

  # Fix build without NaCl glibc toolchain (patch from Gentoo)
  patch -Np0 -i "$srcdir/chromium-ppapi-r0.patch"

  # Fix build without NaCl pnacl toolchain (patch from Gentoo)
  patch -Np0 -i "$srcdir/chromium-no-pnacl-r0.patch"

  # http://code.google.com/p/chromium/issues/detail?id=109527
  sed -i 's|glib/gutils.h|glib.h|' ui/base/l10n/l10n_util.cc

  # Missing gyp files in tarball (http://crbug.com/144823)
  sed -i '/nacl_test_data\.gyp/d' chrome/chrome_tests.gypi

  # Use Python 2
  find . -type f -exec sed -i -r \
    -e 's|/usr/bin/python$|&2|g' \
    -e 's|(/usr/bin/python2)\.4$|\1|g' \
    {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
  export PATH="$srcdir/python2-path:$PATH"

  # Prepare NaCL toolchain
  mkdir -p sdk native_client/toolchain/.tars
  cp -a /usr/lib/nacl-toolchain-newlib sdk/nacl-sdk
  tar czf native_client/toolchain/.tars/naclsdk_linux_x86.tgz sdk
  rm -r sdk

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  build/gyp_chromium --depth=. \
    -Dgoogle_api_key=$_google_api_key \
    -Dgoogle_default_client_id=$_google_default_client_id \
    -Dgoogle_default_client_secret=$_google_default_client_secret \
    -Dwerror= \
    -Dlinux_sandbox_path=/usr/lib/chromium/chromium-sandbox \
    -Dlinux_strip_binary=1 \
    -Dlinux_use_gold_binary=0 \
    -Dlinux_use_gold_flags=0 \
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
    -Duse_system_zlib=0 \
    -Duse_gconf=0 \
    -Ddisable_glibc=1 \
    -Ddisable_pnacl=1 \
    -Ddisable_sse2=1

  make chrome chrome_sandbox BUILDTYPE=Release
}

package() {
  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 -o root -g root out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chromium-sandbox"

  cp out/Release/{*.pak,libffmpegsumo.so,nacl_helper{,_bootstrap}} \
    out/Release/{libppGoogleNaClPluginChrome.so,nacl_irt_*.nexe} \
    "$pkgdir/usr/lib/chromium/"

  if [[ $CARCH == i686 ]]; then
    rm "$pkgdir/usr/lib/chromium/nacl_irt_x86_64.nexe"
  fi

  # Allow users to override command-line options
  install -Dm644 "$srcdir/chromium.default" "$pkgdir/etc/chromium/default"

  cp -a out/Release/locales "$pkgdir/usr/lib/chromium/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -D "$srcdir/chromium.sh" "$pkgdir/usr/bin/chromium"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
