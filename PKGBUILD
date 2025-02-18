# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Co-Maintainer: FGD
# Co-Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

# Three-stage profile-guided optimization
: ${_build_pgo:=true}

# Profile with xvfb-run, if possible
: ${_build_pgo_xvfb:=false}

_pkgver=11.23.1-1

pkgname=firedragon
_pkgname=FireDragon
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
pkgdesc="Floorp fork build using custom branding and settings"
url='https://firedragon.garudalinux.org'
arch=('x86_64')
license=('MPL2')
depends=(dbus
  dbus-glib
  ffmpeg
  gtk3
  libevent
  libjpeg
  libpulse
  libvpx
  libwebp
  libxss
  libxt
  mime-types
  nss
  pipewire
  ttf-font
  zlib)
makedepends=(cbindgen
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
  mold
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
replaces=(firedragon-next)
options=(!debug
  !emptydirs
  !lto
  !makeflags
  !strip)
backup=("usr/lib/${pkgname}/${pkgname}.cfg"
  "usr/lib/${pkgname}/distribution/policies.json")
source=(https://gitlab.com/garuda-linux/firedragon/builder/-/releases/v${_pkgver}/downloads/firedragon-v${_pkgver}.source.tar.zst
  https://gitlab.com/garuda-linux/firedragon/settings/-/raw/master/firedragon.psd
  https://gitlab.com/garuda-linux/firedragon/settings/-/raw/master/firedragon.desktop)
sha256sums=('2a7c70a513e9925beb4eb5e60873c75c497e2b9a637ad061fe44a0f65c4a7f87'
            '61355930cc59813e7e610ffdab8a01e32be980fffe1dfd8f9654b8f8f9f7fdc0'
            '53d3e743f3750522318a786befa196237892c93f20571443fdf82a480e7f0560')

# Select the method of profiling
if [[ "${_build_pgo::1}" == "t" ]]; then
  if [[ "${_build_pgo_xvfb::1}" == "t" ]]; then
    makedepends+=(xorg-server-xvfb)
  else
    makedepends+=(weston xwayland-run)
  fi
fi

prepare() {
  rm -rf "${srcdir}/mozbuild"
  mkdir "${srcdir}/mozbuild"

  cd firedragon-v"${_pkgver}" || exit

  cat > ../mozconfig << END
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-branding=browser/branding/firedragon
ac_add_options --with-l10n-base=${PWD@Q}/floorp/browser/locales/l10n-central
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

# Build options
ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-hardening
ac_add_options --enable-linker=mold
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --prefix=/usr
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
export MOZ_INCLUDE_SOURCE_INFO=1

# Branding
ac_add_options --allow-addon-sideload
ac_add_options --enable-unverified-updates
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname}
export MOZ_CRASHREPORTER=
export MOZ_DATA_REPORTING=
export MOZ_REQUIRE_SIGNING=
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
export MOZ_TELEMETRY_REPORTING=

# System libraries
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --disable-crashreporter # (Minimize telemetry)
ac_add_options --disable-debug
ac_add_options --disable-debug-js-modules
ac_add_options --disable-debug-symbols
ac_add_options --disable-default-browser-agent
ac_add_options --disable-gpsd
ac_add_options --disable-necko-wifi
ac_add_options --disable-parental-controls # (Disable local/OS MTIM)
ac_add_options --disable-rust-tests
ac_add_options --disable-synth-speechd
ac_add_options --disable-tests
ac_add_options --disable-updater
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --enable-alsa
ac_add_options --enable-av1
ac_add_options --enable-eme=widevine
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-pulseaudio
ac_add_options --enable-raw
ac_add_options --enable-sandbox
ac_add_options --enable-strip

# Optimization
ac_add_options --enable-optimize=-O3
ac_add_options --enable-lto=cross,full
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"

# Other
export AR=/usr/bin/llvm-ar
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export NM=/usr/bin/llvm-nm
export RANLIB=/usr/bin/llvm-ranlib
END
}

build() {
  cd firedragon-v"${_pkgver}" || exit

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MOZ_NOSPAM=1
  export MOZ_PROFILER_STARTUP=1 # Starts the profiler is started as early as possible during startup.

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

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]]; then
    local _old_profdata="${SRCDEST:-$startdir}/merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/jarlog"

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
    ./mach build
  fi

  echo "Building symbol archive..."
  ./mach buildsymbols

  echo "Packaging browser with locales..."
  ./mach package
  ./mach package-multi-locale --locales ar cs da de el en-US en-GB es-ES fr hu id it ja ko lt nl nn-NO pl pt-BR pt-PT ru sv-SE th tr uk zh-CN zh-TW
}

package() {
  cd firedragon-v"${_pkgver}" || exit

  install -Ddvm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -rvf "obj/dist/firedragon/." "${pkgdir}/usr/lib/${pkgname}"

  install -Ddvm755 "${pkgdir}/usr/bin"
  ln -srfv "$pkgdir/usr/lib/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  rm "${pkgdir}/usr/lib/${pkgname}/pingsender"

  local vendorjs="${pkgdir}/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js"
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

  local distini="${pkgdir}/usr/lib/${pkgname}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "${distini}" << END
[Global]
id=${pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${pkgname}
app.partner.garudalinux=garudalinux
END

  # Use system certificates
  local nssckbi="${pkgdir}/usr/lib/${pkgname}/libnssckbi.so"
  if [[ -e "${nssckbi}" ]]; then
    ln -srfv "${pkgdir}/usr/lib/libnssckbi.so" "${nssckbi}"
  fi

  # Make native messaging work
  ln -s "/usr/lib/mozilla/native-messaging-hosts" "${pkgdir}/usr/lib/${pkgname}/native-messaging-hosts"

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
    install -Dvm644 browser/branding/firedragon/default$i.png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dvm644 browser/branding/firedragon/content/about-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/${pkgname%-*}-bin"

  # All the needed configuration files
  install -Dvm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dvm644 "${srcdir}/firedragon.psd" "${pkgdir}/usr/share/psd/browsers/firedragon"
}
