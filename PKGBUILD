# run pgo build or not; with X(vfb) or wayland
: ${_build_profiled:=false}
: ${_build_profiled_xvfb:=true}
: ${_package_multilocale:=true}

epoch=1
# Maintainer: konvix <busybeaver@2mail.co>
pkgname=konform-browser
provides=(konform-browser)
conflicts=()
_pkgname="${pkgname}"
__pkgname=konform
_ffsrcver=140.12.0
_ffbuild=1
_l10n_commit=5db0b9bd7b7bdb9a5671cc504da09caf65d5d3b1
_lwrelver=100
pkgver="${_ffsrcver}.${_lwrelver}"
pkgrel=1
pkgrel=2
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
  libvpx.so
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  libwebp.so
  mime-types
  nspr
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
  llvm-libs
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
  wasi-compiler-rt
  wasi-libc++
  wasi-libc++abi
  wasi-libc
  xz
  yasm
  zip

  # for generating sources
  gnupg
  tree
  wget
) # pciutils: only to avoid some PGO warning
optdepends=(
  'hunspell-dictionary: Spell checking'
  'ffmpeg: additional video and audio codec support'
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
  "0002-Use-wasm32-wasip1-target.patch"
  "0003-update-rust-bindgen-to-fix-clang22-build.patch.xz"
  "0004-skia-m142-update.patch.xz"
  "0005-cbindgen-0_29_4.patch"
)
sha256sums=('c297d87275f7f76e556bbfa3f844791ff78eeca6cb174802191520462da6e079'
            '85dfb9f6021152b4302b8968ef485d958c8c471cb02415a19853daaad5acce62'
            'SKIP'
            '50b9d366fb58a45ba7dd3949e08600f6bebf0ead86cc35e9c2f5c20b624de512'
            '68fb47f178d5c3412162d3bb8f74abbfcf1977e0ea4dc69647580ff6f8a93fb4'
            'b86ddfc0cec482f7900f296857cdd0f1b736ff5037e0a86712b258ae0092924b'
            '157976ec4be8d723cd6240988b310bc8e1779b2272a258d886bc08389ceba852'
            'baad79216200df4ea05a0e5ca26e0c56c4d4a3cd2149d32f15dc8b7c724376ba'
            '8f9b7458760b37766a73d4d2c0e93dc810e59d3844495b9d52b3b61dde59c05d'
            'e11aba9839824096f07ca5dc17c9fd5bfa09209f8261ab09f7e473f350a82760'
            '198a797558d58d8cb68870fc1ff30dead271f5f1a3be0bce9a627d728a37da9f')

validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
_languages=(
    ach af an ar ast az be bg bn br bs ca-valencia ca cak cs cy da de dsb el
    en-CA en-GB en-US eo es-AR es-CL es-ES es-MX et eu fa ff fi fr fy-NL ga-IE
    gd gl gn gu-IN he hi-IN hr hsb hu hy-AM ia id is it ja ka kab kk km kn ko lij
    lt lv mk mr ms my nb-NO ne-NP nl nn-NO oc pa-IN pl pt-BR pt-PT rm ro ru si sk sl
    son sq sr sv-SE ta te th tl tr trs uk ur uz vi xh zh-CN zh-TW
)

prepare() {
  _lw_srcdir=$srcdir/src/source-$_ffsrcver
  ## <srcprep>
  cp -p *.desktop *.png src/

  cd src
  mkdir -p mozbuild
  echo "${_lwrelver}" > release
  git submodule update --init --recursive
  rm -rf "${_lw_srcdir}/"* "${_lw_srcdir}/".* || true
  mv "${srcdir}/firefox-${_ffsrcver%b*}"/* "${srcdir}/firefox-${_ffsrcver%b*}"/.* "${_lw_srcdir}/"
  mkdir -p "${_lw_srcdir}/lw"
  mv "../firefox-l10n-${_l10n_commit}" "${_lw_srcdir}/lw/l10n"

  python3 scripts/librewolf-patches.py "${_ffsrcver}" "${_lwrelver}"

  ## </srcprep>

  cd $_lw_srcdir
  mv -b mozconfig ../mozconfig || true

  cat >>../mozconfig <<END
ac_add_options --disable-install-strip

ac_add_options --enable-system-pixman
ac_add_options --with-ccache=sccache

ac_add_options --enable-linker=lld
ac_add_options --prefix=/usr
ac_add_options --disable-bootstrap

export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --with-app-name=${__pkgname}
export MOZ_APP_REMOTINGNAME=${__pkgname}

# System libraries
ac_add_options --with-system-nspr

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
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

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
  patch -B .patchorigin -Np1 -i ../../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
  patch -B .patchorigin -Np1 -i ../../0002-Use-wasm32-wasip1-target.patch
  xzcat ../../0003-update-rust-bindgen-to-fix-clang22-build.patch.xz | patch -B .patchorigin -Np1
  xzcat ../../0004-skia-m142-update.patch.xz | patch -B .patchorigin -Np1
  patch -B .patchorigin -Np1 -i ../../0005-cbindgen-0_29_4.patch
}


build() {
  _lw_srcdir=$srcdir/src/source-$_ffsrcver
  cd "${_lw_srcdir}"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
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
  _lw_srcdir=$srcdir/src/source-$_ffsrcver
  cd "${_lw_srcdir}"
  if [[ "${_package_multilocale}" == "true" ]]; then
    MOZ_PKG_FORMAT=tar ./mach package-multi-locale --locales ${_languages[@]}
    export MOZ_CHROME_MULTILOCALE="${_languages[*]}"
  fi
  DESTDIR="$pkgdir" ./mach install

  rm -f "${pkgdir}/usr/lib/pingsender"

  local vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END
  # enable langpacks for non-localized builds
  if [[ "${_package_multilocale}" == "false" ]]; then
    echo 'pref("intl.multilingual.downloadEnabled", true);' >> "$vendorjs"
  fi

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
}
