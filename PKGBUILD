# Maintainer: LinuxVieLoisir <contact@craftdestiny.ovh>

pkgname=firefox-nightly-hg
_pkgname=firefox-nightly
pkgver=r473709.e0a622476b77
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
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
options=(!emptydirs !makeflags !strip)
_repo=https://hg.mozilla.org/mozilla-central
conflicts=('firefox-nightly' 'firefox-nightly-hg')
source=("hg+$_repo"
        $_pkgname.desktop
        $_pkgname-symbolic.svg)
sha512sums=('SKIP'
            '04ff0a612a5e43bc6951abc0eb84df678e19d1f0233e49ef7e4559688ebce4fa51d1d3ee856ae926b0d0c89f512f223fc70446269b5049428d1c1d5c9abc2155'
            'ba7db9a7c95a051bcd84e4c09c802fc55ee3c0d1d06ec1b169b04e414259b75bbe92fe584aee41a1e3f71e71c160df8bedf5393449e5024110ed27dbc0579ea8')

pkgver() {
  cd mozilla-central
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  mkdir -p mozbuild
  cd mozilla-central

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
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
ac_add_options --with-branding=browser/branding/nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --enable-application=browser
ac_add_options --with-ccache
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

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dm644 ../firefox-nightly-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    mv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/bin/firefox-nightly"
	}
sha512sums=('SKIP'
            '04ff0a612a5e43bc6951abc0eb84df678e19d1f0233e49ef7e4559688ebce4fa51d1d3ee856ae926b0d0c89f512f223fc70446269b5049428d1c1d5c9abc2155'
            'ba7db9a7c95a051bcd84e4c09c802fc55ee3c0d1d06ec1b169b04e414259b75bbe92fe584aee41a1e3f71e71c160df8bedf5393449e5024110ed27dbc0579ea8')
sha512sums=('SKIP'
            '28219dab29bb53fa66c894ea16330f3cd20f6783000141a1a57e2a9616d9b4a377f85fd8d213e47c5323738e0a867039bc64648e2316aa7519266d23c14989e4'
            'ba7db9a7c95a051bcd84e4c09c802fc55ee3c0d1d06ec1b169b04e414259b75bbe92fe584aee41a1e3f71e71c160df8bedf5393449e5024110ed27dbc0579ea8')
