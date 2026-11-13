# Maintainer: Neowutran <aur at neowutran dot ovh>

pkgname=librewolf-with-dane
_original_name=librewolf
conflicts=(librewolf)
# The pkgver should always ends with a trailing ".0" for "round" release, so "155.0_1" should instead be "155.0.0_1" for instance
# Otherwise, we will face version comparison issues: "warning: librewolf: local (154.0_2-1) is newer than extra-testing (154.0.1_2-1)"
# We therefore "re-compute" the pkgver to match the actual upstream version scheme in the custom _pkgver variable, see README.md for more details
pkgver=160.0.0_1
# Extract the first part of the pkgver, this represents the Firefox release this LibreWolf release is based on
_firefoxver="${pkgver%_*}"
# Remove any trailing ".0" to match the real Firefox version, as "round" Firefox releases actually doesn't contain it,
# (despite what https://www.firefox.com/en-US/releases/ is showing)
# For "155.0.0" this will result in "155.0", for "155.0.1" it won't change anything
_realfirefoxver="${_firefoxver%.0}"
# Extract the second part of the pkgver, this represents the Librewolf release
_librewolfver="${pkgver#*_}"
# Combine the "re-computed" pkgver (which actually matches the upstream version scheme) into a custom _pkgver variable
_pkgver="${_realfirefoxver}-${_librewolfver}"
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom"
url="https://librewolf.net/"
arch=(x86_64 aarch64)
license=(MPL-2.0)

depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
  dane-without-root
)
makedepends=(
  cbindgen
  clang
  diffutils
  git
  imake
  jack
  jq
  lld
  llvm
  mesa
  nasm
  nodejs
  onnxruntime
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
  dane-without-root
)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

options=(
  !emptydirs
  !lto
  !makeflags
)

source=(
  https://librewolf.dev/api/packages/librewolf/generic/librewolf-source/$_pkgver/librewolf-$_pkgver.source.tar.gz{,.sig}
  $_original_name.desktop
  system_library_firefox.patch
  z_librewolf_ui_patch.patch
)

sha256sums=('a2901ce211dce6c250cbe04a1324f239f9bb99d87b288cfa8e09da206e684e38'             'SKIP'             '3d6ac59ae9d5ba4c9fe15f95c1338fa68214dec6119f8432336403e3be50f8ae'             '212a5e453afb4274235e7a4aea333c3893928de6f1af5db9d160e2312fe49279'             '01c665a54b86beed44bbd8719d12256d0cd2dc44a6397afa5a6e832c52dc90e1') 

validpgpkeys=('662E3CDD6FE329002D0CA5BB40339DD82B12EF16') # https://rpm.librewolf.net/pubkey.gpg

copy_dane_lib(){
  mkdir -p obj/dist/bin/
  mkdir -p obj/dist/librewolf/
  cp /usr/lib/libdane_without_root.so obj/dist/bin/
  cp /usr/lib/libdane_without_root.so obj/dist/librewolf/
}


prepare() {
  mkdir -p mozbuild
  cd librewolf-$_pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  sed 's/^\([a-zA-Z].*(.*$\)/__attribute__((visibility("default")))\n\1/g' /usr/include/dane_without_root.h | tee security/certverifier/dane_without_root.h
  copy_dane_lib

  mv mozconfig ../mozconfig

  cat >>../mozconfig <<END
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --with-app-name=${_original_name}
export MOZ_APP_REMOTINGNAME=${_original_name}

# Language packs
ac_add_options --with-l10n-base=$PWD/lw/l10n

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
# keep alsa option in here until merged upstream
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-pulseaudio
ac_add_options --disable-updater
END

  # reduce chance of builds failung during linking due to running out of memory
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # upstream Arch fixes

}

pkgver() {
  # Ensure the pkgver is properly formatted to avoid eventual version comparison issues
  # See README.md for more details
  echo "$pkgver" | sed -E 's/^([0-9]+\.[0-9]+)_/\1.0_/'
}

build() {
  cd librewolf-$_pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # temporarily disable ublock-origin, interferes with profiling
  cp "lw/policies.json" "$srcdir/policies.json"
  jq 'del(.policies.Extensions.Install)' "$srcdir/policies.json" > "lw/policies.json"

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  #copy_dane_lib
  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  copy_dane_lib
  ./mach package
  copy_dane_lib
  LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
    dbus-run-session \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber objdir
  copy_dane_lib

  # reenable ublock-origin
  cp "$srcdir/policies.json" "lw/policies.json"

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal
  copy_dane_lib

  # Re-package built sources including language packs
  xargs ./mach package-multi-locale --locales < browser/locales/shipped-locales
}

package() {
  cd librewolf-$_pkgver

  # The `install` target doesn't install the language packs generated with the `package-multi-locale` target
  # We are therefore "manually" copying the packaged browser to the relevant directory in `$pkgdir` instead
  #DESTDIR="$pkgdir" ./mach install
  local appdir="$pkgdir/usr/lib/$_original_name"
  install -dvm755 "$appdir/"
  cp -a obj/dist/librewolf/. "$appdir/"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=io.gitlab.${_original_name}-community
version=1.0
about=LibreWolf

[Preferences]
app.distributor="LibreWolf Community"
app.distributor.channel=$_original_name
app.partner.librewolf=$_original_name
END

  # Install desktop icons and metadata
  local i theme=librewolf
  for i in 16 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_original_name.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_original_name.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_original_name.png"

  # Librewolf is missing an svg logo
  install -Dvm644 browser/branding/${theme}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_original_name-symbolic.png"

  # Install desktop file
  install -Dvm644 ../$_original_name.desktop "$pkgdir/usr/share/applications/$_original_name.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_original_name" <<END
#!/bin/sh
exec /usr/lib/$_original_name/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_original_name" "$appdir/librewolf-bin"

  ln -sfv ../libdane_without_root.so -t "$appdir"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi
}

# vim: ts=2 sw=2 et:
