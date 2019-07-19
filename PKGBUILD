# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-alpha-kde
pkgver=68.0a1
pkgrel=0
pkgdesc="Free, open and private browser with patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'hunspell' 'ttf-font' 'hicolor-icon-theme' 'kwaterfoxhelper')
makedepends=('unzip' 'zip' 'diffutils' 'python' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'libpulse' 'alsa-lib' 'jack' 'cbindgen' 'nasm' 'python2-setuptools'
             'nodejs' 'python2-psutil' 'ccache' 'nss' 'nspr')
optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech')
provides=("waterfox-alpha=${pkgver}")
conflicts=('waterfox-alpha')
options=('!emptydirs' '!makeflags' 'zipman')
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=$pkgver"
        waterfox-alpha.desktop
        distribution.ini
        "vendor.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/vendor.js"
        "waterfox-alpha.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/waterfox-alpha.1"
        "syspref.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/syspref.js"
        "waterfox-kde-68.0a1.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha-kde/patches/waterfox-kde-68.0a1.patch"
        "fix-build-after-y2038-changes-in-glibc.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/fix-build-after-y2038-changes-in-glibc.patch"
        "addon_versions_addon_manager.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/addon_versions_addon_manager.patch"
        "bookmark_star_button.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/bookmark_star_button.patch"
        "privacy.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/privacy.patch"
        "utf8.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/utf8.patch"
        "zoom_cursor.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/zoom_cursor.patch"
        "mozilla-nongnome-proxies.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-alpha/patches/mozilla-nongnome-proxies.patch"
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/kde.js")
sha256sums=('SKIP'
            '2d9d16132bc30692c9383b0be439a31351f29897808c2cfaf96a252d6acf55d9'
            '3961c09993c442df97832866ddaea5bcc1ade1313beb313b5ceba60166933016'
            '04810534261af6cb7fce4a00ffdd7457be045e480bb95f4dcad4fbfeb202c163'
            '8fe7431aecc9d7f412744608ab8d779231726b6fe33aa46044ee4741053bd67f'
            '1362b56a0b5ddaad0761d8d3a04ea072a591772de8c9f7fd5c0459d2bba2379b'
            'c84c48bfc46ca50785843e5b41ee30f312f0a5569c9009fde44f6d0e994c6002'
            '433c3e75a009defc19ab653075ead400ad9d0f9b0b5f39b1bd4de8561a4a3c9c'
            '86132acc7d435443ea332c4b832a965794f9ad48df40fdc537d3d0ba997db804'
            '71e437dff53e4cf86244f285182b4534b3a74a4cb6086d10a0c2de9d09b9babd'
            'c1042ce02c47d671b4d34c98da24591b0cc1721972e63ae9fa1afb5065d2e85c'
            'c7e0319da37225559604073329c07e766323453d4e4fddb11c73dd134fcb6bd8'
            '1fe5fbb242622bfc22bbcc2969a342d12328c5d28163dd643d979d1eec5f0ed0'
            'ffa9d71bd6dd60eaaef70ba67444c75b6ce0313a107b5b086fd3d30df865ccbf'
            'b900f7f5a8440852a17191a374d5557ece44b98215c3c8960eb864cbc0753fe0')

prepare() {

  cd Waterfox

  patch -Np1 -i ../waterfox-kde-68.0a1.patch
  patch -Np1 -i ../fix-build-after-y2038-changes-in-glibc.patch
  patch -Np1 -i ../addon_versions_addon_manager.patch
  patch -Np1 -i ../bookmark_star_button.patch
  patch -Np1 -i ../privacy.patch
  patch -Np1 -i ../utf8.patch
  patch -Np1 -i ../zoom_cursor.patch
  patch -Np1 -i ../mozilla-nongnome-proxies.patch

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

ac_add_options --enable-optimize="-O3 -msse3 -march=x86-64 -mtune=generic -w"
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

#X=$(($(getconf _NPROCESSORS_ONLN 2>/dev/null || getconf NPROCESSORS_ONLN)*3/2))

#mk_add_options AUTOCLOBBER=1
#mk_add_options MOZ_MAKE_FLAGS=-j6

ac_add_options --prefix=/usr

ac_add_options --with-app-name=waterfox-alpha
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/alpha

# Libraries
ac_add_options --x-libraries=/usr/lib

# Disable unwanted features
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --disable-verify-mar
ac_add_options --disable-profiling
ac_add_options --disable-signmar
ac_add_options --disable-gconf
ac_add_options --disable-dmd

# Enable wanted features
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-startup-notification
ac_add_options --enable-hardening
ac_add_options --enable-lto
ac_add_options --enable-ccache=ccache

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

export MOZ_GECKO_PROFILER=
export MOZ_ENABLE_PROFILER_SPS=
export MOZ_PROFILING=
export MOZ_MAINTENANCE_SERVICE=
MOZ_REQUIRE_SIGNING=0
export MOZ_PGO=1
END
}

build() {
  cd Waterfox

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

  # LTO needs more open files
  ulimit -n 4096

  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" ./mach install

  cat > $pkgdir/usr/lib/waterfox-alpha/browser/defaults/preferences/spellcheck.js <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/waterfox/browser/defaults/preferences/kde.js"

  for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/alpha/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-alpha.png"
  done
  install -Dm644 browser/branding/alpha/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-alpha.png"
  install -Dm644 browser/branding/alpha/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-alpha.png"

  install -Dm644 $srcdir/waterfox-alpha.desktop \
    "$pkgdir/usr/share/applications/waterfox-alpha.desktop"

  install -Dm644 $srcdir/waterfox-alpha.1 \
    "$pkgdir/usr/share/man/man1/waterfox-alpha.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-alpha/distribution/distribution.ini"

  # Use system-provided dictionaries
  if [ -d $pkgdir/usr/lib/waterfox-alpha/dictionaries ]; then
    rm -r "$pkgdir"/usr/lib/waterfox-alpha/dictionaries
  fi

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-alpha" <<END
#!/bin/sh
exec /usr/lib/waterfox-alpha/waterfox-alpha "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-alpha" \
    "$pkgdir/usr/lib/waterfox-alpha/waterfox-alpha-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox/"
  ln -Tsf /etc/waterfox/syspref.js "$pkgdir/usr/lib/browser/defaults/preferences/syspref.js"

}
