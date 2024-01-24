# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/firefox-developer-edition by Andrew Crerar <crerar@archlinux.org>
# Based on extra/thunderbird by Levente Polyak <anthraxx[at]archlinux[dot]org>

# Pull requests are welcome here:
# https://github.com/yurikoles-aur/thunderbird-beta

pkgname=thunderbird-beta
_pkgname=thunderbird
pkgver=123.0b1
pkgrel=1
pkgdesc='Beta version of standalone mail and news reader from mozilla.org'
arch=(x86_64)
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  libxss
  libxt
  mime-types
  nss
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  inetutils
  jack
  libotr
  lld
  llvm
  mesa
  nasm
  nodejs
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
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'libotr: OTR support for active one-to-one chats'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !emptydirs
  !lto
  !makeflags
)
provides=("thunderbird=$pkgver")
source=(
  https://archive.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz{,.asc}
  $pkgname.desktop
  install-dir.patch
  metainfo.patch
)
b2sums=('12b2d75888ce1a3b09ce2c1b56901468af673f303f0c83bb8ffb2cef2455f9341d12db08a516569e7eed357564025774574f53dc0e4d319e8f174377d7083211'
        'SKIP'
        'c0a500055dc2c5e25b538b010e54e79bea2fb91b9b5927063f429b8931d84f28ecb4c37aaa8895c4a84dafa5066985dd2d99b8294d87c7b311d88109ca036845'
        'ba188a0c1359f49390a789621b2c0bec67f4152f62c0dced26b31ec291abccfb5636dba0f8ed1f879e1a2a237e183b96b092d760e04e148a64da18660b87dcfb'
        '2b31b26f49229f96a645f06892d576f49662de2e5c294a1c164569402f608f267762b1f4448ebea0b77030939952274cb2dfe524bf97f4fb2cdd5f7689b95bcd')
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
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

  # Make icon transparent
  sed -i '/^<rect/d' comm/mail/branding/thunderbird/TB-symbolic.svg

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key
  cat > .mozconfig << END
ac_add_options --enable-application=comm/mail
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
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

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  echo "Building thunderbird..."
  ./mach build
}

package() {
  cd "${_pkgname}-${pkgver%b*}"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default mailer checking
pref("mail.shell.checkDefaultMail", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
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
    install -Dvm644 comm/mail/branding/thunderbird/default${i}.png \
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
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
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
}
