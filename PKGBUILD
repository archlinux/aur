# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=firedragon
__pkgname=$_pkgname
_rdns=org.garudalinux.$__pkgname
_pkgver=13.5.0
_branding=dr460nized
_gentoo=firefox-155-patches-04.tar.xz
_gentoo_exclude=(0015-bgo-940031-wasm-support-firefox-155.patch)

pkgname=$__pkgname
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=2
pkgdesc="FireDragon is a cross-platform, feature-rich and privacy-focused web browser"
url="https://gitlab.com/garuda-linux/firedragon/firedragon13"
arch=(x86_64 aarch64)
license=(MPL-2.0)
depends=(alsa-lib
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
  ttf-font)
makedepends=(cbindgen
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
  zip)
optdepends=('hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'onnxruntime: Local machine learning features such as smart tab groups'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($__pkgname-next)
options=(!emptydirs
  !lto
  !makeflags)
install=$_pkgname.install
noextract=($_gentoo)
source=($_pkgname-v$_pkgver.source.tar.xz::$url/-/releases/v$_pkgver/downloads/$_pkgname.source.tar.xz
  https://dev.gentoo.org/~juippis/mozilla/patchsets/$_gentoo)
sha256sums=('7c7ea866d0017fa49fa62334e7ac23b67a8e2e6934adbac79be24df2c5ff5b25'
  '44389430272fc70fb5a86a19f75e24792fd500581431abee8fd042712c364841')

prepare() {
  mkdir -p mozbuild
  cd $_pkgname-v$_pkgver

  for patch in $(tar -tf "$srcdir/$_gentoo" --wildcards '*.patch' $(printf -- '--exclude=%s' "${_gentoo_exclude[@]}")); do
    tar -Oxf "$srcdir/$_gentoo" "$patch" | patch -Nsp1
  done

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

  cat >> ../mozconfig << END
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
    cat > .mozconfig ../mozconfig - << END
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
    cat > .mozconfig ../mozconfig - << END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  else
    cat > .mozconfig ../mozconfig
  fi
  ./mach build --priority normal

  cat browser/locales/shipped-locales | xargs ./mach package-multi-locale --locales
}

package() {
  cd $_pkgname-v$_pkgver

  mkdir -p "$pkgdir/usr/lib"
  tar -xvf obj/dist/"$(cat obj/dist/package_name.txt)" -C "$pkgdir/usr/lib"

  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" << END
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

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" << END
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
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
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
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/_}/SearchProvider
Version=2
END
}
