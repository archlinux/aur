# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Vladislav Nepogodin (vnepogodin) <nepogodin.vlad@gmail.com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
pkgname=librewolf-hg
_pkgname=librewolf-nightly
__pkgname="Librewolf Nightly"
pkgver=137.0a1.r858427.9d37719001d6
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom.  Mercurial version."
url="https://librewolf.net/"
arch=(x86_64 aarch64)
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus
  alsa-lib
  at-spi2-core
  bash
  cairo
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  binutils
  cbindgen
  ccache
  clang
  diffutils
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
  pciutils
  python
  rust
  unzip
  'wasi-compiler-rt>15'
  'wasi-libc++>15'
  'wasi-libc++abi>15'
  'wasi-libc>=1:0+314+a1c7c2c'
  xorg-server-xvfb
  yasm
  zip
) # pciutils: only to avoid some PGO warning
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)


backup=('usr/lib/librewolf-nightly/librewolf.cfg'
        'usr/lib/librewolf-nightly/distribution/policies.json')
options=(!emptydirs !makeflags !lto !debug)
_arch_git=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/firefox/trunk
_repo=https://hg.mozilla.org/mozilla-unified
install=librewolf-nightly.install
source=("hg+$_repo#revision=autoland"
        $_pkgname.desktop
        "git+https://codeberg.org/librewolf/source.git"
        "git+https://codeberg.org/librewolf/settings.git"
        "default192x192.png")
sha512sums=('SKIP'
            '5a0932eeceba04a09133a7b61e9eee49cd5bdacb2daadc132e910fdd3ef8392262208b6401043655bff58068b2320022daa6722f11aed9284c5b5a008d570bcd'
            'SKIP'
            'SKIP'
            '2ebb0e9b37ea6445d71ab783ca180def1125ec76bff685cce31705360f32fd26d205ba95e232848663bd1c1d927873985d3658105588feb7f09aec0180b6e3a7')

pkgver() {
  cd mozilla-unified
  _pkgver=$(cat browser/config/version.txt)
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed 's/\+//g'
}

prepare() {
  mkdir -p mozbuild
  cd mozilla-unified

  local _patches_dir="${srcdir}/source/patches"

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --with-ccache
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
export CC='clang'
export CXX='clang++'

# wasi sdk
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-update-channel=nightly
ac_add_options --with-app-name=${_pkgname}
ac_add_options --with-app-basename="${__pkgname}"
ac_add_options --with-branding=browser/branding/${_pkgname}
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
# ac_add_options --with-system-icu 2024-07-24, fails to build with system icu
ac_add_options --with-system-zlib
ac_add_options --with-system-jpeg

# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-crashreporter
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --disable-synth-speechd
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --disable-rust-tests
ac_add_options --disable-necko-wifi
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --disable-bootstrap

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# options for ci / weaker build systems
# mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold
END

if [[ $CARCH == 'aarch64' ]]; then
  cat >>../mozconfig <<END
# taken from manjaro build:
ac_add_options --enable-optimize="-g0 -O2"
END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0"

  # we should have more than enough RAM on the CI spot instances.
  # ...or maybe not?
  export LDFLAGS+=" -Wl,--no-keep-memory"
  # patch -Np1 -i ${_patches_dir}/arm.patch # not required anymore?
  patch -Np1 -i ${_patches_dir}/build-arm-libopus.patch

else

  cat >>../mozconfig <<END
# probably not needed, enabled by default?
ac_add_options --enable-optimize
END
fi

  # Remove some pre-installed addons that might be questionable
  patch -Np1 -i ${_patches_dir}/remove_addons.patch

  # Debian patch to enable global menubar
  # 2024-07-24: Disabled, fails to apply cleanly
  # patch -Np1 -i ${_patches_dir}/unity_kde/unity-menubar.patch

  # Disabling Pocket
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  # Remove Internal Plugin Certificates
  # patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch
  # => breaks profiled builds since 90.0, it seems

  # allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  cp "${srcdir}/source/assets/search-config.json" services/settings/dumps/main/search-config.json

  # stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  # Assorted patches
  #2024-07-24: Disabled, fails to apply cleanly
  # patch -Np1 -i ${_patches_dir}/context-menu.patch
  patch -Np1 -i ${_patches_dir}/urlbarprovider-interventions.patch

  # allow overriding the color scheme light/dark preference with RFP
  # deprecated, will probably be dropped soon
  # patch -Np1 -i ${_patches_dir}/allow_dark_preference_with_rfp.patch

  # fix an URL in 'about' dialog
  # patch -Np1 -i ${_patches_dir}/about-dialog.patch

  # change some hardcoded directory strings that could lead to unnecessarily
  # created directories
  patch -Np1 -i ${_patches_dir}/mozilla_dirs.patch

  # somewhat experimental patch to fix bus/dbus/remoting names to io.gitlab.librewolf
  # should not break things, buuuuuuuuuut we'll see.
  patch -Np1 -i ${_patches_dir}/dbus_name.patch

  # allow uBlockOrigin to run in private mode by default, without user intervention.
  patch -Np1 -i ${_patches_dir}/allow-ubo-private-mode.patch

  # add custom uBO assets (on first launch only)
  patch -Np1 -i ${_patches_dir}/custom-ubo-assets-bootstrap-location.patch

  # ui patches

  # remove references to firefox from the settings UI, change text in some of the links,
  # explain that we force en-US and suggest enabling history near the session restore checkbox.
  patch -Np1 -i ${_patches_dir}/ui-patches/pref-naming.patch

#  # remove firefox references in the urlbar, when suggesting opened tabs.
#  patch -Np1 -i ${_patches_dir}/ui-patches/remove-branding-urlbar.patch

  # remove cfr UI elements, as they are disabled and locked already.
  patch -Np1 -i ${_patches_dir}/ui-patches/remove-cfrprefs.patch

  # do not display your browser is being managed by your organization in the settings.
  patch -Np1 -i ${_patches_dir}/ui-patches/remove-organization-policy-banner.patch

  # add warning that sanitizing exceptions are bypassed by the options in History > Clear History when LibreWolf closes > Settings
  patch -Np1 -i ${_patches_dir}/removed-patches/sanitizing-description.patch

  # pref pane TODO: update to https://codeberg.org/librewolf/source/src/branch/main/patches/pref-pane
  # patch -Np1 -i ${_patches_dir}/removed-patches/librewolf-pref-pane.patch

  # fix telemetry removal, see https://gitlab.com/librewolf-community/browser/linux/-/merge_requests/17, for example
 # 2024-07-24: Disabled, fails to apply cleanly
 # patch -Np1 -i ${_patches_dir}/disable-data-reporting-at-compile-time.patch

  rm -f ${srcdir}/librewolf-common/source_files/mozconfig # what was this for? TODO
  cp -r  ${srcdir}/source/themes/browser/branding/librewolf  ${srcdir}/source/themes/browser/branding/librewolf-nightly
  cp -r ${srcdir}/source/themes/browser ./
}

build() {
  cd mozilla-unified

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_USE_SYSTEM_PYTHON=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

   # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO/PGO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  # CFLAGS="${CFLAGS/-fno-plt/}"
  # CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  # Do 3-tier PGO
  echo "Building instrumented browser..."

if [[ $CARCH == 'aarch64' ]]; then

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END

else

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END

fi

  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."

if [[ $CARCH == 'aarch64' ]]; then

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
ac_add_options --enable-linker=lld
END

else

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
END

fi

  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd mozilla-unified
  DESTDIR="$pkgdir" ./mach install
  mv "$pkgdir"/usr/lib/${_pkgname}/{$_pkgname,librewolf}
  mv "$pkgdir"/usr/lib/${_pkgname}/{$_pkgname-bin,librewolf-bin}
  rm "$pkgdir"/usr/lib/${_pkgname}/pingsender

#  install -Dm644 "$srcdir/settings/$_pkgname.psd" "$pkgdir/usr/share/psd/browsers/$_pkgname"

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"

  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  cd ${srcdir}/mozilla-unified
  cp -r ${srcdir}/settings/* ${pkgdir}/usr/lib/${_pkgname}/

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=$__pkgname for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/${_pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  #install -Dm644 browser/branding/${_pkgname}/content/about-logo.png \
  #  "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dm644 browser/branding/${_pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.png"

  # Install .desktop files
  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  ln -srf "$pkgdir"/usr/lib/${_pkgname}/librewolf \
          "$pkgdir"/usr/bin/$_pkgname
}

