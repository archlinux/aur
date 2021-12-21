# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Vladislav Nepogodin (vnepogodin) <nepogodin.vlad@gmail.com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firedragon-hg
_pkgname=FireDragon
__pkgname=firedragon
pkgver=96.0a1.r668262
pkgrel=1
pkgdesc="Librewolf fork build using Nightly sources with custom branding, Proton UI rework & Fission enabled."
arch=(x86_64 x86_64_v3 aarch64)
backup=('usr/lib/firedragon/firedragon.cfg'
        'usr/lib/firedragon/distribution/policies.json')
license=(MPL GPL LGPL)
provides=(firedragon)
url="https://gitlab.com/dr460nf1r3/settings/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss-hg nspr-hg ttf-font libpulse
        libwebp libvpx libjpeg zlib icu libevent pipewire aom harfbuzz
        graphite dav1d xorg-server-xwayland)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb nasm
             rust ccache autoconf2.13 clang llvm jack gtk2 nodejs cbindgen wasi-sdk-git
             python-setuptools python-psutil python-zstandard git binutils lld dump_syms)
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
options=(!emptydirs !makeflags !strip)
_arch_git=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/firefox/trunk
_repo=https://hg.mozilla.org/mozilla-unified
install=$__pkgname.install
source=("hg+$_repo#revision=autoland"
        $__pkgname.desktop
        "git+https://gitlab.com/vnepogodin/librewolf-common.git"
        "git+https://gitlab.com/dr460nf1r3/common.git"
        "git+https://gitlab.com/dr460nf1r3/settings.git"
        "0001-Use-remoting-name-for-GDK-application-names.patch::${_arch_git}/0001-Use-remoting-name-for-GDK-application-names.patch")

sha512sums=('SKIP'
            '1688d8696f0a4451bc1211707362ca79d302ae0e8153be8326392b5617cb3944344e9d8fe17d0b1d5fe7df6d38fd44d4d33e3eb84e7b8763c37aeab4b2c26290'
            'SKIP'
            'SKIP'
            'SKIP'
            'ac726a159ddf93c010d06640a597f8b6513ba23cd2405174938e850a70692ff3e805df1f93c0f5987df06edbdb9702093004870676ebeb68dc37f55e1f305535')

pkgver() {
  cd mozilla-unified
  _pkgver=$(cat browser/config/version.txt)
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed 's/\+//g'
}

prepare() {
  if [[ ! -d mozbuild ]];then
      mkdir mozbuild
  fi
  cd mozilla-unified

  local _patches_dir="${srcdir}/librewolf-common/patches"
  local __patches_dir="${srcdir}/common/patches-hg"

  # Upstream Arch fix
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ${srcdir}/0001-Use-remoting-name-for-GDK-application-names.patch

  # Gentoo patches
  echo "---- Gentoo patches"
  patch -Np1 -i ${__patches_dir}/gentoo/0021-bmo-1516081-Disable-watchdog-during-PGO-builds.patch
  patch -Np1 -i ${__patches_dir}/gentoo/0029-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch

  # Use more system libs
  echo "---- Patching for system libs"
  patch -Np1 -i ${__patches_dir}/gentoo/0004-bmo-847568-Support-system-harfbuzz.patch
  patch -Np1 -i ${__patches_dir}/gentoo/0005-bmo-847568-Support-system-graphite2.patch
  patch -Np1 -i ${__patches_dir}/gentoo/0006-bmo-1559213-Support-system-av1.patch

  # Remove some pre-installed addons that might be questionable
  patch -Np1 -i ${_patches_dir}/remove_addons.patch

  # Disabling Pocket
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  # Remove mozilla vpn ads
  patch -Np1 -i ${_patches_dir}/mozilla-vpn-ad.patch

  # Remove Internal Plugin Certificates
  patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch

  # Allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  # Assorted patches
  patch -Np1 -i ${_patches_dir}/context-menu.patch
  patch -Np1 -i ${_patches_dir}/browser-confvars.patch
  patch -Np1 -i ${_patches_dir}/urlbarprovider-interventions.patch

  # Allow overriding the color scheme light/dark preference with RFP
  patch -Np1 -i ${_patches_dir}/allow_dark_preference_with_rfp.patch

  # Fix an URL in 'about' dialog
  patch -Np1 -i ${_patches_dir}/about-dialog.patch

  # Change some hardcoded directory strings that could lead to unnecessarily
  # created directories

  # patch -Np1 -i ${_patches_dir}/mozilla_dirs.patch
  
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
ac_add_options --with-wasi-sysroot=/opt/wasi-sdk/share/wasi-sysroot
export WASM_CC=/opt/wasi-sdk/bin/clang
export WASM_CXX=/opt/wasi-sdk/bin/clang++

# Branding
ac_add_options --allow-addon-sideload
ac_add_options --enable-update-channel=nightly
ac_add_options --with-app-basename='${_pkgname}'
ac_add_options --with-app-name=${__pkgname}
ac_add_options --with-branding=browser/branding/firedragon
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
export MOZ_APP_REMOTINGNAME=${__pkgname//-/}
export MOZ_REQUIRE_SIGNING=1
export STRIP_FLAGS="--strip-debug --strip-unneeded"

# System libraries
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --disable-bootstrap
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-debug-js-modules
ac_add_options --disable-debug-symbols
ac_add_options --disable-gpsd
ac_add_options --disable-ipdl-tests
ac_add_options --disable-necko-wifi
ac_add_options --disable-rust-tests
ac_add_options --disable-synth-speechd
ac_add_options --disable-tests
ac_add_options --disable-trace-logging
ac_add_options --disable-updater
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-pulseaudio
ac_add_options --enable-strip

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# Options for ci / weaker build systems
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

  rm -f ${srcdir}/common/source_files/mozconfig
  cp -r ${srcdir}/common/source_files/* ./
}

build() {
  cd mozilla-unified

  export MOZ_SOURCE_REPO="$_repo"
  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_USE_SYSTEM_PYTHON=1

  # LTO/PGO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  # CFLAGS="${CFLAGS/-fno-plt/}"
  # CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  # Do 3-tier PGO
#  echo "Building instrumented browser..."

if [[ $CARCH == 'aarch64' ]]; then

  cat >.mozconfig ../mozconfig - <<END
#ac_add_options --enable-profile-generate
END

else

  cat >.mozconfig ../mozconfig - <<END
#ac_add_options --enable-profile-generate=cross
END

fi

#  ./mach build

#  echo "Profiling instrumented browser..."
#  ./mach package
#  LLVM_PROFDATA=llvm-profdata \
#    JARLOG_FILE="$PWD/jarlog" \
#    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
#    ./mach python build/pgo/profileserver.py

#  stat -c "Profile data found (%s bytes)" merged.profdata
#  test -s merged.profdata

#  stat -c "Jar log found (%s bytes)" jarlog
#  test -s jarlog

#  echo "Removing instrumented browser..."
#  ./mach clobber

#  echo "Building optimized browser..."

if [[ $CARCH == 'aarch64' ]]; then

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
#ac_add_options --enable-profile-use
#ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
#ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
ac_add_options --enable-linker=lld
END

else

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
#ac_add_options --enable-profile-use=cross
#ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
#ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
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

  rm "$pkgdir"/usr/lib/${__pkgname}/pingsender
  install -Dvm644 "$srcdir/settings/$__pkgname.psd" "$pkgdir/usr/share/psd/browsers/firedragon"
  _vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in dragonwolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  cd ${srcdir}/mozilla-unified
  cp -r ${srcdir}/settings/* ${pkgdir}/usr/lib/${__pkgname}/

  _distini="$pkgdir/usr/lib/$__pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
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
    install -Dm644 browser/branding/${__pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$__pkgname.png"
  done
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$__pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dm644 browser/branding/${__pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$__pkgname-symbolic.png"

  install -Dm644 ../$__pkgname.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$__pkgname" <<END
#!/bin/sh
exec /usr/lib/$__pkgname/$__pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$__pkgname" \
    "$pkgdir/usr/lib/$__pkgname/$__pkgname-bin"

  # Delete unneeded things from settings repo
  rm "$pkgdir/usr/lib/firedragon/LICENSE.txt"
  rm "$pkgdir/usr/lib/firedragon/about.png"
  rm "$pkgdir/usr/lib/firedragon/firedragon.psd"
  rm "$pkgdir/usr/lib/firedragon/home.png"
  rm "$pkgdir/usr/lib/firedragon/tabliss.json"
}
