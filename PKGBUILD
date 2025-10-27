# Maintainer: NSK-1010 <kotone[dot]olin1010[at]gmail[dot]com>

## links
# http://floorp.app/
# https://github.com/Floorp-Projects/Floorp
# https://github.com/Floorp-Projects/Floorp-core
# https://github.com/Floorp-Projects/Floorp-runtime

## options
: ${_build_pgo:=true}
: ${_build_pgo_reuse:=try}
: ${_build_pgo_xvfb:=true}

: ${_build_lto:=false}
: ${_build_system_libs:=true}

: ${_build_limit_cores:=false}

: ${_install_path:=usr/lib}
: ${_wmclass:=floorp-default}

: ${_tag_runtime:=daily-532}
: ${_hash_floorp=cdb51929790ac5c0ceccab572b30973387ad29e2272e877d538cdcafecb3fdce}
: ${_hash_runtime=733b9816d6c623dc59dcda44fbd433132e3f5cc6c19d7893bdf136dbcc68d740}

_pkgname="floorp"
pkgname="$_pkgname"
pkgver=12.3.5
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://github.com/Floorp-Projects/Floorp"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  dbus
  ffmpeg4.4
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
  cargo
  cbindgen
  clang
  deno
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
  python-setuptools
  rsync
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

_pkgsrc="Floorp-$pkgver"
_pkgsrc_runtime="Floorp-runtime-$_tag_runtime"
_pkgext="tar.gz"
source=(
  "$_pkgname-components-$pkgver.$_pkgext"::"https://github.com/Floorp-Projects/Floorp/archive/refs/tags/v$pkgver.$_pkgext"
  "$_pkgname-runtime-${_tag_runtime#[a-z]*[a-z]-}.$_pkgext"::"https://github.com/Floorp-Projects/Floorp-runtime/archive/refs/tags/$_tag_runtime.$_pkgext"
  "floorp-projects.floorp-core"::"git+https://github.com/Floorp-Projects/Floorp-core.git"
  #"floorp-projects.unified-l10n-central"::"git+https://github.com/Floorp-Projects/Unified-l10n-central.git"
  "$_pkgname.desktop"
)
sha256sums=(
  "${_hash_floorp:-SKIP}"
  "${_hash_runtime:-SKIP}"
  'SKIP'
  #'SKIP'
  '8b38d000950cddd5fa0e1598540590af21f1aae1d30212fb11197c8526662604'
)

_deno() {
  pushd "$srcdir/$_pkgsrc_runtime/noraneko" > /dev/null || return
  deno "$@"
  popd > /dev/null || return
}

prepare() (
  mkdir -p mozbuild

  # prepare directory structure
  rsync -aL "$_pkgsrc/" "$_pkgsrc_runtime/noraneko/"
  rsync -aL "$_pkgsrc_runtime/.github/assets/branding/" "$_pkgsrc_runtime/browser/branding/"

  # prevent error from unsupported variables
  rm -f "$_pkgsrc_runtime/browser/branding/floorp-official/configure.sh"

  # clear forced startup pages
  sed -E -e 's&^\s*pref\("startup\.homepage.*$&&' \
    -i "$_pkgsrc_runtime"/browser/branding/*/pref/firefox-branding.js

  # prepare api keys
  cp floorp-projects.floorp-core/apis/api-*-key ./

  # configure
  cat > mozconfig << END
ac_add_options --enable-application=browser
ac_add_options --disable-artifact-builds
mk_add_options MOZ_OBJDIR="$srcdir/$_pkgsrc_runtime/obj-artifact-build-output"

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
ac_add_options --with-app-basename=$_pkgname
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=browser/branding/floorp-official
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname
MOZ_REQUIRE_SIGNING=

# Localization
#ac_add_options --with-l10n-base="$srcdir/floorp-projects.unified-l10n-central"

# Keys
ac_add_options --with-mozilla-api-keyfile="$srcdir/api-mozilla-key"
ac_add_options --with-google-location-service-api-keyfile="$srcdir/api-google-location-service-key"
ac_add_options --with-google-safebrowsing-api-keyfile="$srcdir/api-google-safe-browsing-key"

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
    cat >> mozconfig << END
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
    cat >> mozconfig << END
ac_add_options --enable-lto=cross,full
END
  fi

  if [[ "${_build_limit_cores::1}" == "t" ]]; then
    # calculate core availability
    local _mem _nproc _cores
    _mem=$(cat /proc/meminfo | grep MemFree | grep -Eom1 '[0-9]+')
    _nproc=$(nproc)
    _cores=$((_mem / (1024 * 1024) < _nproc ? _mem / (1024 * 1024) : _nproc))
    _cores=$((_cores < 1 ? 1 : _cores))

    printf '\nFree RAM: %s\nCores: %s\nUsing: %s\n\n' "$((_mem / (1024 * 1024)))" "$_nproc" "$_cores"

    cat >> mozconfig << END
mk_add_options MOZ_PARALLEL_BUILD=${_cores:-4}
END
  fi
)

build() (
  export RUSTUP_TOOLCHAIN=stable

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && mkdir -pm700 "${XDG_RUNTIME_DIR:?}"

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

  cd "$_pkgsrc_runtime"

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]] && [ "${_build_artifact_mode::1}" != "t" ]; then
    # Old profile loction
    local _pkgver_prof="${_tag_runtime#[a-z]*[a-z]-}"
    local _old_profdata="$SRCDEST/floorp-runtime-$_pkgver_prof-merged.profdata"
    local _old_jarlog="$SRCDEST/floorp-runtime-$_pkgver_prof-jarlog"

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
        JARLOG_FILE="$srcdir/$_pkgsrc_runtime/jarlog"
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

  # Prepare to rebuild browser
  cat > .mozconfig ../mozconfig

  if [ "${_build_artifact_mode::1}" != "t" ]; then
    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata
      cat >> .mozconfig - << END
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path="$srcdir/$_pkgsrc_runtime/merged.profdata"
END

      # save profdata for reuse
      cp -f merged.profdata "$_old_profdata"
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog="$srcdir/$_pkgsrc_runtime/jarlog"
END

      # save jarlog for reuse
      cp -f jarlog "$_old_jarlog"
    else
      echo "Jar log not found."
    fi
  fi

  # Final build
  echo "Building browser..."
  ./mach build --priority normal

  # inject floorp
  export DENO_DIR="$srcdir/.deno"

  _deno install --allow-scripts
  _deno task feles-build misc writeVersion
  NODE_ENV=production _deno task feles-build build --phase before-mach

  for i in .github/patches/packaging/*.patch; do
    git apply --ignore-space-change --ignore-whitespace "$i" || true
  done

  # set floorp version
  local _floorp_ver=$(cat "noraneko/static/gecko/config/version.txt")
  local _firefoxf_ver=$(cat "browser/config/version.txt")
  echo "${_floorp_ver}@${_firefoxf_ver}" | tee "browser/config/"{version,version_display}.txt

  ./mach build faster --priority normal

  # missing on install
  cp noraneko/_dist/buildid2 obj-artifact-build-output/dist/bin/browser

  # dereference symlinks
  rsync -aL obj-artifact-build-output/ obj-artifact-build-output_new/
  rm -rf obj-artifact-build-output_old
  mv obj-artifact-build-output obj-artifact-build-output_old
  mv obj-artifact-build-output_new obj-artifact-build-output

  _deno task feles-build build --phase after-mach

  for i in noraneko/tools/patches/*.patch; do
    git apply --reject "$i" --directory obj-artifact-build-output/dist/bin --unsafe-paths --check --apply || true
  done
)

package() {
  cd "$_pkgsrc_runtime"
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/$_install_path/$_pkgname/browser/defaults/preferences/vendor.js"
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

  local distini="$pkgdir/$_install_path/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$distini" << END
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
  install -Dm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Replace duplicate binary
  ln -sf "$_pkgname" "$pkgdir/$_install_path/$_pkgname/$_pkgname-bin"

  # launcher
  local _desktop=$(sed -e "s/@WMCLASS@/$_wmclass/" "$_pkgname.desktop")
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<< "$_desktop"

  # icons
  local i theme=floorp-official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
}
