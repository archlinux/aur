# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

### Appmenu patching ###
# PKGBUILD: Nikita Tarasov <nikatar@disroot.org>

pkgname=firefox-appmenu
_pkgname=firefox
pkgver=75.0
pkgrel=2
pkgdesc="Firefox from extra with appmenu patch"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg nss
         ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2 python
             nodejs python2-psutil cbindgen nasm)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("firefox=$pkgver")
conflict=("firefox")
options=(!emptydirs !makeflags !strip)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        0001-Bug-1623885-Add-subsystem-to-Mesa-sandbox-policy-to-.patch
        0001-Use-remoting-name-for-GDK-application-names.patch
        $_pkgname.desktop
        unity-menubar.patch)
sha256sums=('bbb1054d8f2717c634480556d3753a8483986af7360e023bb6232df80b746b0f'
            'SKIP'
            'ebb169804750ddc10a4801ed6ddb37356331bbf76615f58eb29de2e6e15ee930'
            '5f7ac724a5c5afd9322b1e59006f4170ea5354ca1e0e60dab08b7784c2d8463c'
            '34514a657d6907a159594c51e674eeb81297c431ec26a736417c2fdb995c2c0c'
            '364e5c59a5a55d0be43bcb090dec51476580d0c35b63c0974a25bfeba212a1fc')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

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
  cd firefox-$pkgver
  
  # https://bugs.archlinux.org/task/66185
  patch -Np1 -i ../0001-Bug-1623885-Add-subsystem-to-Mesa-sandbox-policy-to-.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  # actual appmenu patch from ubuntu repos
  # http://archive.ubuntu.com/ubuntu/pool/main/f/firefox/firefox_75.0+build3-0ubuntu0.18.04.1.debian.tar.xz
  patch -Np1 -i ../unity-menubar.patch

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}
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
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --disable-gconf
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

  # LTO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  CFLAGS="${CFLAGS/-fno-plt/}"
  CXXFLAGS="${CXXFLAGS/-fno-plt/}"

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

  if [[ ! -s merged.profdata ]]; then
    echo "No profile data produced."
    return 1
  fi

  if [[ ! -s jarlog ]]; then
    echo "No jar log produced."
    return 1
  fi

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dvm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  if [[ -f "$startdir/.crash-stats-api.token" ]]; then
    find . -name '*crashreporter-symbols-full.zip' -exec \
      "$startdir/upload-symbol-archive" "$startdir/.crash-stats-api.token" {} +
  else
    find . -name '*crashreporter-symbols-full.zip' -exec \
      cp -fvt "$startdir" {} +
  fi
}
