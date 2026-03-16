# run pgo build or not; with X(vfb) or wayland
: ${_build_profiled:=true}
: ${_build_profiled_xvfb:=false}

epoch=1
# Maintainer: konvix <busybeaver@2mail.co>
pkgname=konform-browser
provides=(konform-browser)
conflicts=()
_pkgname="${pkgname}"
__pkgname=konform
_ffsrcver=140.8.0
_ffbuild=2
_l10n_commit=e4f894a4eef5c492c83a860a4ff16c8ed361445c
_moz_build_id=20260106170501
_lwrelver=110
pkgver="${_ffsrcver}.${_lwrelver}"
pkgrel=1
pkgdesc="Firefox ESR fork with increased security, privacy, and customizability"
url="https://codeberg.org/konform-browser/source"
if [[ "$_ffbuild" == "0" ]]; then
  : "${_ffsrcurl:="https://archive.mozilla.org/pub/firefox/releases/${_ffsrcver}esr"}"
else
  : "${_ffsrcurl:="https://archive.mozilla.org/pub/firefox/candidates/${_ffsrcver}esr-candidates/build${_ffbuild}"}"
fi
arch=(x86_64 aarch64)
license=(MPL-2.0)

depends=(
  dbus
  alsa-lib
  at-spi2-core
  cairo
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libevent
  libvpx
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  libwebp
  mime-types
  nspr
  nss
  pango
  pixman
  sh
  zlib
)
makedepends=(
  binutils
  cbindgen
  clang
  diffutils
  git
  imake
  inetutils
  jack
  jq
  lld
  llvm
  mesa
  nasm
  nodejs
  pciutils
  python
  python-filelock
  python-setuptools
  rust
  sccache
  unzip
  'wasi-compiler-rt'
  'wasi-libc++'
  'wasi-libc++abi'
  'wasi-libc'
  yasm
  zip

  # for generating sources
  gnupg
  tree
  wget
) # pciutils: only to avoid some PGO warning
optdepends=(
  'hunspell-dictionary: Spell checking'
  'ffmpeg4.4: additional video and audio codec support'
  'openh264: H264 video decoding support'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
  'firefox-ublock-origin: Content filter extension'
  'firefox-noscript: Selectively enable javascript on pages'
  'firefox-decentraleyes: Local emulation of Content Delivery Networks'
)

if [[ "${_build_profiled}" == "true" ]]; then
  if [[ "${_build_profiled_xvfb}" == "true" ]]; then
    makedepends+=(
      xorg-server-xvfb
    )
  else
    makedepends+=(
      weston
      xorg-xwayland
      wlheadless-run # aur/xwayland-run-git
    )
  fi
fi

backup=("usr/lib/${__pkgname}/librewolf.cfg"
        "usr/lib/${__pkgname}/distribution/policies.json")
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
)

install='konform.install'
_tag="${_ffsrcver}.${_lwrelver}"
_ff_source_tarball="firefox-${_ffsrcver}esr.source.tar.xz"
source=(
  "src"::"git+https://codeberg.org/konform-browser/source.git#tag=${_tag}"
  "${_ff_source_tarball}"::"${_ffsrcurl}/source/${_ff_source_tarball}"
  "${_ff_source_tarball}.asc"::"${_ffsrcurl}/source/${_ff_source_tarball}.asc"
  "firefox-l10n-${_l10n_commit}.tar.gz"::"https://github.com/mozilla-l10n/firefox-l10n/archive/$_l10n_commit.tar.gz"
  "${__pkgname}.desktop"
  "default192x192.png"
  "0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch"
)
sha256sums=('f601465d7e078fe329f6baaeaff61205ddfb8f67dbf99a6baaa359d9711d6b9a'
            '57a7f339ef68273f6597d8074a841fa053f63a21d1f609ab0074a26c063282e6'
            'SKIP'
            '52d638394dcc3254c70b550340bffb0ade63bd35f155eaee12e0000a51ef939b'
            '68fb47f178d5c3412162d3bb8f74abbfcf1977e0ea4dc69647580ff6f8a93fb4'
            'b86ddfc0cec482f7900f296857cdd0f1b736ff5037e0a86712b258ae0092924b'
            '157976ec4be8d723cd6240988b310bc8e1779b2272a258d886bc08389ceba852')

validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

prepare() {
  _lw_srcdir=$srcdir/src/librewolf-$_ffsrcver-$_lwrelver
  ## <srcprep>
  cp -p *.desktop *.png src/

  cd src
  mkdir -p mozbuild
  echo "${_lwrelver}" > release
  git submodule update --init --recursive
  rm -rf "${_lw_srcdir}"
  mv "${srcdir}/firefox-${_ffsrcver}" "$_lw_srcdir"
  mkdir -p "${_lw_srcdir}/lw"
  mv "../firefox-l10n-${_l10n_commit}" "${_lw_srcdir}/lw/l10n"

  python3 scripts/librewolf-patches.py "${_ffsrcver}" "${_lwrelver}"

  ## </srcprep>

  cd $_lw_srcdir

  mv mozconfig ../mozconfig || true

  export KONFORM_MOZ_BUILD_ID="${_moz_build_id}"
  export MOZ_BUILD_DATE="${KONFORM_MOZ_BUILD_ID}"
  cat >>../mozconfig <<END
##### main archlinux-firefox 136
ac_add_options --enable-hardening
ac_add_options --disable-install-strip
ac_add_options --allow-addon-sideload


##### Kon
mk_add_options KONFORM_MOZ_BUILD_ID=${KONFORM_MOZ_BUILD_ID}
export KONFORM_MOZ_BUILD_ID=${KONFORM_MOZ_BUILD_ID}
export MOZ_BUILD_DATE=${MOZ_BUILD_DATE}
export MOZ_REQUIRE_SIGNING=
export MOZ_DATA_REPORTING=
export MOZ_TELEMETRY_ON_BY_DEFAULT=

mk_add_options MOZ_CRASHREPORTER=
mk_add_options MOZ_DATA_REPORTING=
mk_add_options MOZ_SERVICES_HEALTHREPORT=
mk_add_options MOZ_TELEMETRY_REPORTING=
mk_add_options MOZ_TELEMETRY_ON_BY_DEFAULT=

mk_add_options MOZ_REQUIRE_SIGNING=

#ac_add_options --enable-rust-simd
ac_add_options --disable-tests
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --enable-system-pixman
ac_add_options --with-ccache=sccache

# fix missing <string.h> in optimized mach build (missing llvm library?) and speed up build in any case
ac_add_options --without-wasm-sandboxed-libraries

##### /Kon

ac_add_options --enable-linker=lld

ac_add_options --prefix=/usr

ac_add_options --disable-bootstrap

export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --with-app-name=${__pkgname}
ac_add_options --enable-update-channel=release
export MOZ_APP_REMOTINGNAME=${__pkgname}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

## Kon moar system libs
ac_add_options --with-system-zlib
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx

# Features
# keep alsa option in here until merged upstream
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-pulseaudio

# wasi
#ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# options for ci / weaker build systems
mk_add_options MOZ_PARALLEL_BUILD=1
mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold

# optimizations
ac_add_options OPT_LEVEL="2"
ac_add_options RUSTC_OPT_LEVEL="2"
END

if [[ "${CARCH}" == "aarch64" ]]; then
  cat >>../mozconfig <<END
ac_add_options --enable-optimize="-g0 -O2"

ac_add_options --enable-lto
END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0"

else

  cat >>../mozconfig <<END
ac_add_options --enable-lto=cross
END
fi

  # reduce chance of builds failung during linking due to running out of memory
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # Fix build with glibc 2.43
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
}


build() {
  _lw_srcdir=$srcdir/src/librewolf-$_ffsrcver-$_lwrelver
  cd "${_lw_srcdir}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  #hardcoded build time for additional fingerprint protection
  export KONFORM_MOZ_BUILD_ID="${_moz_build_id}"
  export MOZ_BUILD_DATE="${KONFORM_MOZ_BUILD_ID}"
  #export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1
  export MOZ_REQUIRE_SIGNING=

  # Work around https://bugzilla.mozilla.org/show_bug.cgi?id=1969383
  export RUST_MIN_STACK=33554432

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-v/}"

  # sacrifice cpu for memory to prevent OoM
  export LDFLAGS+=" -Wl,--no-keep-memory"
  ulimit -n 40960

  # Do 3-tier PGO


  if [[ "${_build_profiled}" == "true" ]]; then
    if [[ "${CARCH}" == "aarch64" ]]; then

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    else

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
export MOZ_ENABLE_FULL_SYMBOLS=1
END

    fi

    # temporarily disable ublock-origin, interferes with profiling
    cp "lw/policies.json" "$srcdir/policies.json"
    jq 'del(.policies.Extensions.Install)' "$srcdir/policies.json" > "lw/policies.json"
    # temporarily enable nimbus telemetry for profiling
    sed -i 's#^.*nimbus\.#// \0#' "lw/librewolf.cfg"

    echo "Building instrumented browser..."

    ./mach build --priority normal

    echo "Profiling instrumented browser..."

    ./mach package

    local _headless_env=(
      LIBGL_ALWAYS_SOFTWARE=true \
      LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="$PWD/jarlog" \
        dbus-run-session
    )

    if [[ "${_build_profiled_xvfb}" == "true" ]]; then
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

    echo "Building optimized browser..."

    if [[ -s merged.profdata ]]; then
      stat -c "Profile data found (%s bytes)" merged.profdata

      if [[ "${CARCH}" == "x86_64" ]]; then
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use
END
      else
        cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-use=cross
END
      fi

      cat >> .mozconfig - << END
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
END
    else
      echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
      stat -c "Jar log found (%s bytes)" jarlog
      cat >> .mozconfig - << END
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
    else
      echo "Jar log not found."
    fi

    # reenable ublock-origin
    cp "$srcdir/policies.json" "lw/policies.json"
    # disable nimbus telemetry
    cp "$srcdir/src/settings/librewolf.cfg" "lw/librewolf.cfg"

  else
    cat >.mozconfig ../mozconfig
  fi
  rm -f ../mozconfig  ./mozconfig

  ./mach build --priority normal
}

package() {
  _lw_srcdir=$srcdir/src/librewolf-$_ffsrcver-$_lwrelver
  cd "${_lw_srcdir}"
  DESTDIR="$pkgdir" ./mach install

  rm -f "${pkgdir}/usr/lib/pingsender"

  local vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  local distini="$pkgdir/usr/lib/$__pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=org.codeberg.${_pkgname}
version=1.0
about="Konform Browser"

[Preferences]
app.distributor="Konform Konsortium"
app.distributor.channel=${_pkgname}
app.partner.konform=${_pkgname}
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/librewolf/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$__pkgname.png"
  done
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$__pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/librewolf/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$__pkgname-symbolic.png"

  install -Dvm644 ${srcdir}/$__pkgname.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$__pkgname" <<END
#!/bin/sh
exec /usr/lib/${__pkgname}/${__pkgname} "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "${pkgdir}/usr/bin/${__pkgname}" "${pkgdir}/usr/lib/${__pkgname}/${__pkgname}-bin"
  ln -s "${__pkgname}" "${pkgdir}/usr/bin/${_pkgname}" || true
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$__pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
