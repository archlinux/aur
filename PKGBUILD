# Maintainer: Joan Figueras <ffigue at gmail>
# Maintainer: xiota / aur.chaotic.cx
# Contributor: (Parabola) fauno <fauno@kiwwwi.com.ar>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

## links
# https://www.gnu.org/software/gnuzilla/
# https://git.savannah.gnu.org/cgit/gnuzilla.git
# https://git.savannah.gnu.org/gitweb/?p=gnuzilla.git

## options
: ${_build_save_source:=true}
: ${_build_repatch:=false}

: ${_build_pgo:=true}
: ${_build_pgo_reuse:=try}
: ${_build_pgo_xvfb:=true}

: ${_build_lto:=false}
: ${_build_system_libs:=true}

: ${_build_limit_cores:=false}

## update
_icver="140.6.0"
_commit="f4e50b9a4d5384ce2e860133bf0beaaccbf19b46" # 140.6.0
_ffsum="6c35c9ab507521033c8fd49f1b4c85ee158f33ed36f5781a663f116c3d604dc9"

## package
_pkgname="icecat"
pkgname="$_pkgname"
pkgver="$_icver"
pkgrel=1
pkgdesc="GNU version of the Firefox ESR browser"
url="https://gitweb.git.savannah.gnu.org/gitweb/?p=gnuzilla.git"
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
  cargo
  cbindgen
  clang
  diffutils
  dump_syms
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
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip

  ## makeicecat
  git
  m4
  python-jsonschema
  python-psutil
  python-setuptools
  wget
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

noextract=("firefox-${pkgver}esr.source.tar.xz")

_pkgsrc="$_pkgname-$pkgver"
_pkgsrc_gnuzilla="gnuzilla"
_pkgsrc_firefox="firefox-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc_gnuzilla"::"git+https://https.git.savannah.gnu.org/git/gnuzilla.git#commit=$_commit"
  "https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"
)
sha256sums=(
  'SKIP'
  "$_ffsum"
)

_make_icecat() (
  # restore icecat tarball, if exists
  if [ "${_build_repatch::1}" != "t" ] && [ -e "$SRCDEST/$_pkgsrc.tar.zst" ]; then
    echo "Restoring previously patched sources..."
    rm -rf "$srcdir/$_pkgsrc"
    bsdtar -xf "$SRCDEST/$_pkgsrc.tar.zst"
    return
  fi

  pushd "$_pkgsrc_gnuzilla"

  # clean output in case there is already an old build
  mkdir -p output || rm -rf output/*
  mkdir -p output/l10n

  echo "Preparing Firefox ESR..."
  #cp -f "$srcdir/firefox-${pkgver}esr.source.tar.xz"{,.asc} "$_pkgsrc_gnuzilla"/output/

  bsdtar xf "$srcdir/firefox-${pkgver}esr.source.tar.xz"
  mv "$_pkgsrc_firefox" "$srcdir/$_pkgsrc_gnuzilla/output/$_pkgsrc"

  echo "Patching sources..."

  # don't reset output folder (already done)
  sed -e '/^prepare_env$/d' -i makeicecat

  # don't make source tarball (done later)
  sed -e '/^finalize_sourceball$/d' -i makeicecat

  # don't redownload or reextract firefox (already done)
  sed \
    -e '/^fetch_source$/d' \
    -e '/^verify_sources$/d' \
    -e '/^extract_sources$/d' \
    -i makeicecat

  # produce icecat sources
  cd output
  ../makeicecat
  popd

  # save icecat tarball
  if [[ "${_build_save_source::1}" == "t" ]]; then
    echo "Saving patched sources..."
    mv -f "$_pkgsrc_gnuzilla/output/$_pkgsrc" "$srcdir/"
    bsdtar -a -cf "$_pkgsrc.tar.zst" --options zstd:compression-level=9 "$_pkgsrc"
    cp -rf "$_pkgsrc.tar.zst" "$SRCDEST/"
  fi
)

_prepare_icecat() (
  cat > icecat.desktop << END
[Desktop Entry]
Name=IceCat
GenericName=Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=icecat %u
Icon=icecat
Terminal=false
X-MultipleArgs=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;
StartupNotify=true
StartupWMClass=icecat
Categories=Network;WebBrowser;
Actions=new-window;new-private-window;safe-mode;

[Desktop Action new-window]
Name=New Window
Exec=icecat --new-window %u

[Desktop Action new-private-window]
Name=New Private Window
Exec=icecat --private-window %u

[Desktop Action safe-mode]
Name=Safe Mode
Exec=icecat -safe-mode %u
END

  _make_icecat

  mkdir -p mozbuild
  cd "$_pkgsrc"

  # clear forced startup pages
  sed -E -e 's&^\s*pref\("startup\.homepage.*$&&' -i "browser/branding/official/pref/icecat-branding.js"

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
ac_add_options --with-app-basename=$_pkgname
ac_add_options --with-app-name=$_pkgname
ac_add_options --with-branding=browser/branding/official
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.gnu
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname
MOZ_REQUIRE_SIGNING=

# Features
ac_add_options --enable-alsa
ac_add_options --enable-av1
#ac_add_options --enable-eme=widevine
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

  if [[ "${_build_limit_cores::1}" == "t" ]]; then
    # calculate core availability
    local _mem _nproc _cores
    _mem=$(cat /proc/meminfo | grep MemFree | grep -Eom1 '[0-9]+')
    _nproc=$(nproc)
    _cores=$((_mem / (1024 * 1024) < _nproc ? _mem / (1024 * 1024) : _nproc))
    _cores=$((_cores < 1 ? 1 : _cores))

    printf '\nFree RAM: %s\nCores: %s\nUsing: %s\n\n' "$((_mem / (1024 * 1024)))" "$_nproc" "$_cores"

    cat >> ../mozconfig << END
mk_add_options MOZ_PARALLEL_BUILD=${_cores:-4}
END
  fi
)

build() (
  _prepare_icecat

  cd "$_pkgsrc"

  export RUSTUP_TOOLCHAIN=stable

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && mkdir -pm700 "${XDG_RUNTIME_DIR:?}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # workaround for cargo lock
  install -Dm755 /dev/stdin "$srcdir/cargo-nofrozen" << 'END'
#!/usr/bin/env bash
real=$(command -v cargo | grep -v "cargo-nofrozen" | head -n1)
args=()
for a in "$@"; do
  [[ "$a" == "--frozen" ]] && continue
  args+=("$a")
done
exec "$real" "${args[@]}"
END

  export CARGO="$srcdir/cargo-nofrozen"

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO/PGO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]]; then
    # find previous profile file...
    local _old_profdata _old_jarlog _pkgver_old tmp_old tmp_new
    _pkgver_prof=$(
      cd "$SRCDEST"
      for i in *.profdata; do [ -f "$i" ] && echo "$i"; done \
        | sort -rV | head -1 | sed -E -e 's&^[^0-9]+-([0-9\.]+)-merged.profdata&\1&'
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
      # disable extensions, otherwise profiling freezes
      cp "browser/app/Makefile.in" "$srcdir/Makefile.in"
      sed -E -e '/^\t.*\/extensions\/gnu\/\*.*$/d' -i "browser/app/Makefile.in"

      cp "browser/installer/package-manifest.in" "$srcdir/package-manifest.in"
      sed -E -e '/^.*\/browser\/extensions\/.*$/d' -i "browser/installer/package-manifest.in"

      cp "browser/installer/allowed-dupes.mn" "$srcdir/allowed-dupes.mn"
      sed -E -e '/^browser\/extensions\/.*$/d' -i "browser/installer/allowed-dupes.mn"

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

      # reenable extensions
      cp "$srcdir/Makefile.in" "browser/app/Makefile.in"
      cp "$srcdir/package-manifest.in" "browser/installer/package-manifest.in"
      cp "$srcdir/allowed-dupes.mn" "browser/installer/allowed-dupes.mn"
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
  else
    echo "Building browser..."
    cat > .mozconfig ../mozconfig

    ./mach build --priority normal
  fi
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
version=${pkgver}
about=GNU IceCat for Arch Linux

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
  ln -sf "$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # desktop file
  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
}
