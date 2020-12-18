# Maintainer: LinuxVieLoisir <contact@gnumeria.fr>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
pkgname=firefox-nightly-hg
_pkgname=firefox-nightly
pkgver=86.0a1.r561202.2231d839f1e7
_pkgver=86.0a1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, nightly version"
arch=(x86_64)
license=(MPL GPL LGPL)
_repo=https://hg.mozilla.org/mozilla-central
url="https://www.mozilla.org/firefox/"
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg
         ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
            xorg-server-xvfb autoconf2.13 rust ccache mercurial-hg icu clang llvm jack 
            python nodejs python2-psutil cbindgen nasm
            xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2 python
            nodejs python2-psutil cbindgen nasm
            mercurial)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
conflicts=('firefox-nightly')
options=(!emptydirs !makeflags !strip)
source=("hg+$_repo"
        "firefox-nightly.desktop"
        "0001-Use-remoting-name-for-GDK-application-names.patch"
	"D90627.diff")
sha512sums=('SKIP'
            '8b4ac564aaa39d5a3ea7fda12eed047687916fd9c084407157dd380d4a3db7cf41aebc4b6ab9aa2a5a3e1cddd1f03440f9471a6c091e5d8339bde193436612d0'
            'afb4a230b3e87cfb71687b3fe375c78463e02a6f7b1daa15bf6127f6414c6c29bf2d8df372b59b4df7f90fc8929582e8aab4e3db5e8b54b1817c96aad00d92ea'
            '02480231cec469fba1e03f669f0a47954bf633f0487ed27d4e0f135d100d9ae023044ef659cc32915aa8acb8dbcbfa2a6a69c78a94700961f9fa80a18bd2f4eb')
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

pkgver() {
  cd mozilla-central
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  mkdir -p mozbuild
  cd mozilla-central
  
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  # https://phabricator.services.mozilla.com/D90627
  #patch -Np1 -i ../D90627.diff
  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key
 
  cat >.mozconfig <<END
ac_add_options --enable-application=browser
ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --with-ccache
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --with-branding=browser/branding/nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_APP_REMOTINGNAME=${pkgname//-/}
export MOZ_TELEMETRY_REPORTING=1
export MOZ_REQUIRE_SIGNING=1
 
# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key
 
# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-updater
END
}

build() {
    cd mozilla-central

    export MOZ_SOURCE_REPO="$_repo"
    export MOZ_NOSPAM=1
    export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

    # LTO/PGO needs more open files
    ulimit -n 4096
    ./mach bootstrap
    xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
    ./mach buildsymbols
}

package() {
  cd mozilla-central
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +
  mv "$pkgdir/usr/lib/firefox" -T "$pkgdir/usr/lib/$_pkgname"

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=nightly
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

  # Recreate the bindir symlink
  rm -vf "$pkgdir/usr/bin/firefox"
  ln -srfv "$pkgdir/usr/lib/$_pkgname/firefox" "$pkgdir/usr/bin/$_pkgname"

  # Replace duplicate binary with another symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/lib/$_pkgname/firefox" "$pkgdir/usr/lib/$_pkgname/firefox-bin"
}
