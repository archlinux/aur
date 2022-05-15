# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: torvic9 AT mailbox DOT org
# Contributor: lsf

pkgname=firedragon
_pkgname=FireDragon
pkgver=100.0
pkgrel=3
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
             python-setuptools python-zstandard git binutils
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
options=(!emptydirs !makeflags !strip !lto !debug)
conflicts=('firedragon-hg')
install=$pkgname.install
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        "git+https://gitlab.com/dr460nf1r3/common.git"
        "git+https://gitlab.com/dr460nf1r3/settings.git")

sha256sums=('664c0cc4e0fb70886aa4e652d144996045d533a18eebc7d61093103cbb2d5e7f'
            '158152bdb9ef6a83bad62ae03a3d9bc8ae693b34926e53cc8c4de07df20ab22d'
            'SKIP'
            'SKIP')

prepare() {
  if [[ ! -d mozbuild ]]; then
      mkdir mozbuild
  fi
  cd firefox-$pkgver

  local _patches_dir
  _patches_dir="${srcdir}/common/patches"

  # Prepare patches, then return to the source directory
  cd ${_patches_dir} && sh ${srcdir}/common/rebrand.sh
  cd $srcdir/firefox-$pkgver

  # Ubuntu patches
  echo "---- Misc patches"
  patch -Np1 -i ${_patches_dir}/misc/fix-hidden-buttons-with-csd-menubar.patch
  
  # Rust
  patch -Np1 -i ${_patches_dir}/misc/reduce-rust-debuginfo.patch

  # Gentoo patches
  echo "---- Gentoo patches"
  patch -Np1 -i ${_patches_dir}/gentoo/0001-Don-t-use-build-id.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0002-Fortify-sources-properly.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0003-Check-additional-plugins-dir.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0004-bmo-847568-Support-system-harfbuzz.patch
  #patch -Np1 -i ${_patches_dir}/gentoo/0005-bmo-847568-Support-system-graphite2.patch
  #patch -Np1 -i ${_patches_dir}/gentoo/0006-bmo-1559213-Support-system-av1.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0007-bmo-878089-Don-t-fail-when-TERM-is-not-set.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0008-bmo-1516803-Fix-building-sandbox.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0017-Make-PGO-use-toolchain.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0018-bmo-1516081-Disable-watchdog-during-PGO-builds.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0019-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0020-Fix-building-with-PGO-when-using-GCC.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0021-libaom-Use-NEON_FLAGS-instead-of-VPX_ASFLAGS-for-lib.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0022-build-Disable-Werror.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0023-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0024-Disable-FFVPX-with-VA-API.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0025-Enable-FLAC-on-platforms-without-ffvpx-via-ffmpeg.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0026-bmo-1670333-OpenH264-Fix-decoding-if-it-starts-on-no.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0027-bmo-1663844-OpenH264-Allow-using-OpenH264-GMP-decode.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0028-bgo-816975-fix-build-on-x86.patch
  #patch -Np1 -i ${_patches_dir}/gentoo/0029-bmo-1559213-fix-system-av1-libs.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0030-bmo-1196777-Set-GDK_FOCUS_CHANGE_MASK.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0031-bmo-1762050-fix-pgo-with-virtualenv.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0032-bmo-1765361-resolve_objdir_from_virtualenv_if_mozinfo_not_ancestor.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0033-bmo-1761691-fix_audio_thread_priority_when_dbus_is_disabled.patch

  # Remove some pre-installed addons that might be questionable
  echo "---- Librewolf patches"
  patch -Np1 -i ${_patches_dir}/librewolf/remove_addons.patch

  # somewhat experimental patch to fix bus/dbus/remoting names to io.gitlab.librewolf
  # should not break things, buuuuuuuuuut we'll see.
  patch -Np1 -i ${_patches_dir}/librewolf/dbus_name.patch

  # add custom uBO assets (on first launch only)
  patch -Np1 -i ${_patches_dir}/librewolf/custom-ubo-assets-bootstrap-location.patch

  # Debian patch to enable global menubar
  patch -Np1 -i ${_patches_dir}/librewolf/unity-menubar.patch

  # custom patch that does not conflict with the unity patch
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-kde_after_unity.patch

  # Remove Mozilla VPN ads
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-vpn-ad2.patch

  # Allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  echo "---- Librewolf patches - UI"
  # Remove references to Firefox from the settings UI, change text in some of the links,
  # explain that we force en-US and suggest enabling history near the session restore checkbox.
  patch -Np1 -i ${_patches_dir}/librewolf-ui/pref-naming.patch

  # Privacy preferences
  patch -Np1 -i ${_patches_dir}/librewolf-ui/privacy-preferences.patch

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
  patch -Np1 -i ${_patches_dir}/librewolf-ui/hide-default-browser.patch

  # Misc
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remap-links.patch
  patch -Np1 -i ${_patches_dir}/librewolf/native-messaging-registry-path.patch

  # Pref pane - custom FireDragon svg
  patch -Np1 -i ${_patches_dir}/librewolf/librewolf-pref-pane.patch
  patch -Np1 -i ${_patches_dir}/misc/add_firedragon_svg.patch
  patch -Np1 -i ${_patches_dir}/librewolf-ui/website-appearance-ui-rfp.patch

  # fix telemetry removal, see https://gitlab.com/librewolf-community/browser/linux/-/merge_requests/17, for example
  patch -Np1 -i ${_patches_dir}/librewolf/disable-data-reporting-at-compile-time.patch

  echo "---- Fixing build issues"
  # Needed patch to have build working
  patch -Np1 -i ${_patches_dir}/misc/fix-wayland.patch

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
#export NM=llvm-nm
#export OBJCOPY='/usr/bin/llvm-objcopy'
#export RANLIB=llvm-ranlib
#export STRIP=llvm-strip

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
#mk_add_options MOZ_CRASHREPORTER=0 supposed to be obsolete
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
  export BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

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
