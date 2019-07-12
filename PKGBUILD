# Maintainer: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf
_pkgname=LibreWolf
pkgver=68.0
pkgrel=1
pkgdesc="Community-maintained fork of Librefox: a privacy and security-focused browser"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://LibreWolf.gitlab.io"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm git inkscape)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        $pkgname.cfg.patch
        "git+https://gitlab.com/${pkgname}-community/${pkgname}.git#commit=a9a64b7f")
sha256sums=('f7d61a08820088f1280d27f0808e355152c1dd0c94625fd077ced7319e522565'
            '0471d32366c6f415f7608b438ddeb10e2f998498c389217cdd6cc52e8249996b'
            '5b748388c83fae3d09978f845b0211692ebb9191e28709c7e04daf0f49a5ea48'
            'SKIP')
#
# For telemetry and crash dump analysis to work correctly, we need to tell the
# build system which Mercurial changeset is our source. Should not be needed
# anymore once 69 is released:
# https://bugzilla.mozilla.org/show_bug.cgi?id=1338099
# _repo=https://hg.mozilla.org/releases/mozilla-release
# _tag=FIREFOX_${pkgver//./_}_RELEASE
#
# _changeset=353628fec415324ca6aa333ab6c47d447ecc128e
# _changeset_tag=FIREFOX_68_0_RELEASE
#
# if [[ $1 == update_hgrev ]]; then
  # _changeset=$(hg id -r $_tag --id $_repo --template '{node}')
  # sed -e "/^_changeset=/s/=.*/=$_changeset/;/^_changeset_tag=/s/=.*/=$_tag/" \
      # -i "${BASH_SOURCE[0]}"
  # exit 0
# elif [[ $_tag != $_changeset_tag ]]; then
  # error "Changeset needs update. Run: bash PKGBUILD update_hgrev"
  # exit 1
# fi

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

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

  local ICON_FOLDER=$srcdir/$pkgname/branding/icon
  local BRANDING_FOLDER=$srcdir/$pkgname/browser/common/source_files/browser/branding/$pkgname

  # generate icons and moves them to the branding folder
  echo Generating icons from $ICON_FOLDER and moving to $BRANDING_FOLDER;
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/default16.png -w 16 -h 16
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/default32.png -w 32 -h 32
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/default48.png -w 48 -h 48
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/default64.png -w 64 -h 64
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/default128.png -w 128 -h 128
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/VisualElements_70.png -w 70 -h 70
  inkscape -z -f $ICON_FOLDER/icon.svg -e $BRANDING_FOLDER/VisualElements_150.png -w 150 -h 150

  cat >.mozconfig <<END
ac_add_options --enable-application=browser

# This supposedly speeds up compilation (We test through dogfooding anyway)
ac_add_options --disable-tests
ac_add_options --disable-debug

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-lto
export MOZ_PGO=1
export CC=clang
export CXX=clang++
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
export MOZ_REQUIRE_SIGNING=1

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

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0
END

  cp -r ${srcdir}/${pkgname}/browser/common/source_files/browser ./

  # Disabling Pocket
  sed -i "s/'pocket'/#'pocket'/g" ./browser/components/moz.build
}


build() {
  cd firefox-$pkgver

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

  # LTO needs more open files
  ulimit -n 4096

  # optional: use fewer cores when building
  # export MOZ_MAKE_FLAGS="-j2"
  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
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

  cp -r ${srcdir}/${pkgname}/settings/* $pkgdir/usr/lib/$pkgname

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
