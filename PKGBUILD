# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Peter Jung <admin@ptr1337.dev>
# Contributor: vnepogodin
# Contributor: torvic9 AT mailbox DOT org
# Contributor: lsf

__pkgname=firedragon
pkgname=$__pkgname-unsigned-extensions
_pkgname=FireDragon
pkgver=112.0.1
pkgrel=1
pkgdesc="FireDragon modified to allow installation of unsigned extensions"
arch=(x86_64 x86_64_v3 aarch64)
backup=('usr/lib/firedragon/firedragon.cfg'
  'usr/lib/firedragon/distribution/policies.json')
license=(MPL GPL LGPL)
url=https://gitlab.com/dr460nf1r3/settings/
_arch_git=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/firefox/trunk
_arch_git_blob=https://raw.githubusercontent.com/archlinux/svntogit-packages
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font libpulse ffmpeg xdg-desktop-portal)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
  autoconf2.13 rust clang llvm jack nodejs cbindgen nasm mold gawk
  python-setuptools python-zstandard git binutils dump_syms lld
  'wasi-compiler-rt>13' 'wasi-libc>=1:0+258+30094b6' 'wasi-libc++>13' 'wasi-libc++abi>13' pciutils) # pciutils: only to avoid some PGO warning
optdepends=('firejail-git: Sandboxing the browser using the included profiles'
  'profile-sync-daemon: Load the browser profile into RAM'
  'whoogle: Searching the web using a locally running Whoogle instance'
  'searx: Searching the web using a locally running searX instance'
  'networkmanager: Location detection via available WiFi networks'
  'libnotify: Notification integration'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'hunspell-en_US: Spell checking, American English'
  'libappindicator-gtk3: Global menu support for GTK apps'
  'appmenu-gtk-module-git: Appmenu for GTK only'
  'plasma5-applets-window-appmenu: Appmenu for Plasma only')
provides=("firedragon")
conflicts=("firedragon")
options=(!emptydirs !makeflags !strip !lto !debug)
install=$__pkgname.install
source=(https://archive.mozilla.org/pub/firefox/releases/"$pkgver"/source/firefox-"$pkgver".source.tar.xz{,.asc}
  "$__pkgname.desktop"
  "git+https://gitlab.com/dr460nf1r3/common.git"
  "git+https://gitlab.com/dr460nf1r3/settings.git"
  "librewolf-source::git+https://gitlab.com/librewolf-community/browser/source.git"
  "librewolf-settings::git+https://gitlab.com/librewolf-community/settings.git"
  "cachyos-source::git+https://github.com/CachyOS/CachyOS-Browser-Common.git")
sha256sums=('5d2b2886812fe1bc62b7801495d375e3de94ca160a676057d1df92de87efb649'
  'SKIP'
  '53d3e743f3750522318a786befa196237892c93f20571443fdf82a480e7f0560'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
# sha256sums_aarch64=()
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# change this to false if you do not want to run a PGO build for aarch64 or x86_64
_build_profiled_aarch64=true
_build_profiled_x86_64=true

# Fix some potential Python and a Rust error
if [ "${CC}" != "gcc" ] || [ "${CXX}" != "g++" ]; then
  export CC=gcc
  export CXX=g++
  export LD=ld
  export AS=""
  export NM=""
  export AR=""
  export RANLIB=""
  export OBJCOPY=""
  export LDFLAGS="${LDFLAGS/-static/}"
fi

prepare() {
  mkdir -p mozbuild
  cd firefox-"$pkgver"

  local _patches_dir
  _patches_dir="${srcdir}/common/patches"

  local _librewolf_patches_dir
  _librewolf_patches_dir="${srcdir}/librewolf-source/patches"

  local _cachyos_patches_dir
  _cachyos_patches_dir="${srcdir}/cachyos-source/patches"

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

# This supposedly speeds up compilation (We test through dogfooding anyway)
ac_add_options --disable-debug
ac_add_options --disable-tests

# TODO: use source/assets/moczonfig in the future
# NOTE: let us use it for one last build, otherwise, there might be some conflicts
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

ac_add_options --disable-bootstrap
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-hardening
ac_add_options --enable-linker=mold
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --prefix=/usr

export AR=llvm-ar
export CC='clang'
export CXX='clang++'
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --allow-addon-sideload
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${__pkgname}
ac_add_options --with-branding=browser/branding/${__pkgname}
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
export MOZ_REQUIRE_SIGNING=

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter
ac_add_options --disable-updater

# WASI
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
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
    # patch -Np1 -i "${_librewolf_patches_dir}"/arm.patch # not required anymore?
    # patch -Np1 -i ../${pkgver}-${pkgrel}_build-arm-libopus.patch

  else

    cat >>../mozconfig <<END
# probably not needed, enabled by default?
ac_add_options --enable-optimize

# Arch upstream has it in their PKGBUILD, ALARM does not for aarch64:
ac_add_options --disable-elf-hack

# might help with failing x86_64 builds?
export LDFLAGS+=" -Wl,--no-keep-memory"
END
  fi

  # Upstream patches from gentoo
  # PGO improvements
  patch -Np1 -i "${_cachyos_patches_dir}"/gentoo/0015-bmo-1516081-Disable-watchdog-during-PGO-builds.patch

  # Remove some pre-installed addons that might be questionable
  patch -Np1 -i "${_librewolf_patches_dir}"/remove_addons.patch

  # KDE menu and unity menubar
  patch -Np1 -i "${_cachyos_patches_dir}"/unity_kde/mozilla-kde.patch
  patch -Np1 -i "${_cachyos_patches_dir}"/unity_kde/firefox-kde.patch
  patch -Np1 -i "${_cachyos_patches_dir}"/unity_kde/unity-menubar.patch
  patch -Np1 -i "${_cachyos_patches_dir}"/kde/mozilla-nongnome-proxies.patch

  # Disabling Pocket
  patch -Np1 -i "${_librewolf_patches_dir}"/sed-patches/disable-pocket.patch

  # Allow SearchEngines option in non-ESR builds
  patch -Np1 -i "${_librewolf_patches_dir}"/sed-patches/allow-searchengines-non-esr.patch

  # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i "${_librewolf_patches_dir}"/sed-patches/stop-undesired-requests.patch

  # Assorted patches
  patch -Np1 -i "${_librewolf_patches_dir}"/urlbarprovider-interventions.patch

  # Allow uBlockOrigin to run in private mode by default, without user intervention.
  patch -Np1 -i "${_librewolf_patches_dir}"/allow-ubo-private-mode.patch

  # Add custom uBO assets (on first launch only)
  patch -Np1 -i "${_librewolf_patches_dir}"/custom-ubo-assets-bootstrap-location.patch

  # UI patches
  # Remove references to firefox from the settings UI, change text in some of the links,
  # explain that we force en-US and suggest enabling history near the session restore checkbox.
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/pref-naming.patch

  # Don't nag to set default browser
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/hide-default-browser.patch

  # Add LibreWolf logo to Debugging Page
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/lw-logo-devtools.patch

  # Remove firefox references in the urlbar, when suggesting opened tabs.
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/remove-branding-urlbar.patch

  # Remove cfr UI elements, as they are disabled and locked already.
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/remove-cfrprefs.patch

  # Do not display your browser is being managed by your organization in the settings.
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/remove-organization-policy-banner.patch

  # Hide "snippets" section from the home page settings, as it was already locked.
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/remove-snippets-from-home.patch

  # Update handler links
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/handlers.patch

  # Fix telemetry removal, see https://gitlab.com/librewolf-community/browser/linux/-/merge_requests/17, for example
  patch -Np1 -i "${_librewolf_patches_dir}"/disable-data-reporting-at-compile-time.patch

  # Hide Firefox view
  patch -Np1 -i "${_librewolf_patches_dir}"/ui-patches/firefox-view.patch

  # Allows hiding the password manager (from the lw pref pane) / via a pref
  patch -Np1 -i "${_librewolf_patches_dir}"/hide-passwordmgr.patch

  # Faster multilocate
  patch -Np1 -i "${_librewolf_patches_dir}"/faster-package-multi-locale.patch

  # Pref pane - custom FireDragon svg
  patch -Np1 -i "${_patches_dir}"/custom/librewolf-pref-pane.patch
  patch -Np1 -i "${_patches_dir}"/custom/add_firedragon_svg.patch

  # Update privacy preferences
  patch -Np1 -i "${_patches_dir}"/custom/privacy-preferences.patch

  rm -f "${srcdir}"/common/source_files/mozconfig
  cp -r "${srcdir}"/common/source_files/* ./
}

build() {
  cd firefox-"$pkgver"

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  # export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export PIP_NETWORK_INSTALL_RESTRICTED_VIRTUALENVS=mach # let us hope this is a working _new_ workaround for the pip env issues?

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."

  if [[ $CARCH == 'aarch64' ]]; then

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END

  else

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
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
END

  else

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

  fi

  # cat >>.mozconfig <<END
  # ac_add_options --enable-linker=lld
  # ac_add_options --disable-bootstrap
  # END

  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-"$pkgver"
  DESTDIR="$pkgdir" ./mach install

  rm "$pkgdir"/usr/lib/${__pkgname}/pingsender

  install -Dvm644 "$srcdir/settings/$__pkgname.psd" "$pkgdir/usr/share/psd/browsers/$__pkgname"

  local vendorjs
  vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in firedragon.cfg
// pref("extensions.autoDisableScopes", 11);
END

  # cd ${srcdir}/settings
  # git checkout ${_settings_commit}
  cd ${srcdir}/firefox-"$pkgver"
  cp -r ${srcdir}/settings/* ${pkgdir}/usr/lib/${__pkgname}/

  local distini="$pkgdir/usr/lib/$__pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=garudalinux
version=1.0
about=$_pkgname for Garuda Linux

[Preferences]
app.distributor=garudalinux
app.distributor.channel=$__pkgname
app.partner.garudalinux=garudalinux
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${__pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$__pkgname.png"
  done
  install -Dvm644 browser/branding/${__pkgname}/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$__pkgname.png"

  # Arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${__pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$__pkgname-symbolic.png"

  install -Dvm644 ../$__pkgname.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$__pkgname" <<END
#!/bin/sh
exec /usr/lib/$__pkgname/$__pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$__pkgname" "$pkgdir/usr/lib/$__pkgname/$__pkgname-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$__pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  # Make native messaging work
  ln -s "/usr/lib/mozilla/native-messaging-hosts" "$pkgdir/usr/lib/firedragon/native-messaging-hosts"

  # Delete unneeded things from settings repo
  rm "$pkgdir/usr/lib/firedragon/LICENSE.txt"
  rm "$pkgdir/usr/lib/firedragon/about.png"
  rm "$pkgdir/usr/lib/firedragon/firedragon.psd"
  rm "$pkgdir/usr/lib/firedragon/home.png"
  rm "$pkgdir/usr/lib/firedragon/package.json"
  rm "$pkgdir/usr/lib/firedragon/tabliss.json"
  rm "$pkgdir/usr/lib/firedragon/yarn.lock"
}
