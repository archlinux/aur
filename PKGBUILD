# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-wayland-git
_pkgname=firefox
pkgver=57.1.1.r8194.g6f90fe49c2f3
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell sqlite ttf-font libpulse)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf inetutils xorg-server-xvfb
             autoconf2.13 rust mercurial clang llvm jack)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags !strip)
_repo=https://hg.mozilla.org/mozilla-unified
provides=('firefox')
conflicts=('firefox')
source=('git+https://github.com/stransky/gecko-dev.git'
        wifi-disentangle.patch wifi-fix-interface.patch
        0001-Bug-1384062-Make-SystemResourceMonitor.stop-more-res.patch
        no-plt.diff plugin-crash.diff glibc-2.26-fix.diff
        firefox.desktop firefox-symbolic.svg firefox-install-dir.patch)
sha256sums=('SKIP'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'aba767995ffb1a55345e30aaba667f43d469e23bd9b1b68263cf71b8118acc96'
            'ea8e1b871c0f1dd29cdea1b1a2e7f47bf4713e2ae7b947ec832dba7dfcc67daa'
            'a7e5d2430bb562f6367deb07417dad4368317e8e8be5d1cfa842c3356de3cfc0'
            'cd7ff441da66a287f8712e60cdc9e216c30355d521051e2eaae28a66d81915e8'
            'ada313750e6fb14558b37c764409a17c1672a351a46c73b350aa1fe4ea9220ef'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd')

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
  cd "gecko-dev"
  git describe --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/firefox\.wayland\.//g'
}

prepare() {
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd "gecko-dev"
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../wifi-disentangle.patch
  patch -Np1 -i ../wifi-fix-interface.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1384062
  # patch -Np1 -i ../0001-Bug-1384062-Make-SystemResourceMonitor.stop-more-res.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../no-plt.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1400175
  # patch -Np1 -i ../plugin-crash.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1385667
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1394149
  # patch -Np1 -i ../glibc-2.26-fix.diff

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >.mozconfig <<END
. \$topsrcdir/browser/config/mozconfig

ac_add_options --enable-default-toolkit=cairo-gtk3

mk_add_options BUILD_OFFICIAL=1
mk_add_options MOZILLA_OFFICIAL=1
mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/objdir-wayland
mk_add_options AUTOCLOBBER=1

ac_add_options --disable-crashreporter
ac_add_options --without-system-nspr
ac_add_options --without-system-nss

ac_add_options --enable-debug
ac_add_options --disable-optimize

ac_add_options --enable-release
ac_add_options --disable-tests

ac_add_options --with-gl-provider=EGL
END
}

build() {
  cd "gecko-dev"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  export PATH="$srcdir/path:$PATH"
  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_SOURCE_CHANGESET=c89cd5371520

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  ./mach buildsymbols
}

package() {
  cd "gecko-dev"
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols.zip' -exec cp -fvt "$startdir" {} +

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Opt all of us into e10s, instead of just 50%
pref("browser.tabs.remote.autostart", true);
END

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Use system-provided dictionaries
  # rm -r "$pkgdir"/usr/lib/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$_pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$_pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$_pkgname" \
    "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  ln -srf "$pkgdir/usr/lib/libnssckbi.so" \
    "$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
}
