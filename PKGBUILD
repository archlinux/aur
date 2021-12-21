# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-g4-kpe
pkgver=0.5.1
pkgrel=0
pkgdesc="Customizable privacy conscious web browser with better integration with KDE and primary support for webextensions"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'glibc' 'libpulse' 'nss' 'nspr')
makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'alsa-lib' 'jack' 'cbindgen' 'nasm'
             'nodejs' 'lld' 'bc' 'python-setuptools' 'python-psutil' 'python-zstandard' 'pciutils')
options=('!emptydirs' '!makeflags' 'zipman')
_filesrev=011ca923053e61cd9449fafc435607c0c28182ca
_filesurl=https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/$_filesrev/waterfox-g4-kpe
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=G4.$pkgver"
        "waterfox-g4.desktop::$_filesurl/waterfox-g4.desktop"
        "distribution.ini::$_filesurl/distribution.ini"
        "vendor.js::$_filesurl/vendor.js"
        "waterfox-g4.1::$_filesurl/waterfox-g4.1"
        "syspref.js::$_filesurl/syspref.js"
        "waterfox-g4.appdata.xml.in::$_filesurl/waterfox-g4.appdata.xml.in"
        "global_menu.patch::$_filesurl/patches/global_menu.patch"
        "g4-kde.patch::$_filesurl/patches/g4-kde.patch"
        "g4-kde_link-fix.patch::$_filesurl/patches/g4-kde_link-fix.patch"
        "nongnome-proxies.patch::$_filesurl/patches/nongnome-proxies.patch"
        "mozilla-ntlm-full-path.patch::$_filesurl/patches/mozilla-ntlm-full-path.patch"
        "Use-remoting-name-for-GDK-application-names.patch::$_filesurl/patches/Use-remoting-name-for-GDK-application-names.patch"
        "sandbox-fips.patch::$_filesurl/patches/sandbox-fips.patch"
        "fix-langpack-id.patch::$_filesurl/patches/fix-langpack-id.patch"
        "mozwayland-add-missing-stub.patch::$_filesurl/patches/mozwayland-add-missing-stub.patch"
        )
sha256sums=('SKIP'
            '76fde87eda671338d58a29d78ab081ca47aac2cde8faccafa646b0546b22bcfb'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            'b9458af82a1e67497f1a42b69cb69b7a86a87727c35004a4089d207d10c7c2b4'
            '37ff7802cddae42f9c13fef5ce83f07858a22076b701b623412e5422636c35ee'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            '15cbfd8812c2396ab9cae6ad5a388b71fece7782fffe4b50b707b04b7221bb76'
            '2b0c71f7bb90cf2741ba405615ac0d8f667ecef69930286bed16c1804f7550d1'
            'db84a69b0bd4475555e76f951b759c97123079539ac169e972f62c780626b310'
            '9ef02e976475ec56d07dfc19ebcaad3ffa8b5931b61564da2914226619204746'
            'f1cae271fbb244669cbcf2c3d7c5c43f62cf247403baba921c75f5211e2439b7'
            '2bb12adfdb1e26e6dbb184cae8aeb85c83c886d9ce1f6a243b613bc192ad248f'
            '138b972a40a74104791783167770c4a01e62cce00bb9cc75119e152f9ea9f14d'
            'c3d0bc01466c4d1164c7bc9e1cdece7e0cfdf6c408c813b766b11730200c43c4'
            'e928447807472e3cb318135a0be278ac86b41c5ce060230e37fbe8741d3925d5'
            'c4f1cb819856e355d9d922dfc33ca1e5c4d261950708433999d3d1aea3bbd93f')

prepare() {

  cd Waterfox

  # Generate date and version for metadata file
  export TODAY_DATE=$(date +%Y-%m-%d)
  sed -i "s/__DATE__/$TODAY_DATE/g" ../waterfox-g4.appdata.xml.in
  sed -i "s/__VERSION__/$(<browser/config/version_display.txt)/g" ../waterfox-g4.appdata.xml.in

  # Add patches
  patch -Np1 -i ../global_menu.patch
  patch -Np1 -i ../g4-kde.patch
  patch -Np1 -i ../g4-kde_link-fix.patch
  patch -Np1 -i ../nongnome-proxies.patch
  patch -Np1 -i ../mozilla-ntlm-full-path.patch
  patch -Np1 -i ../Use-remoting-name-for-GDK-application-names.patch
  patch -Np1 -i ../sandbox-fips.patch
  patch -Np1 -i ../fix-langpack-id.patch
  patch -Np1 -i ../mozwayland-add-missing-stub.patch

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
ac_add_options --disable-verify-mar
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --disable-tests

# Enable wanted features
ac_add_options --enable-optimize
ac_add_options --enable-eme=widevine
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

ac_add_options --with-app-name=waterfox-g4
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/waterfox
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss


export MOZ_REQUIRE_SIGNING=
export MOZ_INCLUDE_SOURCE_INFO=1

#mk_add_options MOZ_MAKE_FLAGS="-j$(($(nproc --all) / 2))"
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj
END
}

build() {
  cd Waterfox

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  LDFLAGS+=" -Wl,--no-keep-memory -Wl,--no-mmap-output-file"
  export LDFLAGS
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
END
  ./mach build

#   # Build langpacks
#   cat > ../mozconfig_LANG <<END
# ac_add_options --with-app-name=waterfox-g4
# ac_add_options --with-app-basename=Waterfox
# ac_add_options --with-branding=browser/branding/waterfox
# mk_add_options MOZ_OBJDIR=${PWD}/../obj_LANG
# ac_add_options --prefix=/usr
# ac_add_options --with-l10n-base=${PWD}/browser/locales/l10n
# ac_add_options --enable-linker=lld
# ac_add_options --disable-updater
# ac_add_options --disable-bootstrap
# END

#   export JOBS=$(echo $(grep -c ^processor /proc/cpuinfo)\/2 | bc)
#   sed -r '/^(ja-JP-mac|en-US|)$/d;s/ .*$//' ../locales.shipped | cut -f1 -d":" \
#     | xargs -n 1 -P $JOBS -I {} /bin/sh -c '
#         locale=$1
#         cp ../mozconfig_LANG ${PWD}/mozconfig_$locale
#         sed -i "s|obj_LANG|obj_$locale|" ${PWD}/mozconfig_$locale
#         export MOZCONFIG=${PWD}/mozconfig_$locale
#         ./mach build config/nsinstall langpack-$locale
#         cp -L ../obj_$locale/dist/linux-*/xpi/waterfox-g4-$(<browser/config/version_display.txt).$locale.langpack.xpi \
#             ${PWD}/langpack-$locale@l10n.waterfox.net.xpi
# ' -- {}
}

package_waterfox-g4-kpe() {
  optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech'
             'hunspell-en_US: Spell checking, American English'
             'kwaterfoxhelper: KDE Plasma Integration')
  provides=("waterfox-g4=${pkgver}")

  cd Waterfox

  export MACH_USE_SYSTEM_PYTHON=1

  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox-g4/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  for i in 16 22 24 32 48 64 128 256; do
      install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
      ln -Ts /usr/lib/waterfox-g4/browser/chrome/icons/default/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g4.png"
  done
  install -Dm644 browser/branding/waterfox/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-g4.png"
  install -Dm644 browser/branding/waterfox/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-g4.png"

  install -Dm644 $srcdir/waterfox-g4.desktop \
    "$pkgdir/usr/share/applications/waterfox-g4.desktop"

  install -Dm644 $srcdir/waterfox-g4.1 \
    "$pkgdir/usr/share/man/man1/waterfox-g4.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-g4/distribution/distribution.ini"


  install -Dm644 $srcdir/waterfox-g4.appdata.xml.in \
    "$pkgdir/usr/share/metainfo/waterfox-g4.appdata.xml"

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/waterfox-g4/browser/defaults/preferences/vendor.js"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-g4" <<END
#!/bin/sh
exec /usr/lib/waterfox-g4/waterfox-g4 "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-g4" \
    "$pkgdir/usr/lib/waterfox-g4/waterfox-g4-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox-g4"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox-g4/"
  ln -Tsf /etc/waterfox-g4/syspref.js "$pkgdir/usr/lib/waterfox-g4/browser/defaults/preferences/syspref.js"

#   # Install langpacks
#   mkdir -p "$pkgdir/usr/lib/waterfox-g4/browser/extensions/"
#   cp "${srcdir}"/waterfox-g4-kpe-$pkgver/*.xpi "$pkgdir/usr/lib/waterfox-g4/browser/extensions/"
}

# vim: set ts=2 sw=2 et syn=sh ft=sh:
