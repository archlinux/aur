# Maintainer: Vladislav Nepogodin (vnepogodin) <nepogodin.vlad@gmail.com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf-hg
_pkgname=librewolf-nightly
__pkgname="Librewolf Nightly"
pkgver=92.0a1.r655136.a8a4dfcadce5
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom. (nightly edition)"
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt mime-types dbus-glib
         ffmpeg nss-hg ttf-font libpulse
         libvpx libjpeg zlib icu libevent pipewire)
makedepends=(unzip zip diffutils yasm mesa imake inetutils ccache
             rust xorg-server-xwayland xorg-server-xvfb
             autoconf2.13 mercurial clang llvm jack nodejs cbindgen nasm
             python-setuptools python-psutil python-zstandard git binutils lld dump_syms)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland'
            'libappindicator-gtk3: Global menu support for GTK apps'
            'appmenu-gtk-module: Appmenu for GTK only'
            'plasma5-applets-window-appmenu: Appmenu for Plasma only')
backup=('usr/lib/librewolf-nightly/librewolf.cfg'
        'usr/lib/librewolf-nightly/distribution/policies.json')
options=(!emptydirs !makeflags !strip)
_repo=https://hg.mozilla.org/mozilla-unified
install=librewolf-nightly.install
source=("hg+$_repo#revision=autoland"
        $_pkgname.desktop
        "git+https://gitlab.com/vnepogodin/librewolf-common.git"
        "git+https://gitlab.com/vnepogodin/librewolf-settings.git")
sha512sums=('SKIP'
            '5a0932eeceba04a09133a7b61e9eee49cd5bdacb2daadc132e910fdd3ef8392262208b6401043655bff58068b2320022daa6722f11aed9284c5b5a008d570bcd'
            'SKIP'
            'SKIP')

pkgver() {
  cd mozilla-unified
  _pkgver=$(cat browser/config/version.txt)
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed 's/\+//g'
}

prepare() {
  mkdir -p mozbuild
  cd mozilla-unified

  local _patches_dir="${srcdir}/librewolf-common/patches"

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

# Branding
ac_add_options --enable-update-channel=nightly
ac_add_options --with-app-name=${_pkgname}
ac_add_options --with-app-basename=Librewolf
ac_add_options --with-branding=browser/branding/${_pkgname}
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}

export STRIP_FLAGS="--strip-debug --strip-unneeded"

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
ac_add_options --enable-strip
ac_add_options --disable-gpsd
ac_add_options --disable-synth-speechd
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --disable-trace-logging
ac_add_options --disable-rust-tests
ac_add_options --disable-ipdl-tests
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
  patch -Np1 -i ${_patches_dir}/arm.patch
  patch -Np1 -i ${_patches_dir}/build-arm-libopus.patch

else

  cat >>../mozconfig <<END
# probably not needed, enabled by default?
ac_add_options --enable-optimize
END
fi

  # Remove some pre-installed addons that might be questionable
  patch -Np1 -i ${_patches_dir}/remove_addons.patch

  # Disabling Pocket
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  # remove mozilla vpn ads
  patch -Np1 -i ${_patches_dir}/mozilla-vpn-ad.patch

  # Remove Internal Plugin Certificates
  patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch

  # allow SearchEngines option in non-ESR builds
  patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

  # remove search extensions (experimental)
  patch -Np1 -i ${_patches_dir}/search-config.patch

  # stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
  patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

  # Assorted patches
  patch -Np1 -i ${_patches_dir}/context-menu.patch
  patch -Np1 -i ${_patches_dir}/browser-confvars.patch
  patch -Np1 -i ${_patches_dir}/urlbarprovider-interventions.patch

  # allow overriding the color scheme light/dark preference with RFP
  patch -Np1 -i ${_patches_dir}/allow_dark_preference_with_rfp.patch

  # fix an URL in 'about' dialog
  patch -Np1 -i ${_patches_dir}/about-dialog.patch

  # change some hardcoded directory strings that could lead to unnecessarily
  # created directories

  # patch -Np1 -i ${_patches_dir}/mozilla_dirs.patch

  rm -f ${srcdir}/librewolf-common/source_files/mozconfig
  cp -r ${srcdir}/librewolf-common/source_files/* ./
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

  install -Dm644 "$srcdir/librewolf-settings/$_pkgname.psd" "$pkgdir/usr/share/psd/browsers/$_pkgname"

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
  cp -r ${srcdir}/librewolf-settings/* ${pkgdir}/usr/lib/${_pkgname}/

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
  install -Dm644 browser/branding/${_pkgname}/content/about-logo.png \
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
