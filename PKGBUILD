# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on community/firefox-developer-edition by Andrew Crerar <crerar@archlinux.org>

pkgname=thunderbird-beta
_pkgname=thunderbird
pkgver=103.0b4
pkgrel=2
pkgdesc='Beta version of standalone mail and news reader from mozilla.org'
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.thunderbird.net/channel/#beta"
depends=(
  glibc gtk3 libgdk-3.so libgtk-3.so mime-types dbus libdbus-1.so dbus-glib
  alsa-lib nss hunspell sqlite ttf-font libvpx libvpx.so zlib bzip2 libbz2.so
  botan libwebp libwebp.so libwebpdemux.so libevent libjpeg-turbo libffi
  libffi.so nspr gcc-libs libx11 libxrender libxfixes libxext libxcomposite
  libxdamage pango libpango-1.0.so cairo gdk-pixbuf2 icu libicui18n.so
  libicuuc.so freetype2 libfreetype.so fontconfig libfontconfig.so glib2
  libglib-2.0.so pixman libpixman-1.so gnupg
)
makedepends=('unzip' 'zip' 'diffutils' 'python-setuptools' 'yasm' 'mesa' 'imake' 'inetutils'
             'xorg-server-xvfb' 'autoconf2.13' 'rust' 'clang' 'llvm' 'jack'
             'nodejs' 'cbindgen' 'nasm' 'lld' 'python-zstandard' 'dump_syms'
             'libpulse' 'gawk' 'perl' 'findutils' 'libotr'
             'wasi-compiler-rt' 'wasi-libc' 'wasi-libc++' 'wasi-libc++abi')
optdepends=('libnotify: Notification integration'
            'libcanberra: sound support'
            'libotr: OTR support for active one-to-one chats'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
provides=("thunderbird=$pkgver")
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz{,.asc}
        "$pkgname".desktop
        install-dir.patch
        zstandard-0.18.0.patch)
sha256sums=('a8b4d63db1583299b75d79a7013d072d238435ef234cbb728ff09eaae2b291f8'
            'SKIP'
            '336db628f428ea5efd2a58231fdb202db1521b604c8317b7151d1aa40793f3d3'
            'c959c9f2b60a42dc937f744c018196906727d468d8f1d7402fb4f743484c414b'
            'a6857ad2f2e2091c6c4fdcde21a59fbeb0138914c0e126df64b50a5af5ff63be')
validpgpkeys=(
  14F26682D0916CDD81E37B6D61B7B526D98F0353 # Mozilla Software Releases <release@mozilla.com>
  4360FE2109C49763186F8E21EBE41E90F6F12F6D # Mozilla Software Releases <release@mozilla.com>
)
# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  mkdir -p mozbuild
  cd "${_pkgname}-${pkgver%b*}"
  
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key
  cat > .mozconfig << END
ac_add_options --enable-application=comm/mail
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=aurora
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}
export MOZ_REQUIRE_SIGNING=

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd "${_pkgname}-${pkgver%b*}"

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE="system"

  echo "Building thunderbird..."
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd "${_pkgname}-${pkgver%b*}"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" << END
// Use LANG environment variable to choose locale.
pref("intl.locale.requested", "");

// Use system-provided dictionaries.
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory.
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" << END
[Global]
id=archlinux
version=1.0
about=Mozilla Thunderbird Beta for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dvm644 comm/mail/branding/thunderbird/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << END
#!/bin/sh
exec /usr/lib/$pkgname/$_pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/$_pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}
