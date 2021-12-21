# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: torvic9 AT mailbox DOT org
# Contributor: lsf

pkgname=firedragon
_pkgname=FireDragon
pkgver=95.0.2
pkgrel=2
pkgdesc="Librewolf fork build using custom branding, settings & KDE patches by OpenSUSE"
arch=(x86_64 x86_64_v3)
backup=('usr/lib/firedragon/firedragon.cfg'
        'usr/lib/firedragon/distribution/policies.json')
license=(MPL GPL LGPL)
url="https://gitlab.com/dr460nf1r3/settings/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse
         aom harfbuzz libvpx libjpeg zlib icu libevent pipewire
         kfiredragonhelper)
makedepends=(unzip zip diffutils yasm mesa imake inetutils
             rust xorg-server-xwayland xorg-server-xvfb ccache
             autoconf2.13 clang llvm jack nodejs cbindgen nasm
             python-setuptools python-psutil python-zstandard git binutils
             lld dump_syms wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
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
options=(!emptydirs !makeflags !strip !lto)
conflicts=('firedragon-hg')
install=$pkgname.install
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        "git+https://gitlab.com/dr460nf1r3/common.git"
        "git+https://gitlab.com/dr460nf1r3/settings.git")

sha256sums=('c178cbf61979bd39a8daa9a09c6e03089da37baded692ad1f745ecfcaae74d64'
            '158152bdb9ef6a83bad62ae03a3d9bc8ae693b34926e53cc8c4de07df20ab22d'
            'SKIP'
            'SKIP')

prepare() {
  if [[ ! -d mozbuild ]];then
      mkdir mozbuild
  fi
  cd firefox-$pkgver

  local _patches_dir="${srcdir}/common/patches"

  # Prepare KDE patch
  sed -i 's/kmozillahelper/kfiredragonhelper/g' ${_patches_dir}/kde/mozilla-kde.patch
  
  # Arch patches
  echo "---- Arch patches"
  patch -Np1 -i ${_patches_dir}/arch/0001-Use-remoting-name-for-GDK-application-names.patch

  # KDE patches (W. Rosenauer)
  echo "---- Patching for KDE"
  patch -Np1 -i ${_patches_dir}/kde/mozilla-nongnome-proxies.patch
  patch -Np1 -i ${_patches_dir}/kde/mozilla-kde.patch
  
  # Ubuntu patches
  echo "---- Misc patches"
  patch -Np1 -i ${_patches_dir}/misc/fix-hidden-buttons-with-csd-menubar.patch
  
  # Rust
  patch -Np1 -i ${_patches_dir}/misc/reduce-rust-debuginfo.patch

  # Gentoo patches
  echo "---- Gentoo patches"
  patch -Np1 -i ${_patches_dir}/gentoo/0021-bmo-1516081-Disable-watchdog-during-PGO-builds.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0026-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0002-Fortify-sources-properly.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0008-bmo-878089-Don-t-fail-when-TERM-is-not-set.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0022-bmo-1196777-Set-GDK_FOCUS_CHANGE_MASK.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0027-Make-elfhack-use-toolchain.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0029-Enable-FLAC-on-platforms-without-ffvpx-via-ffmpeg.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0030-bmo-1670333-OpenH264-Fix-decoding-if-it-starts-on-no.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0031-bmo-1663844-OpenH264-Allow-using-OpenH264-GMP-decode.patch
  # Use more system libs
  echo "---- Patching for system libs"
  patch -Np1 -i ${_patches_dir}/gentoo/0004-bmo-847568-Support-system-harfbuzz.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0005-bmo-847568-Support-system-graphite2.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0006-bmo-1559213-Support-system-av1.patch

  # Remove some pre-installed addons that might be questionable
  echo "---- Librewolf patches"
  patch -Np1 -i ${_patches_dir}/librewolf/remove_addons.patch

  # Disable (some) megabar functionality
  # Adapted from https://github.com/WesleyBranton/userChrome.css-Customizations
  patch -Np1 -i ${_patches_dir}/librewolf/megabar.patch

  # Debian patch to enable global menubar
  patch -Np1 -i ${_patches_dir}/librewolf/unity-menubar.patch

  # Remove Mozilla VPN ads
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-vpn-ad.patch

  # Allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  echo "---- Librewolf patches - UI"
  # Show a warning saying that changing language is not allowed through the UI,
  # and that it requires to visit our FAQ, instead of telling the user to check his connection.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/add-language-warning.patch

  # Remove references to Firefox from the settings UI, change text in some of the links,
  # explain that we force en-US and suggest enabling history near the session restore checkbox.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/pref-naming.patch

  # Remove Firefox references in the urlbar, when suggesting opened tabs.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-branding-urlbar.patch

  # Remove cfr UI elements, as they are disabled and locked already.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-cfrprefs.patch

  # Do not display your browser is being managed by your organization in the settings.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-organization-policy-banner.patch

  # Hide "snippets" section from the home page settings, as it was already locked.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-snippets-from-home.patch

  # Add warning that sanitizing exceptions are bypassed by the options in History > Clear History when LibreWolf closes > Settings
  patch -Np1 -i ${_patches_dir}/librewolf-ui/sanitizing-description.patch

  echo "---- Fixing build with Wayland"
  # Needed patch to have build working
  patch -Np1 -i ${_patches_dir}/misc/fix-wayland.patch
  patch -Np1 -i ${_patches_dir}/misc/fix-wl_proxy_marshal_flags.patch

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --prefix=/usr
ac_add_options --with-ccache
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
export CC='clang'
export CXX='clang++'
export NM=llvm-nm
export OBJCOPY='/usr/bin/llvm-objcopy'
export RANLIB=llvm-ranlib
export STRIP=llvm-strip

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${pkgname}
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=${pkgname}

# System libraries
#ac_add_options --with-system-av1
#ac_add_options --with-system-graphite2
ac_add_options --with-system-harfbuzz
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-zlib

# Features
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
ac_add_options --enable-optimize
ac_add_options --enable-pulseaudio
ac_add_options --enable-strip

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# options for ci / weaker build systems
# mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold
END

  rm -f ${srcdir}/common/source_files/mozconfig
  cp -r ${srcdir}/common/source_files/* ./
}


build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_USE_SYSTEM_PYTHON=1

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
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

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
END

  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install
  rm "$pkgdir"/usr/lib/${pkgname}/pingsender

  install -Dvm644 "$srcdir/settings/$pkgname.psd" "$pkgdir/usr/share/psd/browsers/$pkgname"
  
  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  # cd ${srcdir}/settings
  # git checkout ${_settings_commit}
  cd ${srcdir}/firefox-$pkgver
  cp -r ${srcdir}/settings/* ${pkgdir}/usr/lib/${pkgname}/

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=garudalinux
version=1.0
about=$_pkgname for Garuda Linux

[Preferences]
app.distributor=garudalinux
app.distributor.channel=$pkgname
app.partner.garudalinux=garudalinux
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/${pkgname}/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  # Arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/$pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
  
  # Delete unneeded things from settings repo
  rm "$pkgdir/usr/lib/firedragon/LICENSE.txt"
  rm "$pkgdir/usr/lib/firedragon/about.png"
  rm "$pkgdir/usr/lib/firedragon/firedragon.psd"
  rm "$pkgdir/usr/lib/firedragon/home.png"
  rm "$pkgdir/usr/lib/firedragon/tabliss.json"
}
