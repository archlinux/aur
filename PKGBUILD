# Maintainer: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf
_pkgname=LibreWolf
pkgver=69.0.3
pkgrel=1
pkgdesc="Community-maintained fork of Librefox: a privacy and security-focused browser"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://LibreWolf.gitlab.io"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm git binutils)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags !strip)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        $pkgname.cfg.patch
        "no-relinking.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/no-relinking.patch?h=packages/firefox"
        "git+https://gitlab.com/${pkgname}-community/browser/common.git"
        "git+https://gitlab.com/${pkgname}-community/settings.git")
sha256sums=('7527947a876c1734b8b2339f19b8ff8da6f4e4d06351b44940cb48d3509bb891'
            '0471d32366c6f415f7608b438ddeb10e2f998498c389217cdd6cc52e8249996b'
            'e03332f0e865949df5af9c231a364e9e1068fca0439621b98c2d4160d93e674f'
            '2dc9d1aa5eb7798c89f46478f254ae61e4122b4d1956d6044426288627d8a014'
            'SKIP'
            'SKIP')
prepare() {
  _POCKET_SED_STRING="s/'pocket'/#'pocket'/g"
  _POCKET_FILE=./browser/components/moz.build

  mkdir mozbuild
  cd firefox-$pkgver

  # TODO: do we need this for our LibreWolf ~uild?
  # Avoid relinking during buildsymbols
  patch -Np1 -i ../no-relinking.patch

  # NOTE:
  # unlock some prefs I deem worthy of keeping unlocked or slightly less restricted
  # (with librewolf installed systemwide, you'd otherwise always have to sudo around in /usr/lib)
  # it mainly keeps addon update / install settings / urls unlocked
  # as well as form fill settings
  # uncomment it if you are OK with a slight potential decrease in privacy,
  # or even better: check what I'm doing there.

  # cd ${srcdir}/${pkgname}
  # patch -Np1 -i ${srcdir}/${pkgname}.cfg.patch
  # cd ${srcdir}/firefox-$pkgver

  cat >../mozconfig <<END
ac_add_options --enable-application=browser

# This supposedly speeds up compilation (We test through dogfooding anyway)
ac_add_options --disable-tests
ac_add_options --disable-debug

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
# ac_add_options --enable-lto
# export MOZ_PGO=1
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
# ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${pkgname}
ac_add_options --with-distribution-id=io.gitlab.${pkgname}
ac_add_options --with-unsigned-addon-scopes=app,system
# export MOZ_APP_REMOTINGNAME=${_pkgname//-/}
# export MOZ_TELEMETRY_REPORTING=0
export MOZ_REQUIRE_SIGNING=0

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-gconf
ac_add_options --disable-updater
ac_add_options --disable-tests

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# options for ci / weaker build systems
# mk_add_options MOZ_MAKE_FLAGS="-j2"
# ac_add_options --enable-linker=gold
END


  rm -f ${srcdir}/common/source_files/mozconfig
  cp -r ${srcdir}/common/source_files/* ./


  # Disabling Pocket
  sed -i $_POCKET_SED_STRING $_POCKET_FILE
}


build() {
  cd firefox-$pkgver

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

  # LTO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  CFLAGS="${CFLAGS/-fno-plt/}"
  CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  # Do 3-tier PGO
  msg2 "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END
  ./mach build

  msg2 "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -a -n 92 -s "-screen 0 1600x1200x24" \
    ./mach python build/pgo/profileserver.py

  if ! compgen -G '*.profraw' >&2; then
    error "No profile data produced."
    return 1
  fi

  if [[ ! -s jarlog ]]; then
    error "No jar log produced."
    return 1
  fi

  msg2 "Removing instrumented browser..."
  ./mach clobber

  msg2 "Building optimized browser..."
  # xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  msg2 "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install
  # find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

  _vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
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

  cp -r ${srcdir}/settings/* ${pkgdir}/usr/lib/${pkgname}/

  _distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=io.gitlab.${pkgname}
version=1.0
about=LibreWolf Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/${pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 browser/branding/librewolf/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dm644 browser/branding/${pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/librewolf-bin"
}
