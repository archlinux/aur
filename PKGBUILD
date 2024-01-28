# Maintainer:

## useful links
# https://icecatbrowser.org/
# https://www.gnu.org/software/gnuzilla/
# https://git.savannah.gnu.org/cgit/gnuzilla.git
# https://software.classictetris.net/icecat/

## options
: ${_autoupdate:=false}

: ${_build_pgo:=true}
: ${_build_pgo_reuse:=true}

: ${_build_browser:=true}

[[ "${_build_browser::1}" == "t" ]] && _pkgtype+="-browser"

## basic info
_pkgname="icecat"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=115.7.0
pkgrel=1
pkgdesc="GNU version of the Firefox browser"
url="https://icecatbrowser.org"
license=('MPL-2.0')
arch=('x86_64')

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

  if [ -n "$_pkgtype" ] ; then
    provides=("$_pkgname=${pkgver%%.r*}")
    conflicts=("$_pkgname")
  fi

  options=(
    !debug
    !emptydirs
    !lto
    !strip
  )

  _pkgsrc="$_pkgname-$_pkgver"
  _pkgext="tar.bz2"
  source=("https://software.classictetris.net/icecat/${_pkgver}esr/$_pkgsrc-gnu1.$_pkgext")

  if [ "${_autoupdate::1}" != 't' ] ; then
    sha256sums=('3ed95f0d7810494a1da4657adb67c446819eb39e6333d1f9bb0afe7305284ff3')
  else
    sha256sums=('SKIP')
  fi
}

# common functions
pkgver() {
  echo "${_pkgver:?}"
}

prepare() {
  cat >icecat.desktop <<END
[Desktop Entry]
Version=1.0
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

  mkdir -p mozbuild
  cd "$_pkgsrc"

  # clear forced startup pages
  sed -E 's&^\s*pref\("startup\.homepage.*$&&' -i "browser/branding/official/pref/icecat-branding.js"

  # disable extensions, otherwise profiling freezes
  cp "browser/app/Makefile.in" "$srcdir/Makefile.in"
  sed -E -e '/^\t.*\/extensions\/gnu\/\*.*$/d' -i "browser/app/Makefile.in"

  cp "browser/installer/package-manifest.in" "$srcdir/package-manifest.in"
  sed -E -e '/^.*\/browser\/extensions\/.*$/d' -i "browser/installer/package-manifest.in"

  cp "browser/installer/allowed-dupes.mn" "$srcdir/allowed-dupes.mn"
  sed -E -e '/^browser\/extensions\/.*$/d' -i "browser/installer/allowed-dupes.mn"

  # configure
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
ac_add_options --with-distribution-id=org.gnu
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export NIGHTLY_BUILD=1
export MOZ_APP_REMOTINGNAME=$_pkgname

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
#ac_add_options --enable-eme=widevine
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

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]] ; then
    # find previous profile file...
    local _old_profdata _old_jarlog _pkgver_old tmp_old tmp_new
    _pkgver_prof=$(
      cd "${SRCDEST:-$startdir}"
      sort -rV <(for i in *.profdata ; do [ -f "$i" ] && echo "$i" ; done) | head -1
    )

    # new profile for new major version
    if [ "${_pkgver_prof%%.*}" != "${_pkgver%%.*}" ] ; then
      _build_pgo_reuse=false
      _pkgver_prof="$_pkgver"
    fi

    # new profile for minor version + 3
    _tmp_old=$(cut -d'-' -f2 <<< "${_pkgver_prof}" | cut -d'.' -f2 )
    _tmp_new=$(cut -d'-' -f2 <<< "${_pkgver}" | cut -d'.' -f2 )

    if [ "$_tmp_new" -ge "$((_tmp_old + 3))" ] ; then
      _build_pgo_reuse=false
      _pkgver_prof="$_pkgver"
    fi

    local _old_profdata="${SRCDEST:-$startdir}/$_pkgname-$_pkgver_prof-merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/$_pkgname-$_pkgver_prof-jarlog"

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

    # reenable extensions
    cp "$srcdir/Makefile.in" "browser/app/Makefile.in"
    cp "$srcdir/package-manifest.in" "browser/installer/package-manifest.in"
    cp "$srcdir/allowed-dupes.mn" "browser/installer/allowed-dupes.mn"

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
about=GNU IceCat for Arch Linux

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
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _ver_url="https://software.classictetris.net/icecat/last_version_check"
  local _pkgver_new=$(curl -Ssf "$_ver_url")

  # update _pkgver
  if [ "$_pkgver" == "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_update_version
_main_package
