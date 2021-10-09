# Maintainer: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf
_pkgname=LibreWolf
pkgver=93.0
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python-setuptools python-psutil python-zstandard git binutils lld dump_syms)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(!emptydirs !makeflags !strip)
_arch_git=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/firefox/trunk
_common_tag="v${pkgver}-${pkgrel}"
_settings_tag='2.1'
install='librewolf.install'
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        $pkgname.desktop
        "git+https://gitlab.com/${pkgname}-community/browser/common.git#tag=${_common_tag}"
        "git+https://gitlab.com/${pkgname}-community/settings.git#tag=${_settings_tag}")
source_aarch64=("${pkgver}-${pkgrel}_build-arm-libopus.patch::https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/extra/firefox/build-arm-libopus.patch")
sha256sums=('a78f080f5849bc284b84299f3540934a12e961a7ea368b592ae6576ea1f97102'
            '0b28ba4cc2538b7756cb38945230af52e8c4659b2006262da6f3352345a8bed2'
            'SKIP'
            'SKIP')
sha256sums_aarch64=('2d4d91f7e35d0860225084e37ec320ca6cae669f6c9c8fe7735cdbd542e3a7c9')

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  local _patches_dir="${srcdir}/common/patches"

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

# This supposedly speeds up compilation (We test through dogfooding anyway)
ac_add_options --disable-tests
ac_add_options --disable-debug

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-rust-simd
export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${pkgname}
ac_add_options --with-distribution-id=io.gitlab.${pkgname}-community
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests

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
  patch -Np1 -i ../${pkgver}-${pkgrel}_build-arm-libopus.patch

else

  cat >>../mozconfig <<END
# probably not needed, enabled by default?
ac_add_options --enable-optimize
END
fi

  # Remove some pre-installed addons that might be questionable
  patch -Np1 -i ${_patches_dir}/remove_addons.patch

  # Disable (some) megabar functionality
  # Adapted from https://github.com/WesleyBranton/userChrome.css-Customizations
  patch -Np1 -i ${_patches_dir}/megabar.patch

  # Debian patch to enable global menubar
  # disabled for the default build, as it seems to cause issues in some configurations
  # patch -Np1 -i ${_patches_dir}/unity-menubar.patch

  # Disabling Pocket
  patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

  # remove mozilla vpn ads
  patch -Np1 -i ${_patches_dir}/mozilla-vpn-ad.patch

  # Remove Internal Plugin Certificates
  # patch -Np1 -i ${_patches_dir}/sed-patches/remove-internal-plugin-certs.patch
  # => breaks profiled builds since 90.0, it seems

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
  patch -Np1 -i ${_patches_dir}/mozilla_dirs.patch

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
id=io.gitlab.${pkgname}-community
version=1.0
about=LibreWolf

[Preferences]
app.distributor="LibreWolf Community"
app.distributor.channel=$pkgname
app.partner.librewolf=$pkgname
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/librewolf/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/librewolf-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
