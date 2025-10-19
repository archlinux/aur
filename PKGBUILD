# Maintainer: ezra <ekhuzadi@uci.edu>
# Based on librewolf PKGBUILD by ohfp/lsf <lsf at pfho dot net>
# HellFire optimizations from CYFARE/HellFire

# run pgo build or not; with X(vfb) or wayland
: ${_build_profiled:=true}
: ${_build_profiled_xvfb:=false}

pkgname=librewolf-hellfire
_pkgname=LibreWolf-HellFire
_appname=librewolf
epoch=1
pkgver=144.0_1
_fixedfirefoxver="${pkgver%_*}" # Version of Firefox this LibreWolf version is based on, but the Firefox patch number is always included
_librewolfver="${pkgver#*_}"
_firefoxver="${_fixedfirefoxver}" # Use full Firefox version for source URL
pkgrel=1
pkgdesc="LibreWolf with HellFire performance optimizations - privacy-focused Firefox fork with extreme performance tuning"
url="https://librewolf.net/"
arch=(x86_64 aarch64)
license=(MPL-2.0)

depends=(
  dbus
  alsa-lib
  at-spi2-core
  bash
  cairo
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
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
  binutils
  cbindgen
  clang
  diffutils
  git
  imake
  inetutils
  jack
  jq
  lld
  llvm
  mesa
  nasm
  nodejs
  pciutils
  python
  python-setuptools
  rust
  unzip
  'wasi-compiler-rt'
  'wasi-libc++'
  'wasi-libc++abi'
  'wasi-libc'
  yasm
  zip
  ) # pciutils: only to avoid some PGO warning(?)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

if [[ "${_build_profiled}" == "true" ]]; then
  if [[ "${_build_profiled_xvfb}" == "true" ]]; then
    makedepends+=(
      xorg-server-xvfb
    )
  else
    makedepends+=(
      weston
      xorg-xwayland
      wlheadless-run # aur/xwayland-run-git
    )
  fi
fi

provides=('librewolf')
conflicts=('librewolf')

backup=("usr/lib/${_appname}/librewolf.cfg"
        "usr/lib/${_appname}/distribution/policies.json")
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
)

install='librewolf.install'
source=(
  https://gitlab.com/api/v4/projects/32320088/packages/generic/librewolf-source/$_firefoxver-$_librewolfver/librewolf-$_firefoxver-$_librewolfver.source.tar.gz # {,.sig} sig files are currently broken, it seems
  librewolf.desktop
  "default192x192.png"
)

sha256sums=('7dbf8ebee436fd3efc5895b5151af0e23063ef1d3a47ff3da6d55dfcc1b047c6'
            '6faf23e9e75799c7000c153463fb0e8d5c3d7fb8c167aea603142b1037bfa540'
            '959c94c68cab8d5a8cff185ddf4dca92e84c18dccc6dc7c8fe11c78549cdc2f1')

validpgpkeys=('034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3') # maltej(?)


prepare() {
  mkdir -p mozbuild
  cd librewolf-$_firefoxver-$_librewolfver

  mv mozconfig ../mozconfig

  cat >>../mozconfig <<END

ac_add_options --enable-linker=lld

ac_add_options --prefix=/usr

ac_add_options --disable-bootstrap

export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --with-app-name=${_appname}
# TODO: re-evaluate
ac_add_options --enable-update-channel=release

export MOZ_APP_REMOTINGNAME=${_appname}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
# keep alsa option in here until merged upstream
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-pulseaudio

# wasi
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# HellFire Performance Optimizations
# Based on CYFARE/HellFire mozconfig optimizations
ac_add_options --enable-release
ac_add_options --enable-optimize="-O3"
ac_add_options --enable-hardening
ac_add_options --enable-sandbox
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-avx

# Rust optimizations
export RUSTC_OPT_LEVEL=3
export CARGO_PROFILE_RELEASE_OPT_LEVEL=3

# Parallel build optimization
mk_add_options MOZ_MAKE_FLAGS="-j$(nproc)"

# Disable debug components for maximum performance
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END

if [[ "${CARCH}" == "aarch64" ]]; then
  cat >>../mozconfig <<END
# ARM64 optimizations
ac_add_options --enable-optimize="-g0 -O3"

ac_add_options --enable-lto=full
END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0 -C target-cpu=native -C target-feature=+v8a,+fp,+simd -C opt-level=3"

else

  cat >>../mozconfig <<END
# x86_64 optimizations
ac_add_options --disable-elf-hack

# Full Link-Time Optimization for maximum performance
ac_add_options --enable-lto=full
END

  # HellFire CPU feature flags for x86-64-v3 with modern instruction sets
  export RUSTFLAGS="-C target-cpu=x86-64-v3 -C target-feature=+avx2,+aes,+sse4.2,+bmi,+bmi2,+fma,+lzcnt,+popcnt -C opt-level=3"

fi

  # reduce chance of builds failing during linking due to running out of memory
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # upstream Arch fixes
  #
}


build() {
  cd librewolf-$_firefoxver-$_librewolfver

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

  # LTO/PGO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO for maximum performance


  if [[ "${_build_profiled}" == "true" ]]; then
    if [[ "${CARCH}" == "aarch64" ]]; then

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    else

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    fi

    # temporarily disable ublock-origin, interferes with profiling
    cp "lw/policies.json" "$srcdir/policies.json"
    jq 'del(.policies.Extensions.Install)' "$srcdir/policies.json" > "lw/policies.json"

    echo "Building instrumented browser..."

    ./mach build --priority normal

    echo "Profiling instrumented browser..."

    ./mach package

    local _headless_env=(
      LIBGL_ALWAYS_SOFTWARE=true \
      LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="$PWD/jarlog" \
        dbus-run-session
    )

    if [[ "${_build_profiled_xvfb}" == "true" ]]; then
      local _headless_run=(
        xvfb-run
        -s "-screen 0 1920x1080x24 -nolisten local"
      )
    else
      local _headless_run=(
        wlheadless-run
        -c weston --width=1920 --height=1080
      )
    fi

    env "${_headless_env[@]}" "${_headless_run[@]}" -- ./mach python build/pgo/profileserver.py

    echo "Removing instrumented browser..."
    ./mach clobber objdir

    echo "Building optimized browser..."

    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata

      if [[ "${CARCH}" == "x86_64" ]]; then
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use
END
      else
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use=cross
END
      fi

      cat >> .mozconfig - << END
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
END
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
    else
      echo "Jar log not found."
    fi

    # reenable ublock-origin
    cp "$srcdir/policies.json" "lw/policies.json"

  else
    cat >.mozconfig ../mozconfig
  fi

  ./mach build --priority normal
}

package() {
  cd librewolf-$_firefoxver-$_librewolfver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/${_appname}/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/${_appname}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=io.gitlab.${pkgname}-community
version=1.0
about=LibreWolf-HellFire

[Preferences]
app.distributor="LibreWolf HellFire Community"
app.distributor.channel=$pkgname
app.partner.librewolf=$pkgname
END

  # Use librewolf branding since we're based on it
  _brandingname=librewolf
  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${_brandingname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${_brandingname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

  install -Dvm644 ../librewolf.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/${_appname}/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/${_appname}/librewolf-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/${_appname}/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
