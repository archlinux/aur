# Maintainer: Vladislav Nepogodin (vnepogodin) <vnepogodin@cachyos.org>
# Contributor: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=cachy-browser
_pkgname=Cachy
__pkgname=cachy
pkgver=101.0.1
pkgrel=4.1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 x86_64_v3)
license=(MPL GPL LGPL)
url="https://cachyos.org"
depends=(gtk3 libxt mime-types dbus-glib
         ffmpeg nss ttf-font libpulse
         aom harfbuzz graphite
         libvpx libjpeg zlib icu libevent pipewire dav1d)
makedepends=(unzip zip diffutils yasm mesa imake inetutils
             rust xorg-server-xwayland xorg-server-xvfb
             autoconf2.13 clang llvm jack nodejs cbindgen nasm
             python-setuptools python-zstandard git binutils lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi mold python-pipenv)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
backup=('usr/lib/cachy-browser/cachy.cfg'
        'usr/lib/cachy-browser/distribution/policies.json')
groups=('cachyos')
options=(!emptydirs !makeflags !strip !lto !debug)
_arch_svn=https://git.archlinux.org/svntogit/packages.git/plain/trunk
# _common_tag="v90.0-1"
_common_tag="v${pkgver}-${pkgrel}"
_settings_tag='1.4'
install=cachy-browser.install
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        $pkgname.desktop
        "git+https://github.com/cachyos/cachyos-browser-settings.git"
        "git+https://github.com/cachyos/cachyos-browser-common.git")
sha256sums=('b4c76e8bdf81f473f3e56b2f69dbe5119bba5cab38e36ab0f3f38cf0cdc4a9c2'
            'SKIP'
            'c0786df2fd28409da59d0999083914a65e2097cda055c9c6c2a65825f156e29f'
            'SKIP'
            'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  local _patches_dir="${srcdir}/cachyos-browser-common/patches"

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-linker=mold
ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
export CC=clang
export CXX=clang++

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${__pkgname}
ac_add_options --with-distribution-id=cachyos.org
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}

# System libraries
ac_add_options --with-system-av1
# ac_add_options --with-system-graphite2
ac_add_options --with-system-harfbuzz
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-zlib

# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-crashreporter
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --enable-strip
ac_add_options --disable-gpsd
ac_add_options --disable-synth-speechd
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --disable-trace-logging
ac_add_options --disable-rust-tests
ac_add_options --disable-necko-wifi
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

# options for ci / weaker build systems
# mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold
END

  # Gentoo patches
  msg2 "---- Gentoo patches"

  for gentoo_patch in "${_patches_dir}/gentoo/"*; do
      local _patch_name="`basename "${gentoo_patch}"`"

      if [ ${_patch_name} != "0032-bmo-1773259-cbindgen-root_clip_chain-fix.patch" ]; then
        msg2 "Patching with ${_patch_name}.."
        patch -Np1 -i "${gentoo_patch}"
      fi
  done

  # address build failure when building with most recent (>=0.24.0) cbindgen
  # also catch systems (Manjaro, at the time of writing this) where cbindgen
  # is not yet at 24. probably not elegant, but it works.
  _cbindgen_ver=$(cbindgen --version | sed -e 's/cbindgen[[:space:]]0.\([0-9]*\).[0-9]/\1/g')
  if [ "${_cbindgen_ver}" -gt 23 ]; then
    patch -Np1 -i ${_patches_dir}/gentoo/0032-bmo-1773259-cbindgen-root_clip_chain-fix.patch
  fi

  msg2 "---- Librewolf patches"
  msg2 "Remove some pre-installed addons that might be questionable"
  patch -Np1 -i ${_patches_dir}/librewolf/remove_addons.patch

  # disabled for the default build, as it seems to cause issues in some configurations
  # 2022-01-21: re-enabled because it seems to not mess things up anymore nowadays?
  msg2 "Debian patch to enable global menubar"
  patch -Np1 -i ${_patches_dir}/librewolf/unity-menubar.patch

  # KDE patches (W. Rosenauer)
  msg2 "---- Patching for KDE"
#  patch -Np1 -i ${_patches_dir}/kde/mozilla-nongnome-proxies.patch
#  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-kde.patch
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla-kde_after_unity.patch
  msg2  "Disabling Pocket"
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  msg2 "remove mozilla vpn ads"
  patch -Np1 -i ${_patches_dir}/mozilla-vpn-ad2.patch


  # Remove Internal Plugin Certificates
  # patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch
  # => breaks profiled builds since 90.0, it seems

  msg2  "allow SearchEngines option in non-ESR builds"
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  #msg2  "remove search extensions (experimental)"
  #patch -Np1 -i ${_patches_dir}/search-config.patch
  #cp "${srcdir}/cachyos-browser-common/source_files/search-config.json" services/settings/dumps/main/search-config.json

  msg2  "stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)"
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch # fails with 100

  msg2 "Assorted patches"
  patch -Np1 -i ${_patches_dir}/librewolf/context-menu.patch
  patch -Np1 -i ${_patches_dir}/librewolf/urlbarprovider-interventions.patch
  patch -Np1 -i ${_patches_dir}/librewolf/native-messaging-registry-path.patch

  #msg2 "allow overriding the color scheme light/dark preference with RFP"
  #patch -Np1 -i ${_patches_dir}/allow_dark_preference_with_rfp.patch

  msg2 "fix an URL in 'about' dialog"
  patch -Np1 -i ${_patches_dir}/about-dialog.patch

  msg2 "change some hardcoded directory strings that could lead to unnecessarily created directories"
  patch -Np1 -i ${_patches_dir}/librewolf/mozilla_dirs.patch

  msg2 "change bus/dbus/remoting names to org.cachyos"
  patch -Np1 -i ${_patches_dir}/librewolf/dbus_name.patch

  msg2 "allow uBlockOrigin to run in private mode by default, without user intervention."
  patch -Np1 -i ${_patches_dir}/librewolf/allow-ubo-private-mode.patch

  msg2 "add custom uBO assets (on first launch only)"
  patch -Np1 -i ${_patches_dir}/librewolf/custom-ubo-assets-bootstrap-location.patch

  patch -Np1 -i ${_patches_dir}/librewolf/faster-package-multi-locale.patch
  # ui patches

  # Experimental
  #msg2 "Enable blur in searchbar"
  #patch -Np1 -i ${_patches_dir}/searchbar.patch

  # Explain that we force en-US and suggest enabling history near the session restore checkbox.
  msg2 "remove references to firefox from the settings UI, change text in some of the links"
  patch -Np1 -i ${_patches_dir}/librewolf-ui/pref-naming.patch

  #
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remap-links.patch
  patch -Np1 -i ${_patches_dir}/librewolf-ui/hide-default-browser.patch
  patch -Np1 -i ${_patches_dir}/librewolf-ui/privacy-preferences.patch

  msg2 "remove firefox references in the urlbar, when suggesting opened tabs."
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-branding-urlbar.patch

  msg2 "remove cfr UI elements, as they are disabled and locked already."
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-cfrprefs.patch

  msg2 "do not display your browser is being managed by your organization in the settings."
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-organization-policy-banner.patch

  msg2 "hide \"snippets\" section from the home page settings, as it was already locked."
  patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-snippets-from-home.patch

  msg2 "add warning that sanitizing exceptions are bypassed by the options in History > Clear History when LibreWolf closes > Settings"
  patch -Np1 -i ${_patches_dir}/librewolf-ui/sanitizing-description.patch

  msg2 "website-appearance-ui-rfp.patch"
  patch -Np1 -i ${_patches_dir}/librewolf-ui/website-appearance-ui-rfp.patch

  msg2 "lw-logo-devtools.patch"
  patch -Np1 -i ${_patches_dir}/librewolf-ui/lw-logo-devtools.patch

  patch -Np1 -i ${_patches_dir}/librewolf-ui/handlers.patch

  msg2 "customized pref panel"
  patch -Np1 -i ${_patches_dir}/librewolf/librewolf-pref-pane.patch

  msg2 "fix telemetry removal, see https://gitlab.com/librewolf-community/browser/linux/-/merge_requests/17, for example"
  patch -Np1 -i ${_patches_dir}/librewolf/disable-data-reporting-at-compile-time.patch

  msg2 "Hide passwordmgr"
  patch -Np1 -i ${_patches_dir}/librewolf/hide-passwordmgr.patch
  patch -Np1 -i ${_patches_dir}/fix-psutil-dev.patch
  patch -Np1 -i ${_patches_dir}/add-mold-linker.patch

  rm -f ${srcdir}/cachyos-browser-common/source_files/mozconfig
  cp -r ${srcdir}/cachyos-browser-common/source_files/browser ./
}


build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  #export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system
  export PIP_NETWORK_INSTALL_RESTRICTED_VIRTUALENVS=mach # let us hope this is a working _new_ workaround for the pip env issues?

  # LTO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  # CFLAGS="${CFLAGS/-fno-plt/}"
  # CXXFLAGS="${CXXFLAGS/-fno-plt/}"

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
ac_add_options --enable-linker=mold
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

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in cachy.cfg
// pref("extensions.autoDisableScopes", 11);
END

  # cd ${srcdir}/settings
  # git checkout ${_settings_commit}
  cd ${srcdir}/firefox-$pkgver
  cp -r ${srcdir}/cachyos-browser-settings/* ${pkgdir}/usr/lib/${pkgname}/

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=cachyos.org
version=1.0
about=Cachy Browser for CachyOS

[Preferences]
app.distributor=cachyos
app.distributor.channel=$pkgname
app.partner.cachyos=cachyos
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${__pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/${__pkgname}/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${__pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/cachy-browser "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/cachy-browser-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
