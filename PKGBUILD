# Maintainer:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Maintainer:  Niko Cantero <[at]niko:conduit.rs (Matrix)>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

## options
# three-stage profile-guided optimization
: ${_build_pgo:=true}

# reuse existing PGO profile
: ${_build_pgo_reuse:=true}

# package debug symbols for upload
: ${_build_symbols:=false}

# make latest mozilla-central nightly revision
: ${_build_nightly:=false}

# target wayland only
: ${_build_wayland:=true}

# profile with xvfb-run, if possible
: ${_build_pgo_xvfb:=false}

# modify package name
: ${_build_hg:=true}

[[ "${_build_nightly::1}" == "t" ]] && _pkgtype+="-nightly"
[[ "${_build_wayland::1}" == "t" ]] && _pkgtype+="-wayland"
[[ "${_build_hg::1}" == "t" ]] && _pkgtype+="-hg"

## basic info
pkgname="firefox${_pkgtype:-}"
_pkgname=firefox-nightly
pkgver=125.0a1+20240220.1+hef9cbc0f26f8
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
url="https://www.mozilla.org/firefox/channel/#nightly"
license=('MPL-2.0')
arch=(x86_64)

depends=(
  dbus
  ffmpeg
  gtk3
  libevent
  libjpeg
  libpulse
  libvpx
  libwebp
  mime-types
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
  if [[ "${_build_pgo_xvfb::1}" == "t" ]] && [ "${_build_wayland::1}" != "t" ] ; then
    makedepends+=(
      xorg-server-xvfb
    )
  else
    makedepends+=(
      weston
      xwayland-run # AUR
    )
  fi
fi

if [[ "${_build_nightly::1}" == "t" ]] ; then
  pkgdesc+=" - nightly"
else
  pkgdesc+=" - mozilla-unified hg, nightly branding"
fi

if [[ "${_build_wayland::1}" == "t" ]] ; then
  pkgdesc+=", targeting wayland"
else
  pkgdesc+=", targeting wayland and x11"

  depends+=(
    libxss
    libxt
  )
fi

if [[ "${_build_hg::1}" == "t" ]] ; then
  depends+=(
    nspr-hg
    nss-hg
  )
fi

if [[ "$pkgname" != "firefox-nightly" ]] ; then
  provides=('firefox-nightly')
  conflicts=('firefox-nightly')
fi

options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)

if [[ "${_build_nightly::1}" == "t" ]] ; then
  _get_version_info() {
    local _info_url="https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central"
    local _filename=$(
      curl -Ssf "$_info_url/" | grep linux-x86_64\.txt \
        | sed -E 's&^.*href=".*/(firefox-.*\.linux-x86_64\.txt)".*$&\1&' \
        | sort -rV | head -1
    )
    local _response=$(curl -Ssf "$_info_url/$_filename")
    _version=$(printf '%s' "$_filename" | sed -E 's&^firefox-([0-9]+\.[0-9].*)\.en-US\.linux-x86_64\.txt$&\1&')
    _date=$(printf '%s' "$_response" | head -1 | sed -E 's&^([0-9]{8})([0-9]*)$&\1.\2&')
    _revision=$(printf '%s' "$_response" | tail -1 | sed -E 's&^.*/rev/([a-f0-9]+)$&\1&')
  }
  _get_version_info

  _repo="https://hg.mozilla.org/mozilla-central"

  source+=("hg+$_repo#revision=$_revision")
  sha256sums+=('SKIP')

  pkgver() {
    printf '%s+%s+h%s' "${_version:?}" "${_date::11}" "${_revision::9}"
  }
else
  _repo="https://hg.mozilla.org/mozilla-unified"

  source+=("hg+$_repo")
  sha256sums+=('SKIP')

  pkgver() {
    cd "${_repo##*/}"

    local version=$(<browser/config/version_display.txt)
    local date=$(date +%Y%m%d) # Without TZ=UTC, to match systemd timer
    local counter=1
    local rev=$(hg id -i -r. | sed 's/+$//')

    local last_rev=${pkgver##*+h} tmp=${pkgver#*+}; tmp=${tmp%+*}
    local last_date=${tmp%.*} last_counter=${tmp#*.}
    if [[ $date == $last_date ]]; then
      if [[ $rev == $last_rev ]]; then
        counter=$last_counter
      else
        counter=$((last_counter + 1))
      fi
    fi

    echo $version+$date.$counter+h$rev
  }
fi

source+=(
  $_pkgname.desktop
  identity-icons-brand.svg
  firefox-install-dir.patch
)
sha256sums+=(
  '022e9329fdb4af6267ad32a1398a9ae94a90cbb1e80dcf63e8b19e95490e7a35'
  'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
  'c80937969086550237b0e89a02330d438ce17c3764e43cc5d030cb21c2abce5f'
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir mozbuild
  cd "${_repo##*/}"

  # Change install dir from 'firefox' to 'firefox-nightly'
  patch -Np1 -i ../firefox-install-dir.patch

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

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
export MOZ_ENABLE_WAYLAND=1

# Branding
ac_add_options --with-branding=browser/branding/nightly
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}
export NIGHTLY_BUILD=1
export MOZ_REQUIRE_SIGNING=

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System Libraries
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --enable-alsa
ac_add_options --enable-av1
ac_add_options --enable-crashreporter
ac_add_options --enable-eme=widevine
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-pulseaudio
ac_add_options --enable-raw
ac_add_options --enable-sandbox
ac_add_options --enable-unverified-updates
ac_add_options --enable-webrtc
ac_add_options --disable-default-browser-agent
ac_add_options --disable-parental-controls
ac_add_options --disable-tests
ac_add_options --disable-updater

# Disables Telemetry by Default
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

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

  if [[ "${_build_wayland::1}" == "t" ]] ; then
    echo >>../mozconfig "ac_add_options --enable-default-toolkit=cairo-gtk3-wayland-only"
  else
    echo >>../mozconfig "ac_add_options --enable-default-toolkit=cairo-gtk3-x11-wayland"
  fi

  if [[ "${_build_hg::1}" == "t" ]] ; then
    cat >>../mozconfig <<END
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
END
  fi
}

build() {
  cd "${_repo##*/}"

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && install -dm700 "${XDG_RUNTIME_DIR:?}"

  export LIBGL_ALWAYS_SOFTWARE=true

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
    local _old_profdata="${SRCDEST:-$startdir}/merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/jarlog"

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

      if [[ "${_build_pgo_xvfb::1}" == "t" ]] ; then
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
    cat >.mozconfig ../mozconfig

    if [[ -s merged.profdata ]] ; then
      stat -c "Profile data found (%s bytes)" merged.profdata
      echo >>.mozconfig "ac_add_options --enable-profile-use=cross"
      echo >>.mozconfig "ac_add_options --with-pgo-profile-path='${PWD@Q}/merged.profdata'"

      # save profdata for reuse
      cp --reflink=auto -f merged.profdata "$_old_profdata"
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]] ; then
      stat -c "Jar log found (%s bytes)" jarlog
      echo >>.mozconfig "ac_add_options --with-pgo-jarlog='${PWD@Q}/jarlog'"

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

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd "${_repo##*/}"
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
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=nightly
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dvm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/${_pkgname%-*}-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/}/SearchProvider
Version=2
END

  # Package debug symbols for upload
  if [[ "${_build_symbols::1}" == "t" ]] ; then
    export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
    if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
      make -C obj uploadsymbols
    else
      cp -fvt "$startdir" obj/dist/*crashreporter-symbols.zip
    fi
  fi
}

# vim:set sw=2 sts=-1 et:
