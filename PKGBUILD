# Maintainer: aur.chaotic.cx

## options
: ${_build_pgo:=true}
: ${_build_pgo_reuse:=try}
: ${_build_pgo_xvfb:=true}

: ${_build_lto:=false}
: ${_build_system_libs:=true}

: ${_llvm_ver=21}

: ${_pkgrel:=1}

_pkgname="waterfox"
pkgname="$_pkgname"
pkgver=6.6.12
pkgrel=2
pkgdesc="A customizable, privacy‑focused web browser"
url="https://github.com/BrowserWorks/waterfox"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  dbus
  ffmpeg
  gtk3
  libevent
  libjpeg
  libpulse
  libvpx.so
  libwebp.so
  libxss
  libxt
  mime-types
  nspr
  nss
  ttf-font
  zlib
)
makedepends=(
  "clang${_llvm_ver:-}"
  "lld${_llvm_ver:-}"
  "llvm${_llvm_ver:-}"
  "wasi-compiler-rt${_llvm_ver:-}"
  cargo
  cbindgen
  diffutils
  dump_syms
  git
  imake
  inetutils
  jack
  mercurial
  mesa
  nasm
  nodejs
  python
  python-setuptools
  unzip
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip
)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

if [[ "${_build_pgo::1}" == "t" ]]; then
  if [[ "${_build_pgo_xvfb::1}" == "t" ]]; then
    makedepends+=(
      xorg-server-xvfb
    )
  else
    makedepends+=(
      weston
      wlheadless-run # aur/xwayland-run
    )
  fi
fi

options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)

_commit_l10n=$(
  curl -Ssf --max-redirs 3 --no-progress-meter "$url/tree/$pkgver/waterfox/browser" 2> /dev/null \
    | grep -Po '\/BrowserWorks\/l10n\/tree\/\K[0-9a-f]{40}' \
    | head -1 # -Pom1 does not work
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/BrowserWorks/waterfox/archive/refs/tags/$pkgver.$_pkgext"
  "$_pkgsrc-locales.$_pkgext"::"https://github.com/BrowserWorks/l10n/archive/$_commit_l10n.$_pkgext"
  "$_pkgname.desktop"
  '0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch'
  '0002-Fix-sandbox-to-build-with-glibc-2.43.patch'
  '0003-encoding_rs-rust-1.95.patch'
)
sha256sums=(
  '04621a7c3fd4e0737f182ab0f8f8cfcf23d6b7a63005ec8548cc8f6495b0e4a5'
  '6821486311c4d902e06530aa11f15e30fb787cb4d877d71aa45c85e4c819f955'
  '9345cdf0e1a537d8ff23b5db0eadaaec5868f7588de86a260da27f5015c2d286'
  '157976ec4be8d723cd6240988b310bc8e1779b2272a258d886bc08389ceba852'
  '404e780b1488625989c6dd8e2234e50ed01401b7cb1e99e79dee87f4f4f584f8'
  '763ced1fb083c3a621bf53c9f65b990308c8dcf944e3d61702ecbc882d318bd7'
)

prepare() {
  mkdir -p mozbuild
  cd "$_pkgsrc"

  # prepare l10n
  rm -rf "waterfox/browser/locales"
  ln -sf "$srcdir/l10n-$_commit_l10n" "waterfox/browser/locales"

  # set version
  local _firefoxf_ver=$(cat "browser/config/version.txt")
  echo "${pkgver}" | tee "browser/config"/{version,version_display}.txt

  # configure
  cat > ../mozconfig << END
ac_add_options --enable-application=browser
ac_add_options --disable-artifact-builds
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --with-app-basename=Waterfox # affects user-agent
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname
MOZ_REQUIRE_SIGNING=

# Features
ac_add_options --enable-alsa
ac_add_options --enable-av1
ac_add_options --enable-eme=widevine
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-pulseaudio
ac_add_options --enable-sandbox
ac_add_options --enable-unverified-updates
ac_add_options --enable-webrtc
ac_add_options --disable-crashreporter
ac_add_options --disable-default-browser-agent
ac_add_options --disable-parental-controls
ac_add_options --disable-tests
ac_add_options --disable-updater

# Disables Telemetry by Default
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# Debugging
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --enable-strip
ac_add_options --enable-install-strip
export STRIP_FLAGS="--strip-debug --strip-unneeded"

# Optimization
ac_add_options --enable-optimize
ac_add_options OPT_LEVEL="2"
ac_add_options RUSTC_OPT_LEVEL="2"

# Other
export AR=llvm-ar
export CC=clang
export CXX=clang++
export NM=llvm-nm
export RANLIB=llvm-ranlib
END

  if [[ "${_build_system_libs::1}" == "t" ]]; then
    cat >> ../mozconfig << END
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib
END
  fi

  if [[ "${_build_lto::1}" == "t" ]]; then
    cat >> ../mozconfig << END
ac_add_options --enable-lto=cross,full
END
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.xz}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() (
  export RUSTUP_TOOLCHAIN=stable

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && install -dm700 "${XDG_RUNTIME_DIR:?}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  export PATH="${_llvm_ver:+/usr/lib/llvm${_llvm_ver}/bin/:}$PATH"

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO/PGO needs more open files
  ulimit -n 4096

  cd "$_pkgsrc"

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]]; then
    # find previous profile file...
    local _old_profdata _old_jarlog _pkgver_old tmp_old tmp_new
    _pkgver_prof=$(
      cd "$SRCDEST"
      for i in *.profdata; do [ -f "$i" ] && echo "$i"; done \
        | sort -rV | head -1 | sed -E 's&^[^0-9]+-([0-9\.]+)-merged.profdata&\1&'
    )

    # new profile for new major version
    if [ "${_pkgver_prof%%.*}" != "${pkgver%%.*}" ]; then
      _build_pgo_reuse=false
      _pkgver_prof="$pkgver"
    fi

    # new profile for new minor version
    _tmp_old=$(echo "${_pkgver_prof}" | cut -d'-' -f2 | cut -d'.' -f2)
    _tmp_new=$(echo "${pkgver}" | cut -d'-' -f2 | cut -d'.' -f2)

    if [ "${_tmp_new:-0}" -gt "${_tmp_old:-0}" ]; then
      _build_pgo_reuse=false
      _pkgver_prof="$pkgver"
    fi

    local _old_profdata="$SRCDEST/$_pkgname-$_pkgver_prof-merged.profdata"
    local _old_jarlog="$SRCDEST/$_pkgname-$_pkgver_prof-jarlog"

    # Restore old profile
    if [[ "${_build_pgo_reuse::1}" == "t" ]]; then
      if [[ -s "$_old_profdata" ]]; then
        echo "Restoring old profile data."
        cp -f "$_old_profdata" merged.profdata
      fi

      if [[ -s "$_old_jarlog" ]]; then
        echo "Restoring old jar log."
        cp -f "$_old_jarlog" jarlog
      fi
    fi

    # Make new profile
    if [[ "${_build_pgo_reuse::1}" != "t" ]] || [[ ! -s merged.profdata ]]; then
      echo "Building instrumented browser..."
      cat > .mozconfig ../mozconfig - << END
ac_add_options --enable-profile-generate=cross
export MOZ_ENABLE_FULL_SYMBOLS=1
END
      ./mach build --priority normal

      echo "Profiling instrumented browser..."
      ./mach package

      local _headless_env=(
        LLVM_PROFDATA=llvm-profdata
        JARLOG_FILE="${PWD@Q}/jarlog"
        LIBGL_ALWAYS_SOFTWARE=true
        dbus-run-session
      )

      if [[ "${_build_pgo_xvfb::1}" == "t" ]]; then
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
    fi
  fi

  echo "Building browser..."
  cat > .mozconfig ../mozconfig

  if [[ -s merged.profdata ]]; then
    stat -c "Profile data found (%s bytes)" merged.profdata
    cat >> .mozconfig - << END
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
END

    # save profdata for reuse
    cp -f merged.profdata "$_old_profdata"
  else
    echo "Profile data not found."
  fi

  if [[ -s jarlog ]]; then
    stat -c "Jar log found (%s bytes)" jarlog
    cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    # save jarlog for reuse
    cp -f jarlog "$_old_jarlog"
  else
    echo "Jar log not found."
  fi

  ./mach build --priority normal
)

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$vendorjs" << END
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

// Enable JPEG XL images
pref("image.jxl.enabled", true);

// Prevent about:config warning
pref("browser.aboutConfig.showWarning", false);

// Prevent telemetry notification
pref("services.settings.main.search-telemetry-v2.last_check", $(date +%s));
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$distini" << END
[Global]
id=archlinux
version=rolling
about=${_pkgname^}

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
END

  # search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /usr/lib/$_pkgname/$_pkgname "\$@"
END

  # Replace duplicate binary
  ln -sf "$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # desktop file
  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 waterfox/browser/branding/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
}
