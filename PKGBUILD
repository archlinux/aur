# Maintainer: Joan Figueras <ffigue at gmail>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Contributor: xiota

## options
: ${_build_pgo:=true}
: ${_build_pgo_reuse:=true}

## basic info
pkgname=icecat
pkgver=115.7.0
pkgrel=2
_commit=dbe6da400cf4f28e5e893d0acb5022e23cf3afcf
pkgdesc="GNU version of the Firefox browser."
arch=(x86_64)
license=(MPL-2.0)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  libxss
  libxt
  mime-types
  nss
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  inetutils
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
  zip
  mercurial
  wget
  python-jsonschema
  dbus-glib
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !emptydirs
  !lto
  !makeflags
)

source=(https://git.savannah.gnu.org/cgit/gnuzilla.git/snapshot/gnuzilla-${_commit}.tar.gz
        icecat.desktop icecat-safe.desktop)

sha256sums=('5aa10b4d7d886730e236a2289e32479322d336b96fe650842fad478f69596c9c'
            'e00dbf01803cdd36fd9e1c0c018c19bb6f97e43016ea87062e6134bdc172bc7d'
            '33dd309eeb99ec730c97ba844bf6ce6c7840f7d27da19c82389cdefee8c20208')

prepare() {
  cd gnuzilla-${_commit}

  # Uncomment if you have issues with gpg download... WITH PROXY gpg doesn't work!!!!!!
  #sed -e 's/^verify_sources$//g' -i makeicecat

  mkdir output || rm -rf output/*  # Clean output just in case is already an old build there
  if [ -f "${SRCDEST}/firefox-${pkgver}esr.source.tar.xz" ] && [ -f "${SRCDEST}/firefox-${pkgver}esr.source.tar.xz.asc" ]; then cp -f "${SRCDEST}"/firefox-${pkgver}esr.source.tar.xz{,.asc} output/ ; fi
  
  # Patches to avoid download sources if you have in your $startdir
  sed -e '/rm -rf output/d' -i makeicecat
  sed -e 's/wget -N/wget -nv -Nc/g' -i makeicecat
  
  # Other patches
  sed '/^finalize_sourceball$/d' -i makeicecat
  
  # If we want to avoid all locales, we can use variable _SPEED=y to build it with only 1 locale. Use variable _LOCALE to define it
  if [[ $_SPEED =~ [y|Y] ]]; then
    msg2 "Building without all locales..."
    sed -e 's/DEVEL=0/DEVEL=1/g' -i makeicecat
    # Also you can choose your locale using external variable _LOCALE. By default in upstream script this locale is es-ES
    [ -z "$_LOCALE" ] || sed -e "s/es-ES/$_LOCALE/g" -i makeicecat && echo "$_LOCALE" > custom-shipped-locales
    rm -rf data/files-to-append/l10n/*
  fi

  # Thanks to cysp74 to report this bug
  sed -e 's;find l10n -wholename '\''\*/brand.dtd'\'' | xargs;find l10n -wholename '\''\*/brand.dtd'\'' | xargs -r;g' -i makeicecat

  # Produce IceCat sources
  bash makeicecat
  cd output/icecat-${pkgver}

  # Patch to move files directly to /usr/lib/icecat. No more symlinks.
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME);g' -i config/baseconfig.mk
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME)-devel;g' -i config/baseconfig.mk

  # disable extensions, otherwise profiling freezes
  cp "browser/app/Makefile.in" "$srcdir/Makefile.in"
  sed -E -e '/^\t.*\/extensions\/gnu\/\*.*$/d' -i "browser/app/Makefile.in"
  cp "browser/installer/package-manifest.in" "$srcdir/package-manifest.in"
  sed -E -e '/^.*\/browser\/extensions\/.*$/d' -i "browser/installer/package-manifest.in"
  cp "browser/installer/allowed-dupes.mn" "$srcdir/allowed-dupes.mn"
  sed -E -e '/^browser\/extensions\/.*$/d' -i "browser/installer/allowed-dupes.mn"

  printf '%b' "  \e[1;36m->\e[0m\033[1m Starting build...\n"

  cat >../mozconfig <<END
_add_options --enable-application=browser

_add_options --prefix=/usr
_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --with-distribution-id=org.gnu
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

ac_add_options --with-app-basename=icecat
ac_add_options --with-app-name=icecat

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-eme

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
ac_add_options --enable-lto=cross
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
  cd gnuzilla-${_commit}/output/icecat-${pkgver}

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  if [[ "${_build_pgo::1}" == "t" ]] ; then
    # find previous profile file...
    local _old_profdata _old_jarlog _pkgver_old tmp_old tmp_new
    _pkgver_prof=$(
      cd "${SRCDEST:-$startdir}"
      for i in *.profdata ; do [ -f "$i" ] && echo "$i" ; done \
        | sort -rV | head -1
    )

    # new profile for new major version
    if [ "${_pkgver_prof%%.*}" != "${pkgver%%.*}" ] ; then
      _build_pgo_reuse=false
      _pkgver_prof="$pkgver"
    fi

    # new profile for minor version + 3
    _tmp_old=$(echo "${_pkgver_prof}" | cut -d'-' -f2 | cut -d'.' -f2)
    _tmp_new=$(echo "${pkgver}" | cut -d'-' -f2 | cut -d'.' -f2)

    if [ "${_tmp_new:-0}" -ge "$((_tmp_old + 3))" ] ; then
      _build_pgo_reuse=false
      _pkgver_prof="$pkgver"
    fi

    local _old_profdata="${SRCDEST:-$startdir}/$pkgname-$_pkgver_prof-merged.profdata"
    local _old_jarlog="${SRCDEST:-$startdir}/$pkgname-$_pkgver_prof-jarlog"

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
      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
      ./mach build

      echo "Profiling instrumented browser..."
      ./mach package
      LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="$PWD/jarlog" \
        xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
        ./mach python build/pgo/profileserver.py

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

package () {
  cd gnuzilla-${_commit}/output/icecat-${pkgver}

  # Remove cose.manifest and cose.sig cause march install fails
  find obj-x86_64-pc-linux-gnu/dist/bin/browser/extensions -name cose.manifest -delete
  find obj-x86_64-pc-linux-gnu/dist/bin/browser/extensions -name cose.sig -delete

  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=GNU IceCat for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  printf '%b' "  \e[1;36m->\e[0m\033[1m Finishing...\n"
  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"

  for i in 16 22 24 32 48 64 128 256; do
      install -Dm644 browser/branding/official/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/icecat.png"
  done
  install -Dm644 browser/branding/official/default48.png "${pkgdir}/usr/share/pixmaps/icecat.png"
  install -Dm644 "${srcdir}/icecat.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/icecat-safe.desktop" "${pkgdir}/usr/share/applications/"
}

# vim:set sw=2 sts=-1 et:
