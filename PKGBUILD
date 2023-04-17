# Maintainer:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-wayland-hg
_pkgname=firefox
pkgver=r659341.4e0bb3e
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (mozilla-unified hg, release branding, targeting wayland)"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 libxt mime-types dbus-glib
         ffmpeg nss-hg ttf-font libpulse xorg-server-xwayland
         libvpx libwebp libjpeg zlib icu libevent pipewire)
makedepends=(git-cinnabar unzip zip diffutils yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python-setuptools lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto)
_repo=https://hg.mozilla.org/mozilla-unified
conflicts=('firefox')
provides=('firefox')
source=("mozilla-unified::git+hg::$_repo#branch=bookmarks/autoland"
        $_pkgname.desktop $_pkgname-symbolic.svg)
sha256sums=('SKIP'
            'a9e5264257041c0b968425b5c97436ba48e8d294e1a0f02c59c35461ea245c33'
            '9a1a572dc88014882d54ba2d3079a1cf5b28fa03c5976ed2cb763c93dabbd797')

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
  cd mozilla-unified
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  mkdir mozbuild
  cd mozilla-unified

  # See https://github.com/glandium/git-cinnabar/issues/311
  git config remote.origin.fetch '^refs/cinnabar/*'

  # EVENT__SIZEOF_TIME_T does not exist on upstream libevent, see event-config.h.cmake
  sed -i '/CHECK_EVENT_SIZEOF(TIME_T, time_t);/d' ipc/chromium/src/base/message_pump_libevent.cc

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  #
  # If you want to disable LTO/PGO (compile too long), delete the lines below beginning with
  # `ac_add_options --enable-lto' and ending with 'export RANLIB=llvm-ranlib`
  #

  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --disable-tests
ac_add_options --enable-lto
ac_add_options MOZ_PGO=1
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# wasi sdk
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
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
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-jpeg

# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
END
}

build() {
  cd mozilla-unified

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_SOURCE_CHANGESET="$(cd $SRCDEST/mozilla-unified; git cinnabar git2hg bookmarks/autoland)"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none

  # LTO/PGO needs more open files
  ulimit -n 4096

  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
  ./mach buildsymbols
}

package() {
  cd mozilla-unified
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols.zip' -exec cp -fvt "$startdir" {} +

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
about=Mozilla Firefox for Arch Linux

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
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$_pkgname" \
    "$pkgdir/usr/lib/$_pkgname/firefox-bin"
}

# vim:set sw=2 et:
