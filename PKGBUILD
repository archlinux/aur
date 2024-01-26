# Maintainer: NSK-1010 <kotone[dot]olin1010[at]gmail[dot]com>

## useful links
# http://floorp.app/
# https://github.com/Floorp-Projects/Floorp

## options
: ${_build_pgo:=true}
: ${_build_pgo_reuse:=true}

## basic info
_pkgname="floorp"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=11.8.2
pkgrel=2
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
    nasm
    nodejs
    python
    rust
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

  if [[ "${_build_pgo::1}" == "t" ]] ; then
    makedepends+=(
      weston
      xwayland-run # AUR
    )
  fi

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  options=(
    !debug
    !emptydirs
    !lto
    !strip
  )

  _pkgsrc="Floorp-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source=(
    "$_pkgname-${pkgver%%.r*}.$_pkgext"::"$url/archive/refs/tags/v${pkgver%%.r*}.tar.gz"
    "floorp-projects.floorp-core"::"git+https://github.com/Floorp-Projects/Floorp-core.git"
    "floorp-projects.unified-l10n-central"::"git+https://github.com/Floorp-Projects/Unified-l10n-central.git"
    "$_pkgname.desktop"
  )

  sha256sums=(
    '08a5689477e3e4bda027c1a2115d8e4b63fdc1b91838278352f00206410b194c'
    'SKIP'
    'SKIP'
    '07a63f189beaafe731237afed0aac3e1cfd489e432841bd2a61daa42977fb273'
  )
}

# common functions
prepare() {
  mkdir -p mozbuild

  # prepare floorp-core
  (
    rm -rf "$_pkgsrc/floorp"
    ln -sf "../floorp-projects.floorp-core" "$_pkgsrc/floorp"

    cd "floorp-projects.floorp-core"
    local -A _submodules=(
      ['floorp-projects.unified-l10n-central']='browser/locales/l10n-central'
    )
    local key
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )

  # clear forced startup pages
  sed -E 's&^\s*pref\("startup\.homepage.*$&&' -i "$_pkgsrc/browser/branding/official/pref/firefox-branding.js"

  # prepare api keys
  cp "$_pkgsrc/floorp/apis"/api-*-key "$_pkgsrc/"

  # configure
  cd "$_pkgsrc"
  cat >../mozconfig <<END
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
ac_add_options --enable-default-toolkit=cairo-gtk3-x11-wayland
export MOZ_ENABLE_WAYLAND=1

# Branding
ac_add_options --with-app-basename=$_pkgname
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=browser/branding/official
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export NIGHTLY_BUILD=1
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
}

build() {
  cd "$_pkgsrc"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MOZ_NOSPAM=1
  export MOZ_SOURCE_REPO="$_repo"

  # LTO/PGO needs more open files
  ulimit -n 4096

  if [[ "${_build_pgo::1}" == "t" ]] ; then
    # Do 3-tier PGO
    local _old_profdata="${SRCDEST:-$startdir}/$_pkgname-merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/$_pkgname-jarlog"

    # Restore old profile
    if [[ "${_build_pgo_reuse::1}" == "t" ]] ; then
      if [[ -s "$_old_profdata" ]] ; then
        echo "Restoring old profile data."
        cp --reflink=auto -f "$_old_profdata" merged.profdata
      fi

      if [[ -s "$_old_jarlog" ]] ; then
        echo "Restoring old jar log."
        cp --reflink=auto -f "$_old_jarlog" jarlog
      fi
    fi

    # Make new profile
    if [[ "${_build_pgo_reuse::1}" != "t" ]] || [[ ! -s merged.profdata ]] ; then
      echo "Building instrumented browser..."
      cat >.mozconfig ../mozconfig
      echo >>.mozconfig "ac_add_options --enable-profile-generate=cross"
      ./mach build

      echo "Profiling instrumented browser..."
      ./mach package

      LLVM_PROFDATA=llvm-profdata JARLOG_FILE=${PWD@Q}/jarlog \
        wlheadless-run -c weston --width=1920 --height=1080 \
        -- ./mach python build/pgo/profileserver.py

      echo "Removing instrumented browser..."
      ./mach clobber
    fi

    echo "Building optimized browser..."
    cat >.mozconfig ../mozconfig

    if [[ -s merged.profdata ]] ; then
      stat -c "Profile data found (%s bytes)" merged.profdata
      echo >>.mozconfig "ac_add_options --enable-profile-use=cross"
      echo >>.mozconfig "ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata"

      # save profdata for reuse
      cp --reflink=auto -f merged.profdata "$_old_profdata"
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]] ; then
      stat -c "Jar log found (%s bytes)" jarlog
      echo >>.mozconfig "ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog"

      # save jarlog for reuse
      cp --reflink=auto -f jarlog "$_old_jarlog"
    else
      echo "Jar log not found."
    fi

    ./mach build
  else
    echo "Building browser..."
    cat >.mozconfig ../mozconfig

    ./mach build
  fi
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
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
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=${pkgver}
about=Floorp for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  # search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Replace duplicate binary
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
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
}

# execute
_main_package
