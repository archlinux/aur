# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/firefox-developer-edition by Andrew Crerar <crerar@archlinux.org>
# Based on extra/thunderbird by Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=thunderbird-beta
_pkgname=thunderbird
pkgver=121.0b1
pkgrel=1
pkgdesc='Beta version of standalone mail and news reader from mozilla.org'
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.thunderbird.net/channel/#beta"
depends=(
  alsa-lib
  botan2
  bzip2 libbz2.so
  cairo
  dbus-glib
  dbus libdbus-1.so
  ffmpeg
  fontconfig libfontconfig.so
  freetype2 libfreetype.so
  gcc-libs
  gdk-pixbuf2
  glib2 libglib-2.0.so
  glibc
  gnupg
  gtk3
  gtk3 libgdk-3.so libgtk-3.so
  hunspell
  icu libicui18n.so libicuuc.so
  json-c
  libcanberra
  libevent
  libffi libffi.so
  libjpeg-turbo
  libpulse
  libvpx libvpx.so
  libwebp libwebp.so libwebpdemux.so
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrender
  libxt
  mime-types
  nspr
  nss
  pango libpango-1.0.so
  pixman libpixman-1.so
  sqlite
  ttf-font
  zlib
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  findutils
  gawk
  imake
  inetutils
  jack
  libice
  libotr
  libsm
  lld
  llvm
  mesa
  nasm
  nodejs
  perl
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip
)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
optdepends+=('libotr: OTR support for active one-to-one chats')
options=(!emptydirs !makeflags !strip !lto !debug)
provides=("thunderbird=$pkgver")
source=(https://archive.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz{,.asc}
        install-dir.patch
        "$pkgname".desktop
)
b2sums=('5f57b0b9fdcb49c3ad5ace7f8aebd0bddba5e2d2be28d7dc08b87098de7c0ba808015556f7d21906d0e02cfcc1239c98511d32ffd9f0bd85a3a85389046a8af5'
        'SKIP'
        'ba188a0c1359f49390a789621b2c0bec67f4152f62c0dced26b31ec291abccfb5636dba0f8ed1f879e1a2a237e183b96b092d760e04e148a64da18660b87dcfb'
        '3518012290b5b358d882d7d12bc2455345b89cef4abfbccaca025dfb935fcefe49806dd534e75b10c0c6a3495b7133a7feb3f11d7773a0ce252f8d68e15b5a24')
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
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

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
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}
export MOZ_REQUIRE_SIGNING=

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-jsonc
# does not have APNG support
# ac_add_options --with-system-png
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-botan
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
ac_add_options --with-system-ffi
ac_add_options --with-system-pixman

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests

# System addons
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
END
}

build() {
  cd "${_pkgname}-${pkgver%b*}"

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE="pip"

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

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

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory.
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Disable telemetry.
pref("datareporting.healthreport.uploadEnabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("toolkit.telemetry.archive.enabled", false);
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

  install -Dm644 comm/mail/branding/thunderbird/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
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
