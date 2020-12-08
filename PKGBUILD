# $Id$
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env enable_pgo=y makepkg -sc
##
## Optimized build: env enable_pgo=y enable_lto=y makepkg -sc
## Optimized build, less RAM required: env enable_pgo=y enable_lto=y enable_no_keep_memory=y makepkg -sc
## Less optimization enabled, faster compilation: env enable_pgo=n enable_lto=n makepkg -sc
##
## Enable PGO, increasing performances but makes the compilation slower.
## It builds Firefox a first time without LTO, runs the test suite to generate
## a PGO profile, then builds Firefox again (with optional LTO) using this
## profile.
## Set variable "enable_pgo" to: y to enable (increase performance, default in official firefox-beta)
##                               n to disable  (less optimized, but faster compilation, as it will skip the profile generation)
if [ -z ${enable_pgo+x} ]; then
  enable_pgo=y
fi

## Enable LTO, increasing performances but makes the compilation slower and
## requires more RAM to build. Only affects clang, rust has LTO enabled by
## default.
## Disable it if the compilation runs out-of-memory.
## Set variable "enable_lto" to: y to enable (increase performance, default in official firefox-beta, but slower to compile)
##                               n to disable  (less optimized, but faster to compile)
if [ -z ${enable_lto+x} ]; then
  enable_lto=y
fi

## Enable --no-keep-memory in LD when compiling with LTO enabled. Useful when
## running OOM during the compilation, as LD will consume less memory when ##
## linking. Doesn't impact the performance of the generated binary, but makes
## the compilation a bit slower.
## Set variable "enable_no_keep_memory" to: n to disable  (default)
##                                          y to enable (slower compilation, but compilation requires less memory)
if [ -z ${enable_no_keep_memory+x} ]; then
  enable_no_keep_memory=n
fi

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgname=firefox-beta
_pkgname=firefox
pkgver=84.0rc1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
_pkgver=84.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/channel/#beta"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg 'nss>=3.55' ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack gtk2 nodejs cbindgen nasm
             python-setuptools python-psutil lld)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("firefox=$pkgver")
conflicts=('firefox-beta-bin')
options=(!emptydirs !makeflags !strip)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/$_pkgname-$pkgver.source.tar.xz{,.asc}
        0001-Use-remoting-name-for-GDK-application-names.patch
        $pkgname.desktop)
sha256sums=('8a2c2e0d5ff510b4366b6124a499603a05eefdce015c22b02d36023ab6dc3665'
            'SKIP'
            '3bb7463471fb43b2163a705a79a13a3003d70fff4bbe44f467807ca056de9a75'
            '54d93249fedc9c4cdc5eb82da498b08f08bcb089f85a138b457f3251a0913ad1')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# RC
if [[ $_build = ? ]]; then
  source[0]="firefox-$pkgver.source.tar.xz::https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/source/firefox-$_major.source.tar.xz"
  source[1]="firefox-$pkgver.source.tar.xz.asc::https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/source/firefox-$_major.source.tar.xz.asc"
fi

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a


prepare() {
  mkdir mozbuild
  cd firefox-$_pkgver

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=beta
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}
export MOZ_TELEMETRY_REPORTING=1
export MOZ_REQUIRE_SIGNING=1

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
  cd firefox-$_pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_USE_SYSTEM_PYTHON=1

  # LTO needs more open files
  ulimit -n 4096

  if [ "$enable_pgo" = "y" ]; then
    # Do 3-tier PGO
    echo "Building instrumented browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
    ./mach build

    echo "Profiling instrumented browser..."
    ./mach package
    LLVM_PROFDATA=llvm-profdata \
      JARLOG_FILE="$PWD/jarlog" \
      xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
      ./mach python build/pgo/profileserver.py

    stat -c "Profile data found (%s bytes)" merged.profdata
    test -s merged.profdata

    stat -c "Jar log found (%s bytes)" jarlog
    test -s jarlog

    echo "Removing instrumented browser..."
    ./mach clobber

    echo "Building optimized browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  else
    cat >.mozconfig ../mozconfig
  fi

  if [ "$enable_lto" = "y" ]; then
    echo "ac_add_options --enable-lto=cross" >> .mozconfig
    if [ "$enable_no_keep_memory" = "y" ]; then
      LDFLAGS="$LDFLAGS,--no-keep-memory"
    fi
  fi
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-$_pkgver
  DESTDIR="$pkgdir" ./mach install
  mv "$pkgdir"/usr/lib/{firefox,$pkgname}
  rm "$pkgdir"/usr/bin/firefox

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

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

