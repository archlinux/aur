# Maintainer: vnepogodin
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf-nightly
_pkgname="Librewolf Nightly"
pkgver=r635306.b898442a9527
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom. (nightly edition)"
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt mime-types dbus-glib
         ffmpeg nss ttf-font libpulse
         libvpx libjpeg zlib icu libevent libpipewire02)
makedepends=(unzip zip diffutils yasm mesa imake inetutils ccache
             rust mozilla-common xorg-server-xwayland xorg-server-xvfb
             autoconf2.13 mercurial clang llvm jack gtk2 nodejs cbindgen nasm
             python-setuptools python-psutil python-zstandard git binutils lld)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'libappindicator-gtk3: global menu support for gtk app'
            'appmenu-gtk-module: appmenu for gtk only'
            'plasma5-applets-window-appmenu: appmenu for plasma only')
options=(!emptydirs !makeflags !strip)
_linux_commit=e123b80f7df1ad9043435f345c426717ca323579
_repo=https://hg.mozilla.org/mozilla-unified
source_x86_64=("hg+$_repo#revision=autoland"
               $pkgname.desktop
               "git+https://gitlab.com/librewolf-community/browser/common.git"
               "git+https://gitlab.com/vnepogodin/librewolf-settings.git"
               "remove_addons.patch::https://gitlab.com/librewolf-community/browser/linux/-/raw/${_linux_commit}/remove_addons.patch"
               "context-menu.patch::https://gitlab.com/librewolf-community/browser/linux/-/raw/${_linux_commit}/context-menu.patch"
               0001-Use-remoting-name-for-GDK-application-names.patch)
source_aarch64=("hg+$_repo#revision=autoland"
                $pkgname.desktop
                "git+https://gitlab.com/librewolf-community/browser/common.git"
                "git+https://gitlab.com/vnepogodin/librewolf-settings.git"
                "remove_addons.patch::https://gitlab.com/librewolf-community/browser/linux/-/raw/${_linux_commit}/remove_addons.patch"
                "context-menu.patch::https://gitlab.com/librewolf-community/browser/linux/-/raw/${_linux_commit}/context-menu.patch"
                "arm.patch::https://gitlab.com/librewolf-community/browser/linux/-/raw/${_linux_commit}/arm.patch"
                build-arm-libopus.patch
                0001-Use-remoting-name-for-GDK-application-names.patch)

sha512sums_x86_64=('SKIP'
                   '7fdfc23fbf637ef036f51b439e56a84fd12d7f50a894b7318d287da1584ed8be1958c1e403735e9edab8888699f3a68df5c69854d4b87187af1c76734644e44e'
                   'SKIP'
                   'SKIP'
                   '8a8ae3276914cd8812feb99acac8c2363f5530656593bebaed5cf67defec19153c30409b6fba418162c7e7f2876554202bbcf5f356d7e785488859879161d921'
                   'a4274739be161710d90fdb674315ef4b0696ce6e092641a62f7a18c5a773de959a38fe52e0c8683821753a99e4337ea3e448579937d684e22345f7d936161061'
                   'afb4a230b3e87cfb71687b3fe375c78463e02a6f7b1daa15bf6127f6414c6c29bf2d8df372b59b4df7f90fc8929582e8aab4e3db5e8b54b1817c96aad00d92ea')
sha512sums_aarch64=('SKIP'
                    '7fdfc23fbf637ef036f51b439e56a84fd12d7f50a894b7318d287da1584ed8be1958c1e403735e9edab8888699f3a68df5c69854d4b87187af1c76734644e44e'
                    'SKIP'
                    'SKIP'
                    '8a8ae3276914cd8812feb99acac8c2363f5530656593bebaed5cf67defec19153c30409b6fba418162c7e7f2876554202bbcf5f356d7e785488859879161d921'
                    'a4274739be161710d90fdb674315ef4b0696ce6e092641a62f7a18c5a773de959a38fe52e0c8683821753a99e4337ea3e448579937d684e22345f7d936161061'
                    '179d922764a959c3eccd1ff98e16c629516d04c9a3a8fe6d199f8de88ad7163a026e4415836728a01a89703f1f31247addcead2da2b341b1849e4627a742c5b9'
                    '6d464cce32cb2e440fb137666aeefec1240bcbdfdef0e8633e0fbe22e2214446b2c992ee2c8716c682a42fcd1d66d9fdf1d6d5b40f8ec3b0eeec5ca9e3f1aa35'
                    'afb4a230b3e87cfb71687b3fe375c78463e02a6f7b1daa15bf6127f6414c6c29bf2d8df372b59b4df7f90fc8929582e8aab4e3db5e8b54b1817c96aad00d92ea')

pkgver() {
  cd mozilla-unified
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  if [[ ! -d mozbuild ]];then
      mkdir mozbuild
  fi
  cd mozilla-unified

  #
  # If you want to disable LTO/PGO (compile too long), delete the lines below beginning with
  # `ac_add_options --enable-lto' and ending with 'export RANLIB=llvm-ranlib`
  #

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
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-update-channel=nightly
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename='${_pkgname}'
ac_add_options --with-branding=browser/branding/librewolf
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=0
export MOZ_APP_REMOTINGNAME=${pkgname//-/}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
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
  patch -p1 -i ../arm.patch
  patch -p1 -i ../build-arm-libopus.patch

else

  cat >>../mozconfig <<END
# probably not needed, enabled by default?
ac_add_options --enable-optimize
END
fi

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  # Remove some pre-installed addons that might be questionable
  patch -p1 -i ../remove_addons.patch

  # To enable global menubar
  # Set these to true
  # browser.proton.enabled
  # browser.proton.appmenu.enabled

  # Disabling Pocket
  sed -i "s/'pocket'/#'pocket'/g" browser/components/moz.build

  patch -p1 -i ../context-menu.patch

  # this one only to remove an annoying error message:
  sed -i 's#SaveToPocket.init();#// SaveToPocket.init();#g' browser/components/BrowserGlue.jsm

  # Remove Internal Plugin Certificates
  _cert_sed='s#if (aCert.organizationalUnit == "Mozilla [[:alpha:]]\+") {\n'
  _cert_sed+='[[:blank:]]\+return AddonManager\.SIGNEDSTATE_[[:upper:]]\+;\n'
  _cert_sed+='[[:blank:]]\+}#'
  _cert_sed+='// NOTE: removed#g'
  sed -z "$_cert_sed" -i toolkit/mozapps/extensions/internal/XPIInstall.jsm

  # allow SearchEngines option in non-ESR builds
  sed -i 's#"enterprise_only": true,#"enterprise_only": false,#g' browser/components/enterprisepolicies/schemas/policies-schema.json

  _settings_services_sed='s#firefox.settings.services.mozilla.com#f.s.s.m.c.qjz9zk#g'

  # stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  sed "$_settings_services_sed" -i browser/components/newtab/data/content/activity-stream.bundle.js
  sed "$_settings_services_sed" -i modules/libpref/init/all.js
  sed "$_settings_services_sed" -i services/settings/Utils.jsm
  sed "$_settings_services_sed" -i toolkit/components/search/SearchUtils.jsm

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

  if [[ ! -s merged.profdata ]]; then
    echo "No profile data produced."
    return 1
  fi

  if [[ ! -s jarlog ]]; then
    echo "No jar log produced."
    return 1
  fi

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
END

fi

  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd mozilla-unified
  DESTDIR="$pkgdir" ./mach install
  mv "$pkgdir"/usr/lib/${pkgname}/{$pkgname,librewolf}

  _vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

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
  cp -r ${srcdir}/librewolf-settings/* ${pkgdir}/usr/lib/${pkgname}/

  _distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=$_pkgname for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/librewolf/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/librewolf.png"
  done
  install -Dm644 browser/branding/librewolf/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/librewolf.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dm644 browser/branding/librewolf/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/librewolf-symbolic.png"

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/librewolf-bin"
}
