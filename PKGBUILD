# Maintainer: Joan Figueras <ffigue at gmail>
# Maintainer: xiota / aur.chaotic.cx
# Contributor: (Parabola) fauno <fauno@kiwwwi.com.ar>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

## links
# https://www.gnu.org/software/gnuzilla/
# https://git.savannah.gnu.org/cgit/gnuzilla.git

## options
: ${_build_save_source:=true}
: ${_build_repatch:=false}

: ${_build_pgo:=true}
: ${_build_pgo_reuse:=try}
: ${_build_pgo_xvfb:=true}

: ${_ver_clang=17}
: ${RUSTUP_TOOLCHAIN:=1.77.2}

# set to download only one language; en-US does not work
: ${_lang:=}

## update
_icver="115.18.0"
_commit="dc99e15355412bc9b11b34d3fe5729bed1c251de"
_icsum="400d9708accf038af69ea991cec4357c5ff7188e62152f8993053736746b2a62"
_ffsum="2a79174f743caa1bffcc6f4e95e4642b0f36ab24cfa94e4dca0663e0d45c344c"

if [ -n "$_srcinfo" ]; then
  : ${_lang:=en-US}
fi

## remove partial downloads
# server cannot resume
(
  cd "$SRCDEST"
  rm -f *.part
)

## basic info
_pkgname="icecat"
pkgname="$_pkgname"
pkgver="$_icver"
pkgrel=1
pkgdesc="GNU version of the Firefox ESR browser"
url="https://git.savannah.gnu.org/cgit/gnuzilla.git"
license=('MPL-2.0')
arch=('x86_64')

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
  "clang${_ver_clang:-}"
  "lld${_ver_clang:-}"
  "llvm${_ver_clang:-}"
  "wasi-compiler-rt${_ver_clang:-}"
  cargo
  cbindgen
  diffutils
  dump_syms
  imake
  inetutils
  jack
  mercurial
  mesa
  nasm
  nodejs
  python
  python-setuptools
  rustup
  unzip
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
  zip

  ## _makeicecat
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
      xorg-xwayland
      wlheadless-run # AUR
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

_source_icecat() {
  _pkgsrc="$_pkgname-$pkgver"
  _pkgsrc_gnuzilla="gnuzilla-$_commit"
  _pkgsrc_firefox="firefox-${pkgver}"
  _pkgext="tar.gz"
  source=(
    "https://git.savannah.gnu.org/cgit/gnuzilla.git/snapshot/$_pkgsrc_gnuzilla.$_pkgext"
    "https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"{,.asc}
  )
  sha256sums=(
    "$_icsum"
    "$_ffsum"
    'SKIP'
  )

  validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

  _languages=(
    ach af an ar ast az be bg bn br bs ca ca-valencia cak cs cy da de dsb
    el en-CA en-GB eo es-AR es-CL es-ES es-MX et eu fa ff fi fr fur fy-NL
    ga-IE gd gl gn gu-IN he hi-IN hr hsb hu hy-AM ia id is it ja ja-JP-mac
    ka kab kk km kn ko lij lt lv mk mr ms my nb-NO ne-NP nl nn-NO oc
    pa-IN pl pt-BR pt-PT rm ro ru sc sco si sk sl son sq sr sv-SE szl
    ta te tg th tl tr trs uk ur uz vi xh zh-CN zh-TW
  )

  [ -n "$_lang" ] && _languages=("$_lang")

  for _locale in "${_languages[@]}"; do
    [ "$_locale" = "en-US" ] && continue
    source+=("l10n-central-$pkgver-$pkgrel-$_locale.zip"::"https://hg.mozilla.org/l10n-central/$_locale/archive/tip.zip")
    sha256sums+=('SKIP')
    noextract+=("l10n-central-$pkgver-$pkgrel-$_locale.zip")
  done
}

_source_patches() {
  local _url_aur="https://aur.archlinux.org/cgit/aur.git/plain"
  local _url_arch="https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw"

  local _patch_commit_1="24a6ea8"
  source+=(
    "18d19413472f-$_patch_commit_1.patch"::"$_url_aur/18d19413472f.patch?h=firefox-esr&id=$_patch_commit_1"
    "b1cc62489fae-$_patch_commit_1.patch"::"$_url_aur/b1cc62489fae.patch?h=firefox-esr&id=$_patch_commit_1"
  )
  sha256sums+=(
    '3cc55401ed5e027f1b9e667b0b52296af11f3c5c62b4a80b7e55cda0e117ed18'
    'f66a944fa8804c16b1f7bd9b42b18bfc2552a891adc148085f4b91685e8db117'
  )

  local _patch_commit_2="3d03cbfb37298c494be59bb34e3da365f10c00a3"
  source+=(
    "patch-python3.12-bug1831512-${_patch_commit_2::7}.patch"::"$_url_aur/patch-python3.12-bug1831512.patch?h=firedragon&id=$_patch_commit_2"
    "patch-python3.12-bug1860051-${_patch_commit_2::7}.patch"::"$_url_aur/patch-python3.12-bug1860051.patch?h=firedragon&id=$_patch_commit_2"
    "patch-python3.12-bug1866829-${_patch_commit_2::7}.patch"::"$_url_aur/patch-python3.12-bug1866829.patch?h=firedragon&id=$_patch_commit_2"
    "patch-python3.12-bug1874280-${_patch_commit_2::7}.patch"::"$_url_aur/patch-python3.12-bug1874280.patch?h=firedragon&id=$_patch_commit_2"
  )
  sha256sums+=(
    '9516c36c145d365c3b65153d83a5b3b0dd8a319b5c30d47a390070892bd431b3'
    '168d16a027a81c311c58f9302858244dfa5517f0a95a8d3df1abbf9b93b9d455'
    'df27ed1e0da5b192224978dc2a593a97e18e6e22062c611fc32b277500324e62'
    'cf1c69fd3338fd8f5e482f55b669160b08dfb021f2348b620f0a85dd9dee8150'
  )

  local _patch_commit_3=d2127a9424507a38cff13cce49403214a8190bed
  source+=(
    "0004-Bug-1912663-${_patch_commit_3::7}.patch"::"$_url_arch/$_patch_commit_3/0004-Bug-1912663-Fix-some-build-issues-with-cbindgen-0.27.patch"
  )
  sha256sums+=(
    'dd2aba1c02c21b89ceed0713a6aa0241365fe79b1e3a4d21cdcd7231db6fab5e'
  )
}

_source_icecat
_source_patches

_make_icecat() {
  if [ "${_build_repatch::1}" != "t" ] && [ -e "$SRCDEST/$_pkgsrc.tar.zst" ]; then
    echo "Restoring previously patched sources..."
    rm -rf "$srcdir/$_pkgsrc"
    bsdtar -xf "$SRCDEST/$_pkgsrc.tar.zst"
    return
  fi

  pushd "$_pkgsrc_gnuzilla"

  # clean output in case there is already an old build
  mkdir output || rm -rf output/*
  mkdir output/l10n

  echo "Preparing Firefox ESR..."
  # cp --reflink=auto -f "$srcdir/firefox-${pkgver}esr.source.tar.xz"{,.asc} "$_pkgsrc_gnuzilla"/output/

  bsdtar xf "$srcdir/firefox-${pkgver}esr.source.tar.xz"
  mv "$_pkgsrc_firefox" "$srcdir/$_pkgsrc_gnuzilla/output/$_pkgsrc"

  echo "Preparing translations..."
  local L10N_PREFS_DIR="browser/chrome/browser/preferences"
  local L10N_DTD_FILE="advanced-scripts.dtd"

  for _locale in "${_languages[@]}"; do
    mkdir -p "output/l10n/$_locale"
    bsdtar -C "output/l10n/$_locale" --strip-components 1 -xf "$srcdir/l10n-central-$pkgver-$pkgrel-$_locale.zip"
    mkdir -p "output/l10n/$_locale/$L10N_PREFS_DIR"
    touch "output/l10n/$_locale/$L10N_PREFS_DIR/$L10N_DTD_FILE"
    rm -rf "output/l10n/$_locale"/.hg*
  done

  echo "Patching sources..."

  # don't make source tarball
  sed '/^finalize_sourceball$/d' -i makeicecat

  # don't redownload or reextract firefox
  sed \
    -e '/^fetch_source$/d' \
    -e '/^verify_sources$/d' \
    -e '/^extract_sources$/d' \
    -i makeicecat

  # don't redownload languages
  sed -E -e '/DEVEL/s&^(\s*)!.*continue$&\1continue&' -i makeicecat

  # remove unwanted language data
  for i in data/files-to-append/l10n/*; do
    for j in "${_languages[@]}"; do
      [ "$j" = "${i##*/}" ] && continue
    done
    rm -rf "$i"
  done

  # produce icecat sources
  cd output
  bash ../makeicecat
  popd

  if [[ "${_build_save_source::1}" == "t" ]]; then
    echo "Saving patched sources..."
    [ -e "$SRCDEST/$_pkgsrc.tar.zst" ] && rm -rf "$SRCDEST/$_pkgsrc.tar.zst"
    mv "$_pkgsrc_gnuzilla/output/$_pkgsrc" "$srcdir/"
    bsdtar -a -cf "$_pkgsrc.tar.zst" --options zstd:compression-level=9 "$_pkgsrc"
    cp --reflink=auto -rf "$_pkgsrc.tar.zst" "$SRCDEST/"
  fi
}

prepare() {
  cat > icecat.desktop << END
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

  _make_icecat

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
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-pulseaudio
ac_add_options --enable-raw
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
ac_add_options --enable-optimize=-O3
ac_add_options --enable-lto=cross,full
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"

# Other
export AR=llvm-ar${_ver_clang:+-$_ver_clang}
export CC=clang${_ver_clang:+-$_ver_clang}
export CXX=clang++${_ver_clang:+-$_ver_clang}
export NM=llvm-nm${_ver_clang:+-$_ver_clang}
export RANLIB=llvm-ranlib${_ver_clang:+-$_ver_clang}
END

  local src _patches
  _patches=(
    ${source[@]}
  )
  for src in "${_patches[@]}"; do
    src="${src%%::*}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
      echo
    fi
  done
}

build() (
  cd "$_pkgsrc"

  export PATH LD_LIBRARY_PATH RUSTUP_TOOLCHAIN
  PATH="/usr/lib/llvm${_ver_clang:-}/bin:$PATH"
  LD_LIBRARY_PATH="/usr/lib/llvm${_ver_clang:-}/lib"

  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$srcdir/xdg-runtime}"
  [ ! -d "$XDG_RUNTIME_DIR" ] && install -dm700 "${XDG_RUNTIME_DIR:?}"

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
      cd "${SRCDEST:-$startdir}"
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

    local _old_profdata="${SRCDEST:-$startdir}/$_pkgname-$_pkgver_prof-merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/$_pkgname-$_pkgver_prof-jarlog"

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

    # reenable extensions
    cp "$srcdir/Makefile.in" "browser/app/Makefile.in"
    cp "$srcdir/package-manifest.in" "browser/installer/package-manifest.in"
    cp "$srcdir/allowed-dupes.mn" "browser/installer/allowed-dupes.mn"

    ./mach build
  else
    echo "Building browser..."
    cat > .mozconfig ../mozconfig

    ./mach build
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
  ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e "$nssckbi" ]]; then
    ln -sf "/usr/lib/libnssckbi.so" "$nssckbi"
  fi

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
