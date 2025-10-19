# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Co-Maintainer: FGD
# Co-Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

# Three-stage profile-guided optimization
: ${_build_pgo:=false}

# Profile with xvfb-run, if possible
: ${_build_pgo_xvfb:=false}

_pkgver=12.5.1
_deno_ver=2.4.5

__pkgname=firedragon
pkgname=$__pkgname-catppuccin
_pkgname=FireDragon
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
pkgdesc="Floorp fork build using custom branding and settings"
url='https://firedragon.garudalinux.org'
arch=('x86_64' 'aarch64')
license=('MPL2')
depends=(dbus
         dbus-glib
         ffmpeg4.4
         gtk3
         libpulse
         libxss
         libxt
         mime-types
         nss
         ttf-font)
makedepends=(rsync
             cbindgen
             clang
             diffutils
             dump_syms
             imagemagick
             imake
             inetutils
             git
             jack
             lld
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
             zip)
optdepends=('hunspell-dictionary: Spell checking'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'profile-sync-daemon: Load the browser profile into RAM'
            'pulse-native-provider: Audio support'
            'searx: Searching the web using a locally running searX instance'
            'speech-dispatcher: Text-to-Speech'
            'whoogle: Searching the web using a locally running Whoogle instance'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=("$__pkgname")
conflicts=("$__pkgname")
options=(!debug
         !emptydirs
         !lto
         !makeflags
         !strip)
backup=("usr/lib/${__pkgname}/${__pkgname}.cfg"
        "usr/lib/${__pkgname}/distribution/policies.json")
source=(firedragon-source-v"$_pkgver".tar.zst::https://gitlab.com/garuda-linux/firedragon/firedragon12/-/releases/v"$_pkgver"/downloads/firedragon-source.tar.zst
        firedragon.psd::https://github.com/stefanwimmer128/profile-sync-daemon/raw/refs/heads/firedragon/contrib/firedragon)
source_x86_64=(deno-x86_64-v$"$_deno_ver".zip::https://github.com/denoland/deno/releases/download/v"$_deno_ver"/deno-x86_64-unknown-linux-gnu.zip)
source_aarch64=(deno-aarch64-v$"$_deno_ver".zip::https://github.com/denoland/deno/releases/download/v"$_deno_ver"/deno-aarch64-unknown-linux-gnu.zip)
sha256sums=('ce2a43495b67acc2b9725447804b8c476a549033497aff1c1c574d64bc916e25'
            '61355930cc59813e7e610ffdab8a01e32be980fffe1dfd8f9654b8f8f9f7fdc0')
sha256sums_x86_64=('6f9d8115bb3df582c0c5674507e906323b680be0f0b15e735d0cd5ec6be44444')
sha256sums_aarch64=('4e3e86739fe527c6891dbfa73799a5ec1b11f45898aaebf73bf3247c2e6a53dd')

# Select the method of profiling
if [[ "${_build_pgo::1}" == "t" ]]; then
  if [[ "${_build_pgo_xvfb::1}" == "t" ]]; then
    makedepends+=(xorg-server-xvfb)
  else
    makedepends+=(weston xwayland-run)
  fi
fi

_deno() {
  pushd "${srcdir}/firedragon-source-v${_pkgver}/firedragon" > /dev/null || return
  DENO_DIR="${srcdir}/.deno" "${srcdir}/deno" "$@"
  popd > /dev/null || return
}

prepare() {
  rm -rf "${srcdir}/mozbuild"
  mkdir "${srcdir}/mozbuild"

  export PATH="${srcdir}:$PATH"

  cd firedragon-source-v"${_pkgver}" || exit

  _deno install --allow-scripts --frozen

  _target="$(_deno task build --get-target)"

  cat > ../mozconfig << END
. "\$topsrcdir/firedragon/gecko/mozconfigs/edition/firedragon-catppuccin.mozconfig"
. "\$topsrcdir/firedragon/gecko/mozconfigs/target/$_target.mozconfig"

ac_add_options --with-noraneko-dist=firedragon/_dist/noraneko
ac_add_options --enable-firedragon-settings

# Build options
ac_add_options --enable-linker=lld
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --disable-updater
ac_add_options --enable-jack

# Other
export AR=/usr/bin/llvm-ar
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export NM=/usr/bin/llvm-nm
export RANLIB=/usr/bin/llvm-ranlib
END
}

build() {
  cd firedragon-source-v"${_pkgver}" || exit

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # Work around https://bugzilla.mozilla.org/show_bug.cgi?id=1969383
  export RUST_MIN_STACK=16777216

  # Fix DRI/zink issues during compilation
  export LIBGL_ALWAYS_SOFTWARE=true

  # Malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Clean source directory from previous build attempts
  ./mach clobber

  _deno task build --write-buildid2
  NODE_ENV=production _deno task build --release-build-before

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]]; then
    local _old_profdata="$srcdir/merged.profdata"
    local _old_jarlog="$srcdir/jarlog"

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
      cat > .mozconfig ../mozconfig
      echo >> .mozconfig "ac_add_options --enable-profile-generate=cross"
      ./mach build

      _deno task build --release-build-after

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

      LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD"/jarlog \
        "${_headless_run[@]}" -- ./mach python build/pgo/profileserver.py

      echo "Removing instrumented browser..."
      ./mach clobber objdir
    fi

    echo "Building optimized browser..."
    cat > .mozconfig ../mozconfig
    echo >> .mozconfig "ac_add_options --enable-lto=cross,full"

    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata
      echo >> .mozconfig "ac_add_options --enable-profile-use=cross"
      echo >> .mozconfig "ac_add_options --with-pgo-profile-path='${PWD@Q}/merged.profdata'"

      # save profdata for reuse
      cp --reflink=auto -f merged.profdata "$_old_profdata"
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      echo >> .mozconfig "ac_add_options --with-pgo-jarlog='${PWD@Q}/jarlog'"

      # save jarlog for reuse
      cp --reflink=auto -f jarlog "$_old_jarlog"
    else
      echo "Jar log not found."
    fi

    ./mach build
  else
    echo "Building browser..."
    cat > .mozconfig ../mozconfig
    echo >> .mozconfig "ac_add_options --enable-lto=cross,full"
    ./mach build
  fi

  _deno task build --release-build-after
}

package() {
  cd firedragon-source-v"${_pkgver}" || exit

  DESTDIR="$pkgdir" ./mach install

  install -Ddvm755 "${pkgdir}/usr/bin"
  ln -srfv "$pkgdir/usr/lib/${__pkgname}/${__pkgname}" "$pkgdir/usr/bin/${__pkgname}"

  local vendorjs="${pkgdir}/usr/lib/${__pkgname}/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "${vendorjs}" << END
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

  local distini="${pkgdir}/usr/lib/${__pkgname}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "${distini}" << END
[Global]
id=${__pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${__pkgname}
app.partner.garudalinux=garudalinux
END

  # Make native messaging work
  ln -s "/usr/lib/mozilla/native-messaging-hosts" "${pkgdir}/usr/lib/${__pkgname}/native-messaging-hosts"

  # GNOME search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

  # Application icons
  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/firedragon-catppuccin/default$i.png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${__pkgname}.png"
  done
  install -Dvm644 browser/branding/firedragon-catppuccin/content/about-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${__pkgname}.png"

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$__pkgname" "$pkgdir/usr/lib/$__pkgname/${__pkgname%-*}-bin"

  # All the needed configuration files
  install -Dvm644 "firedragon/assets/${__pkgname}.desktop" "${pkgdir}/usr/share/applications/${__pkgname}.desktop"
  install -Dvm644 "${srcdir}/firedragon.psd" "${pkgdir}/usr/share/psd/browsers/firedragon"
}
