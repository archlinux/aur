# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: torvic9 AT mailbox DOT org
# Contributor: lsf

pkgname=firedragon
_pkgname=FireDragon
pkgver=90.0.2
pkgrel=1
pkgdesc="Librewolf fork build using custom branding, settings & KDE patches by OpenSUSE"
arch=(x86_64 aarch64)
backup=('usr/lib/firedragon/firedragon.cfg'
        'usr/lib/firedragon/distribution/policies.json')
license=(MPL GPL LGPL)
url="https://gitlab.com/dr460nf1r3/settings/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss nspr ttf-font libpulse
        libwebp libvpx libjpeg zlib icu libevent libpipewire02 aom harfbuzz 
        graphite dav1d kfiredragonhelper)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             rust ccache autoconf2.13 clang llvm jack nodejs cbindgen nasm
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
conflicts=('firedragon-hg')
install=$pkgname.install
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        "git+https://gitlab.com/dr460nf1r3/common.git"
        "git+https://gitlab.com/dr460nf1r3/settings.git")

sha256sums=('35c45dbc21a7bd59e5daa6b3fef7a08c51ff0a1333f47a355bb1cbc840c3ff59'
            '158152bdb9ef6a83bad62ae03a3d9bc8ae693b34926e53cc8c4de07df20ab22d'
            'SKIP'
            'SKIP')

prepare() {
  if [[ ! -d mozbuild ]];then
      mkdir mozbuild
  fi
  cd firefox-$pkgver

  local _patches_dir="${srcdir}/common/patches"

  sed -i 's/\"BrowserApplication\"\, \"firefox\"/\"BrowserApplication\"\, \"firedragon\"/g' ${_patches_dir}/kde/firefox-kde.patch
  sed -i 's/kmozillahelper/kfiredragonhelper/g' ${_patches_dir}/kde/mozilla-kde.patch
  
  # Arch patches
  echo "---- Arch patches"
  patch -Np1 -i ${_patches_dir}/arch/0001-Use-remoting-name-for-GDK-application-names.patch

  # KDE patches (W. Rosenauer)
  echo "---- Patching for KDE"
  patch -Np1 -i ${_patches_dir}/kde/mozilla-nongnome-proxies.patch
  patch -Np1 -i ${_patches_dir}/kde/mozilla-kde.patch
  #patch -Np1 -i ${_patches_dir}/kde/firefox-kde.patch Currently broken with PGO
  
  # Ubuntu patches
  echo "---- Misc patches"
  patch -Np1 -i ${_patches_dir}/misc/fix-hidden-buttons-with-csd-menubar.patch
  
  # Rust
  patch -Np1 -i ${_patches_dir}/misc/reduce-rust-debuginfo.patch

  # Gentoo patches
  echo "---- Gentoo patches"
  patch -Np1 -i ${_patches_dir}/gentoo/0021-bmo-1516081-Disable-watchdog-during-PGO-builds.patch
  patch -Np1 -i ${_patches_dir}/gentoo/0029-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch

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

  # Disabling Pocket
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  # Remove Mozilla VPN ads
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-vpn-ad.patch

  # Allow overriding the color scheme light/dark preference with RFP
  patch -Np1 -i ${_patches_dir}/librewolf/allow_dark_preference_with_rfp.patch  

  # Remove Internal Plugin Certificates
  # => breaks profiled builds since 90.0, it seems
  # patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch

  # Allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
ac_add_options --with-ccache
export CC='clang'
export CXX='clang++'
export RANLIB=llvm-ranlib
export STRIP=llvm-strip
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY='/usr/bin/llvm-objcopy'

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename='${_pkgname}'
ac_add_options --with-branding=browser/branding/firedragon
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

#export STRIP_FLAGS="--strip-debug --strip-unneeded"

# System libraries
#ac_add_options --disable-libproxy
ac_add_options --enable-system-pixman
ac_add_options --with-system-av1
ac_add_options --with-system-ffi
ac_add_options --with-system-graphite2
ac_add_options --with-system-harfbuzz
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --disable-crashreporter
#ac_add_options --disable-debug
#ac_add_options --disable-debug-js-modules
#ac_add_options --disable-debug-symbols
ac_add_options --disable-gpsd
#ac_add_options --disable-ipdl-tests
#ac_add_options --disable-necko-wifi
#ac_add_options --disable-rust-tests
#ac_add_options --disable-synth-speechd
ac_add_options --disable-tests
#ac_add_options --disable-trace-logging
ac_add_options --disable-updater
#ac_add_options --disable-warnings-as-errors
#ac_add_options --disable-webspeech
#ac_add_options --disable-webspeechtestbackend
ac_add_options --enable-alsa
ac_add_options --enable-jack
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

if [[ $CARCH == 'aarch64' ]]; then
  cat >>../mozconfig <<END
# taken from manjaro build:
ac_add_options --enable-optimize="-g0 -O2"
# from ALARM
# ac_add_options --disable-webrtc

END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0"

  # we should have more than enough RAM on the CI spot instances.
  # ...or maybe not?
  export LDFLAGS+=" -Wl,--no-keep-memory"
  patch -Np1 -i ${_patches_dir}/librewolf/arm.patch
  patch -Np1 -i ${_patches_dir}/arch/build-arm-libopus.patch

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
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_USE_SYSTEM_PYTHON=1

  # LTO needs more open files
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
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

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
