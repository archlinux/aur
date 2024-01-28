# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde
_pkgver=6.0.8
pkgver=G${_pkgver}
pkgrel=0
pkgdesc="Customizable privacy conscious web browser with better integration with KDE and primary support for webextensions"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'glibc' 'libpulse' 'nss' 'nspr')
makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang<16.0' 'llvm<16.0' 'alsa-lib' 'jack' 'cbindgen' 'nasm'
             'nodejs' 'lld' 'bc' 'python' 'pciutils' 'dump_syms'
             'wasi-compiler-rt' 'wasi-libc' 'wasi-libc++' 'wasi-libc++abi'
             'git')
replaces=("waterfox-g4-kpe" "waterfox-g3-kpe" "waterfox-g-kpe")
options=('!emptydirs' '!makeflags' 'zipman' '!lto')
_filesrev=b0d4bea673c0a249cc5bfa7a4d5907e76ffc0fe3
_filesurl=https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/$_filesrev/waterfox-kde
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=G$_pkgver"
        "waterfox.desktop::$_filesurl/waterfox.desktop"
        "distribution.ini::$_filesurl/distribution.ini"
        "vendor.js::$_filesurl/vendor.js"
        "waterfox.1::$_filesurl/waterfox.1"
        "syspref.js::$_filesurl/syspref.js"
        "waterfox.appdata.xml.in::$_filesurl/waterfox.appdata.xml.in"
        "g-kde.patch::$_filesurl/patches/g-kde.patch"
        "fis-csd-global-menu.patch::$_filesurl/patches/fis-csd-global-menu.patch"
        "nongnome-proxies.patch::$_filesurl/patches/nongnome-proxies.patch"
        "mozilla-ntlm-full-path.patch::$_filesurl/patches/mozilla-ntlm-full-path.patch"
        "libavcodec58_91.patch::$_filesurl/patches/libavcodec58_91.patch"
        "fix-langpack-id.patch::$_filesurl/patches/fix-langpack-id.patch"
        "fix-wayland-build.patch::$_filesurl/patches/fix-wayland-build.patch"
        "mach-depends.patch::$_filesurl/patches/mach-depends.patch"
        )
sha256sums=('SKIP'
            'ec32cbe949ed23bf7a61eef468a70a2e00e9fc448e4912c1200d110f5538d63a'
            '63cc269f591b2c6409cd7773f929bcb64f9acf3c9f5c1b8c1848c077056094fe'
            '5a3b4ebefbd9e5dd3abdc9e694ef4dadcce6fcc93f9352ee30f1fcb639a227f6'
            '405cc621d68ad61443ace33142b46c2f089f4a9f021b4ea62ec4183c9046d0f7'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            '26db702cd9c258548313d66f53722d7cadd206779e066d1fca5816256581e344'
            '9cebb1377a40b8776a7c913641911743a116abaddbff10ff2f9f8dff973bb73c'
            'e507f060ad30ebe61bc6fa9098b07df2802b53e3f77ca2d2ee5fe8e7aac7e9ae'
            '2ec980e1e912903ee6ec36589fc87cf528ca60be8abe37f8b30febb5e55e018c'
            'b4d25f9a3ea05f1ce7b7bb00f71821978e5db0f78634f80af684356608e708c0'
            'c10baed9fab17b0c39839df3970d9254b21b17c9b6a36f7c8523bac609d24d57'
            '0f9d1d22ec686639c31245fff7db837428e0880fd9ad698890ec81326be52ae0'
            '10714e2363c05bf611eec927807101a5babc94a0ab9b584ce8204a89d4f8b73a'
            '105fa659e4242c1b08bda0457bfddc28762bdd4a33e9bda05940ab38d26b334c')

prepare() {

  cd Waterfox

  # Add patches
  patch -Np1 -i ../g-kde.patch
  patch -Np1 -i ../fis-csd-global-menu.patch
  patch -Np1 -i ../nongnome-proxies.patch
  patch -Np1 -i ../mozilla-ntlm-full-path.patch
  patch -Np1 -i ../libavcodec58_91.patch
  patch -Np1 -i ../fix-langpack-id.patch
  patch -Np1 -i ../fix-wayland-build.patch
  patch -Np1 -i ../mach-depends.patch

  cat >../mozconfig <<END
ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

ac_add_options --prefix=/usr

# Libraries
ac_add_options --x-libraries=/usr/lib

# Disable unwanted features
ac_add_options --disable-updater
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-crashreporter
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --disable-tests

# Enable wanted features
ac_add_options --enable-unverified-updates
ac_add_options --enable-jxl
ac_add_options --enable-optimize
ac_add_options --enable-eme=widevine
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --allow-addon-sideload
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss


export MOZ_REQUIRE_SIGNING=
export MOZ_INCLUDE_SOURCE_INFO=1
export MOZ_APP_REMOTINGNAME=waterfox-g

X=$(($(nproc --all)/2))
mk_add_options MOZ_MAKE_FLAGS="-j\${X%.*}"
mk_add_options MOZ_PARALLEL_BUILD="\${X%.*}"
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj
END
}

build() {
  cd Waterfox

  # Optimize flags
  CFLAGS="${CFLAGS//-mtune=generic/-mtune=native}"
  CXXFLAGS="${CXXFLAGS//-mtune=generic/-mtune=native}"
  CFLAGS="${CFLAGS//-march=x86-64/-march=native}"
  CXXFLAGS="${CXXFLAGS//-march=x86-64/-march=native}"

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export LDFLAGS+=" -Wl,--no-keep-memory -Wl,--no-mmap-output-file"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export WF_VERSION="G$pkgver"
  echo "$WF_VERSION" > ./browser/config/version_display.txt

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
END
  ./mach build

#   # Build langpacks
#   cat > ../mozconfig_LANG <<END
# ac_add_options --with-app-name=waterfox
# ac_add_options --with-app-basename=Waterfox
# ac_add_options --with-branding=waterfox/browser/branding
# mk_add_options MOZ_OBJDIR=${PWD}/../obj_LANG
# ac_add_options --prefix=/usr
# ac_add_options --with-l10n-base=${PWD}/waterfox/browser/locales
# ac_add_options --enable-linker=lld
# ac_add_options --disable-updater
# ac_add_options --disable-bootstrap
# ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
# END

#   export JOBS=$(echo $(grep -c ^processor /proc/cpuinfo)\/2 | bc)
#   sed -r '/^(ja-JP-mac|en-US|)$/d;s/ .*$//' ../locales.shipped | cut -f1 -d":" \
#     | xargs -n 1 -P $JOBS -I {} /bin/sh -c '
#         locale=$1
#         cp ../mozconfig_LANG ${PWD}/mozconfig_$locale
#         sed -i "s|obj_LANG|obj_$locale|" ${PWD}/mozconfig_$locale
#         export MOZCONFIG=${PWD}/mozconfig_$locale
#         ./mach build config/nsinstall langpack-$locale
#         cp -L ../obj_$locale/dist/linux-*/xpi/waterfox-$WF_VERSION.$locale.langpack.xpi \
#             ${PWD}/langpack-$locale@l10n.waterfox.net.xpi
# ' -- {}
}

package_waterfox-kde() {
  optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech'
             'hunspell-en_US: Spell checking, American English'
             'kwaterfoxhelper: KDE Plasma Integration')
  provides=("waterfox-g=${_pkgver}" "waterfox=G${_pkgver}")

  cd Waterfox

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  for i in 16 22 24 32 48 64 128 256; do
      install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
      ln -Ts /usr/lib/waterfox/browser/chrome/icons/default/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox.png"
  done
  install -Dm644 waterfox/browser/branding/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox.png"
  install -Dm644 waterfox/browser/branding/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox.png"

  install -Dm644 $srcdir/waterfox.desktop \
    "$pkgdir/usr/share/applications/waterfox.desktop"

  install -Dm644 $srcdir/waterfox.1 \
    "$pkgdir/usr/share/man/man1/waterfox.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox/distribution/distribution.ini"

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/waterfox/browser/defaults/preferences/vendor.js"

  # Generate date and version for metadata file
  export TODAY_DATE=$(date +%Y-%m-%d)
  sed -i "s/__DATE__/$TODAY_DATE/g" ../waterfox.appdata.xml.in
  sed -i "s/__VERSION__/G$_pkgver/g" ../waterfox.appdata.xml.in

  install -Dm644 $srcdir/waterfox.appdata.xml.in \
    "$pkgdir/usr/share/metainfo/waterfox.appdata.xml"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox" <<END
#!/bin/sh
exec /usr/lib/waterfox/waterfox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox" \
    "$pkgdir/usr/lib/waterfox/waterfox-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox/"
  ln -Tsf /etc/waterfox/syspref.js "$pkgdir/usr/lib/waterfox/browser/defaults/preferences/syspref.js"

#   # Install langpacks
#   mkdir -p "$pkgdir/usr/lib/waterfox/browser/extensions/"
#   cp "${srcdir}"/waterfox-kde-$pkgver/*.xpi "$pkgdir/usr/lib/waterfox/browser/extensions/"
}

# vim: set ts=2 sw=2 et syn=sh ft=sh:
