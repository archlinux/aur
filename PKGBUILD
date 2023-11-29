# Maintainer: éclairevoyant
# Contributor: tarball <bootctl at gmail dot com>

pkgname=mullvad-browser
pkgver=13.0.4
_esrbuildver=115.5.0esr-13.0-1-build2
# will not build with stable, see mozilla/mp4parse-rust#387; also see "uses" column of
# https://firefox-source-docs.mozilla.org/writing-rust-code/update-policy.html
_rustver=1.69.0
pkgrel=1
pkgdesc='Privacy-focused web browser developed by Mullvad VPN and the Tor Project'
arch=(x86_64)
license=(GPL LGPL MPL)
depends=(
  dbus-glib
  ffmpeg
  gtk3
  libpulse
  libxt
  mime-types
  nss
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rustup
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
validpgpkeys=(
  'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290' # Tor Browser Developers (signing key) <torbrowser@torproject.org>
)
source=(
  https://cdn.mullvad.net/browser/$pkgver/src-firefox-mullvad-browser-$_esrbuildver.tar.xz{,.asc}
  $pkgname.desktop
)
sha256sums=('b3be616c1e4141a530d638f0360f8385d7908f555d5e8ad4151f6511987b0da3'
            'SKIP'
            '9bb24b8e210112b1222d028285c6d68ab599f8382b2b108ab69284948bb4ac70')

prepare() {
  export RUSTUP_TOOLCHAIN=$_rustver
  rustup default $_rustver
  mkdir -p mozbuild

  rm -rf $pkgname-$pkgver
  mv firefox-mullvad-browser-* $pkgname-$pkgver
  cd $pkgname-$pkgver

  cat >../mozconfig <<END
export MOZ_APP_REMOTINGNAME=${pkgname//-/}

mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-application=browser
ac_add_options --with-base-browser-version=$pkgver
ac_add_options --with-app-basename=$pkgname
ac_add_options --with-app-name=$pkgname

ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-optimize
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --prefix=/usr
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

ac_add_options --with-branding=browser/branding/mb-release
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

ac_add_options --with-system-nspr
ac_add_options --with-system-nss

ac_add_options --enable-alsa
ac_add_options --enable-jack

ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END

  # GCC 13 fix
  sed '18i#include <cstdint>' -i gfx/2d/Rect.h
  sed '7i#include <cstdint>' -i dom/media/webrtc/sdp/RsdparsaSdpGlue.cpp
}

build() {
  export RUSTUP_TOOLCHAIN=$_rustver
  rustup default $_rustver
  cd $pkgname-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package

  LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
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
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build
}

package() {
  cd $pkgname-$pkgver
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
id=$pkgname-aur
version=1.0
about=Mullvad Browser for Arch Linux (AUR)

[Preferences]
app.distributor='Arch User Repository'
app.distributor.channel=$pkgname
app.partner.archlinux=$pkgname
END

  local i
  local theme=mb-release

  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"

  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/$pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/$pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}

# vim:set sw=2 sts=-1 et:
