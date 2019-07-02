# Maintainer: LinuxVieLoisir <contact@gnumeria.fr>

pkgname=firefox-nightly-hg
pkgver=r480905.109ccdeb9634
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, nightly version"
_repo=https://hg.mozilla.org/mozilla-central
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss sqlite ttf-font libpulse libvpx icu)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust ccache mercurial clang llvm jack 
             python nodejs python2-psutil cbindgen nasm)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
replaces=('firefox-hg')
url="http://www.mozilla.org/projects/firefox"
install=firefox.install
options=(!emptydirs)
source=("hg+$_repo"
        firefox-hg.desktop
        vendor.js)

sha512sums=('SKIP'
            '5c49649475073c09fc669fcaf59c86f0d179d609039c880f887472f908459ea9371bfb0814ace652154ee2f69e9bff81934e33998fd84d929a3aa49861129d26'
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
mk_add_options MOZ_MAKE_FLAGS="-j5"
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
ac_add_options --without-system-nspr
ac_add_options --without-system-nss
ac_add_options --without-system-libvpx
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
  ./mach build
}

package() {
  cd mozilla-central
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
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

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox Nightly for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  mv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/bin/$pkgname"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/nightly/default32.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 browser/branding/nightly/default64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

  install -Dm644 browser/branding/nightly/default128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  install -Dm644 ../firefox-hg.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  # We don't want the development stuff
  rm -rf "$pkgdir"/usr/{include,lib/firefox-devel-$_ffver,share/idl}
  }
