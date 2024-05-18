# Maintainer: NSK-1010 <kotone[dot]olin1010[at]gmail[dot]com>

## useful links
# http://floorp.app/
# https://github.com/Floorp-Projects/Floorp
# https://github.com/Floorp-Projects/Floorp-core
# https://github.com/Floorp-Projects/Floorp-private-components

## options
: ${_build_pgo:=true}
: ${_build_pgo_reuse:=try}
: ${_build_pgo_xvfb:=false}

: ${_build_private:=true}

## basic info
_pkgname="floorp"
pkgname="$_pkgname"
pkgver=11.13.0
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://github.com/Floorp-Projects/Floorp"
arch=('x86_64')
license=('MPL-2.0')

# main package
_main_package() {
  depends=(
    dbus-glib
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
    pipewire
    ttf-font
    zlib
  )
  makedepends=(
    cbindgen
    clang
    diffutils
    dump_syms
    git
    imake
    inetutils
    jack
    lld
    llvm
    mercurial
    mesa
    mold
    nasm
    nodejs
    python
    python-setuptools
    rustup
    unzip
    wasi-compiler-rt
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
        xorg-xwayland
        xwayland-run # AUR
      )
    fi
  fi

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  options=(
    !debug
    !emptydirs
    !lto
    !makeflags
    !strip
  )

  _patch_commit="24a6ea8"

  _pkgsrc="Floorp"
  source=(
    "$_pkgsrc"::"git+https://github.com/Floorp-Projects/Floorp.git#tag=v$pkgver"
    "floorp-projects.floorp-core"::"git+https://github.com/Floorp-Projects/Floorp-core.git"
    "floorp-projects.unified-l10n-central"::"git+https://github.com/Floorp-Projects/Unified-l10n-central.git"
    "$_pkgname.desktop"

    "18d19413472f-$_patch_commit.patch"::"https://aur.archlinux.org/cgit/aur.git/plain/18d19413472f.patch?h=firefox-esr&id=$_patch_commit"
    "6af7194e2778-$_patch_commit.patch"::"https://aur.archlinux.org/cgit/aur.git/plain/6af7194e2778.patch?h=firefox-esr&id=$_patch_commit"
    "b1cc62489fae-$_patch_commit.patch"::"https://aur.archlinux.org/cgit/aur.git/plain/b1cc62489fae.patch?h=firefox-esr&id=$_patch_commit"
  )
  sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    '07a63f189beaafe731237afed0aac3e1cfd489e432841bd2a61daa42977fb273'

    '3cc55401ed5e027f1b9e667b0b52296af11f3c5c62b4a80b7e55cda0e117ed18'
    '6952f93889acb514e3b06e251ea901df88c39b429da9677cd5547d90a8b6c73e'
    'f66a944fa8804c16b1f7bd9b42b18bfc2552a891adc148085f4b91685e8db117'
  )

  if [[ "${_build_private::1}" == "t" ]]; then
    license+=('LicenseRef-Floorp')
    source+=("floorp-projects.private-components"::"git+https://github.com/Floorp-Projects/Floorp-private-components.git")
    sha256sums+=('SKIP')
  fi
}

# common functions
prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  mkdir -p mozbuild
  cd "$_pkgsrc"

  (
    # prepare floorp-core
    local _submodules=(
      'floorp-projects.floorp-core'::'floorp'
    )
    _submodule_update

    cd "floorp"
    local _submodules=(
      'floorp-projects.unified-l10n-central'::'browser/locales/l10n-central'
    )
    if [[ "${_build_private::1}" == "t" ]]; then
      _submodules+=('floorp-projects.private-components'::'Floorp-private-components')
    fi
    _submodule_update
  )

  # clear forced startup pages
  sed -E 's&^\s*pref\("startup\.homepage.*$&&' -i "browser/branding/official/pref/firefox-branding.js"

  # prepare api keys
  cp "floorp/apis"/api-*-key ./

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
ac_add_options --enable-linker=mold
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --with-app-basename=$_pkgname
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=browser/branding/official
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname

# Floorp Upstream
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-unverified-updates
ac_add_options --with-l10n-base=${PWD@Q}/floorp/browser/locales/l10n-central
MOZ_REQUIRE_SIGNING=

# Keys
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/api-mozilla-key
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/api-google-location-service-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/api-google-safe-browsing-key

# System Libraries
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --enable-alsa
ac_add_options --enable-av1
ac_add_options --enable-eme=widevine
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-pulseaudio
ac_add_options --enable-raw
ac_add_options --enable-sandbox
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
ac_add_options --enable-optimize=-O3
ac_add_options --enable-lto=cross,full
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"

# Other
export AR=llvm-ar
export CC='clang'
export CXX='clang++'
export NM=llvm-nm
export RANLIB=llvm-ranlib
END

  if [[ "${_build_private::1}" == "t" ]]; then
    echo "Enabling private components..."
    cat >> ../mozconfig << END
ac_add_options --enable-private-components
END
  fi

  patch -Np1 -F100 -i "$srcdir/18d19413472f-$_patch_commit.patch"
  patch -Np1 -F100 -i "$srcdir/6af7194e2778-$_patch_commit.patch"
  patch -Np1 -F100 -i "$srcdir/b1cc62489fae-$_patch_commit.patch"
}

build() {
  cd "$_pkgsrc"

  export RUSTUP_TOOLCHAIN=1.77

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && install -dm700 "${XDG_RUNTIME_DIR:?}"

  export LIBGL_ALWAYS_SOFTWARE=true

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # LTO/PGO needs more open files
  ulimit -n 4096

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
        cp --reflink=auto -f "$_old_profdata" merged.profdata
      fi

      if [[ -s "$_old_jarlog" ]]; then
        echo "Restoring old jar log."
        cp --reflink=auto -f "$_old_jarlog" jarlog
      fi
    fi

    # Make new profile
    if [[ "${_build_pgo_reuse::1}" != "t" ]] || [[ ! -s merged.profdata ]]; then
      echo "Building instrumented browser..."
      cat > .mozconfig ../mozconfig - << END
ac_add_options --enable-profile-generate=cross
export MOZ_ENABLE_FULL_SYMBOLS=1
END
      ./mach build

      echo "Profiling instrumented browser..."
      ./mach package

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

      LLVM_PROFDATA=llvm-profdata JARLOG_FILE=${PWD@Q}/jarlog \
        "${_headless_run[@]}" -- ./mach python build/pgo/profileserver.py

      echo "Removing instrumented browser..."
      ./mach clobber
    fi

    echo "Building optimized browser..."
    cat > .mozconfig ../mozconfig

    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata
      cat >> .mozconfig - << END
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
END

      # save profdata for reuse
      cp --reflink=auto -f merged.profdata "$_old_profdata"
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

      # save jarlog for reuse
      cp --reflink=auto -f jarlog "$_old_jarlog"
    else
      echo "Jar log not found."
    fi

    ./mach build
  else
    echo "Building browser..."
    cat > .mozconfig ../mozconfig

    ./mach build
  fi
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" << END
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
  install -Dvm644 /dev/stdin "$distini" << END
[Global]
id=archlinux
version=rolling
about=Floorp for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  # search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Replace duplicate binary
  ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e "$nssckbi" ]]; then
    ln -sf "/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  # desktop file
  install -Dvm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  # license
  if [[ "${_build_private::1}" == "t" ]]; then
    install -Dm644 "$srcdir/floorp-projects.private-components/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.components"
  fi
}

# execute
_main_package
