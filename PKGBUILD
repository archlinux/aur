### Original Thunderbird from extra ###
# Maintainer: N Fytilis <n-fit[at]live.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

### Appmenu patching ###
# PKGBUILD: Nikita Tarasov <nikatar@disroot.org>

_pkgname=thunderbird
pkgbase=thunderbird-appmenu
pkgname=thunderbird-appmenu
pkgver=115.6.1
pkgrel=6
pkgdesc="Thunderbird from extra with appmenu patch"
arch=(x86_64)
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus-glib
  ffmpeg
  gtk3
  libpulse
  libxss
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
#  lld
  mold
  llvm
  mesa
  nasm
  nodejs
  python
  rust
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
  !makeflags
  !strip
)
source=(https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.xz{,.asc}
        unity-menubar.patch
        0001-Revert-Bug-1817071-Remove-moz-image-region-support-f.patch
        ${_pkgname}.desktop identity-icons-brand.svg)
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
  mkdir -p mozbuild
  cd thunderbird-$pkgver

  echo "${noextract[@]}"

  patch -Np1 -i ../unity-menubar.patch
  patch -Np1 -i ../0001-Revert-Bug-1817071-Remove-moz-image-region-support-f.patch
  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat > ../mozconfig <<END
ac_add_options --enable-application=comm/mail
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=mold
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=${_pkgname}
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${_pkgname}

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
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd thunderbird-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096
  # Do 3-tier PGO
#  echo "Building instrumented comm/mail..."
  cat >.mozconfig ../mozconfig - <<END
#ac_add_options --enable-profile-generate=cross
END
  ./mach build || true # i dont care

( echo '#include <stdint.h>'
cat comm/third_party/rnp/src/libsexp/include/sexp/sexp-error.h
) > tmp.h
  cp tmp.h comm/third_party/rnp/src/libsexp/include/sexp/sexp-error.h
  rm tmp.h # lol

  ./mach build
#  export MOZ_REMOTE_SETTINGS_DEVTOOLS=1
#  echo "Profiling instrumented comm/mail..."
#  ./mach package
#  HOME=$TMPDIR \
#    LLVM_PROFDATA=llvm-profdata \
#    JARLOG_FILE="$PWD/jarlog" \
#    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
#    ./mach python build/pgo/profileserver.py
#
#  stat -c "Profile data found (%s bytes)" merged.profdata
#  test -s merged.profdata
#
#  stat -c "Jar log found (%s bytes)" jarlog
#  test -s jarlog
#
#  echo "Removing instrumented comm/mail..."
  ./mach clobber

  echo "Building optimized comm/mail..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=thin
#ac_add_options --enable-profile-use=cross
#ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
#ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd thunderbird-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/${_pkgname}/comm/mail/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default comm/mail checking.
// pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/${_pkgname}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Thunderbird for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=${_pkgname}
app.partner.archlinux=archlinux
END

  local i theme=thunderbird
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 comm/mail/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
  install -Dvm644 comm/mail/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  install -Dvm644 ../${_pkgname}.desktop \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"

      # Install a wrapper to avoid confusion about binary path
      install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
    #!/bin/sh
    exec /usr/lib/$_pkgname/thunderbird "\$@"
END

      # Replace duplicate binary with wrapper
      # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
      ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/thunderbird-bin"

      # Use system certificates
      local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
      if [[ -e $nssckbi ]]; then
        ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
      fi

      local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
      install -Dvm644 /dev/stdin "$sprovider" <<END
    [Shell Search Provider]
    DesktopId=$_pkgname.desktop
    BusName=org.mozilla.${pkgname//-/}.SearchProvider
    ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
    Version=2
END

      export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
      if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
        make -C obj uploadsymbols
      else
        cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
      fi
}

# vim:set sw=2 et:
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
