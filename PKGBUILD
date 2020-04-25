# Maintainer: LinuxVieLoisir <contact@gnumeria.fr>

pkgname=firefox-nightly-hg
pkgver=r526053.d8a8178627c4
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, nightly version"
_repo=https://hg.mozilla.org/mozilla-central
_pkgname=firefox-nightly
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=(gtk3 nss-hg nspr-hg mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg sqlite ttf-font libpulse libvpx icu)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust ccache mercurial clang llvm jack 
             python nodejs python2-psutil cbindgen nasm)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
conflicts=('firefox-nightly')
url="http://www.mozilla.org/projects/firefox"
install=firefox.install
options=(!emptydirs)
source=("hg+$_repo"
        firefox-nightly.desktop
        firefox-nightly-updater.desktop
        firefox-nightly-updater
        vendor.js)

sha512sums=('SKIP'
            '28219dab29bb53fa66c894ea16330f3cd20f6783000141a1a57e2a9616d9b4a377f85fd8d213e47c5323738e0a867039bc64648e2316aa7519266d23c14989e4'
            'bda40248aac3fc352931a5f3bba32b7645a881bd67925e55098f3e2e14f8460fa011c80193522d13747bf0d1117d7fb4afe740fdff28bfc1f975eba4c2345532'
            '65d0c840bad906eb7558c9c14c3316a205627912f552ffe5a78ba95fb90bd9a87d541403592afeb8a37171ec410519d15ae027c1c418852ef63a02f128a392d5'
            'd927e5e882115c780aa0d45034cb1652eaa191d95c15013639f9172ae734245caae070018465d73fdf86a01601d08c9e65f28468621422d799fe8451e6175cb7')

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

pkgver() {
  cd mozilla-central
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"  
}

prepare() {
  mkdir -p mozbuild
  cd mozilla-central
  
  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib
export MOZ_TELEMETRY_REPORTING=1
export MOZ_REQUIRE_SIGNING=1
mk_add_options AUTOCLOBBER=1
mk_add_options AUTOCONF=autoconf-2.13
ac_add_options --enable-application=browser
ac_add_options --prefix=/usr
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-jpeg
ac_add_options --with-system-png
ac_add_options --with-ccache

# Branding
ac_add_options --with-branding=browser/branding/nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --enable-application=browser

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-debug
ac_add_options --disable-tests
ac_add_options --disable-crashreporter
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-debug-symbols
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
END
}

build() {
  cd mozilla-central

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  #./mach build
  # LTO/PGO needs more open files
  ulimit -n 4096
  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
  ./mach buildsymbols
}

package() {
  cd mozilla-central
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=archlinux
version=1.0
about=Mozilla Firefox Nightly for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  mv "$pkgdir/usr/lib/firefox" "$pkgdir/usr/lib/$_pkgname"
  cp "$srcdir/firefox-nightly-updater" "$pkgdir/usr/bin/firefox-nightly-updater"

  
  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/nightly/default32.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 browser/branding/nightly/default128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"

  install -Dm644 browser/branding/nightly/default128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"

  install -Dm644 ../firefox-nightly.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 ../firefox-nightly-updater.desktop \
    "$pkgdir/usr/share/applications/firefox-nightly-updater.desktop"
    
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox/firefox-nightly "\$@"
END

  ln -sf "$pkgdir/usr/lib/$_pkgname/firefox/firefox-bin" "$pkgdir/usr/bin/$_pkgname"
  rm -rf "$pkgdir"/usr/lib/$_pkgname/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/$_pkgname/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/$_pkgname/hyphenation"
  }
