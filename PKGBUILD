# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=firedragon
_pkgver=13.0.0-rc.27
_branding=dr460nized

__pkgname=$_pkgname
_rdns=org.garudalinux.$__pkgname

pkgname=$__pkgname-next
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="FireDragon is a cross-platform, feature-rich and privacy-focused web browser"
url="https://gitlab.com/garuda-linux/firedragon/firedragon13"
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
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  onnxruntime
  pnpm
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
  'onnxruntime: Local machine learning features such as smart tab groups'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(
  !emptydirs
  !lto
  !makeflags
)
source=(
  $_pkgname-v$_pkgver.source.tar.xz::$url/-/releases/v$_pkgver/downloads/$_pkgname.source.tar.xz
  fix-wasm32-wasi-target.patch
)
sha256sums=('5520b0d0dbc80e96a81f4b4a859a4feccddea210c349d49dda3b7f5e264d5270'
            'f7ba345f2b82ce4eab315f15f388e907bed86e00a3011ccd79e732f4e8762124')

prepare() {
  mkdir -p mozbuild
  cd $_pkgname-v$_pkgver

  patch -Nsp1 -i "$srcdir"/fix-wasm32-wasi-target.patch

  echo ". \"\$topsrcdir/browser/$_pkgname/mozconfig/edition/$_pkgname-$_branding.mozconfig\"" > ../mozconfig
  export FIREDRAGON_EDITION=$_branding

  if [ $CARCH = x86_64 ]; then
    echo ". \"\$topsrcdir/browser/$_pkgname/mozconfig/target/linux-x64.mozconfig\"" >> ../mozconfig
    export FIREDRAGON_TARGET=linux-x64
  elif [ $CARCH = aarch64 ]; then
    echo ". \"\$topsrcdir/browser/$_pkgname/mozconfig/target/linux-arm64.mozconfig\"" >> ../mozconfig
    export FIREDRAGON_TARGET=linux-arm64
  fi

  pnpm -C browser/$_pkgname install --frozen-lockfile
  pnpm -C browser/$_pkgname all:build

  cat >> ../mozconfig <<END
ac_add_options --enable-linker=lld
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-jack
ac_add_options --disable-updater
END
}

build() {
  cd $_pkgname-v$_pkgver

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

  if [[ "${_build_pgo:-t}" == "t" ]]; then
    # Do 3-tier PGO
    echo "Building instrumented browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
    ./mach build --priority normal

    echo "Profiling instrumented browser..."
    ./mach package
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

    echo "Building optimized browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  else
    cat >.mozconfig ../mozconfig
  fi
  ./mach build --priority normal

  cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales
}

package() {
  cd $_pkgname-v$_pkgver

  mkdir -p "$pkgdir/usr/lib"
  tar -xvf obj/dist/"$(cat obj/dist/package_name.txt)" -C "$pkgdir/usr/lib"

  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=${pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${pkgname}
app.partner.garudalinux=garudalinux
END

  # Link up system ONNX runtime
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$appdir"

  # Install desktop icons and metadata
  local i
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 "browser/$_pkgname/branding/$_branding/default$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_rdns.png"
  done

  install -Dvm644 browser/$_pkgname/assets/$_rdns.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 browser/$_pkgname/assets/$_rdns.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/$_pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/_}/SearchProvider
Version=2
END
}
