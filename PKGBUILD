# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-current-kpe
pkgver=2020.03
pkgrel=0
pkgdesc="Customizable privacy conscious web browser with better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'hunspell' 'ttf-font' 'hicolor-icon-theme' 'kwaterfoxhelper')
makedepends=('unzip' 'zip' 'diffutils' 'python' 'yasm' 'mesa' 'imake' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'libpulse' 'alsa-lib' 'jack' 'cbindgen' 'nasm' 'python2-setuptools'
             'nodejs' 'python2-psutil' 'nss' 'nspr' 'binutils' 'git')
optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech')
provides=("waterfox-current=${pkgver}")
conflicts=('waterfox-current')
options=('!emptydirs' '!makeflags' 'zipman')
replaces=("waterfox-beta-kde")
_commit=f4430b861ce4a06834ba4a676bb2214c0d4eba36
source=("git+https://github.com/MrAlex94/Waterfox.git#commit=$_commit"
        "waterfox-current.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/waterfox-current.desktop"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/distribution.ini"
        "vendor.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/vendor.js"
        "waterfox-current.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/waterfox-current.1"
        "syspref.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/syspref.js"
        "mozilla-nongnome-proxies.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/mozilla-nongnome-proxies.patch"
        "current-kde-2020.03.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/master/waterfox-current-kpe/patches/current-kde-2020.03.patch"
        "current-kde-xul-2020.03.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/master/waterfox-current-kpe/patches/current-kde-xul-2020.03.patch"
        )
sha256sums=('SKIP'
            'ca152a5d24a59aa5552cc49915b13eef5181aac4ac6d2efa02c705efaeaed97b'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            'ec0bb9b7e4968b69fac34a0f8570c1d026253087a7d967a0903b62ea9397a862'
            '415328df67733f54f5bf4d68335c7457264f67175d3ee258c8a392c3c273b572'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            'ffa9d71bd6dd60eaaef70ba67444c75b6ce0313a107b5b086fd3d30df865ccbf'
            '547233b3a9143f0b03d39655cb705b55cb6df6a2e97e4423f07c38386638ade5'
            '6f3333e1201c02c0569d81b0e73dc84c717b1ac37a9a502f664135c670833f53')

prepare() {

  cd Waterfox

  patch -Np1 -i ../current-kde-2020.03.patch
  patch -Np1 -i ../current-kde-xul-2020.03.patch
  patch -Np1 -i ../mozilla-nongnome-proxies.patch

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

ac_add_options --enable-optimize="-O2 -march=nocona -mtune=nocona -w"
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

#X=$(($(getconf _NPROCESSORS_ONLN 2>/dev/null || getconf NPROCESSORS_ONLN)*3/2))

#mk_add_options AUTOCLOBBER=1
#mk_add_options MOZ_MAKE_FLAGS=-j6

ac_add_options --prefix=/usr

ac_add_options --with-app-name=waterfox-current
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/waterfox

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
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-startup-notification
ac_add_options --enable-hardening
ac_add_options --enable-lto
ac_add_options --enable-linker=gold
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

export MOZ_PGO=1
export MOZ_REQUIRE_SIGNING=0
export MOZ_INCLUDE_SOURCE_INFO=1
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"
END
}

build() {
  cd Waterfox

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # LTO needs more open files
  ulimit -n 4096

  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox-current/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

 for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/waterfox/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-current.png"
  done
  install -Dm644 browser/branding/waterfox/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-current.png"
  install -Dm644 browser/branding/waterfox/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-current.png"

  install -Dm644 $srcdir/waterfox-current.desktop \
    "$pkgdir/usr/share/applications/waterfox-current.desktop"

  install -Dm644 $srcdir/waterfox-current.1 \
    "$pkgdir/usr/share/man/man1/waterfox-current.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-current/distribution/distribution.ini"

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/waterfox-current/browser/defaults/preferences/vendor.js"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-current" <<END
#!/bin/sh
exec /usr/lib/waterfox-current/waterfox-current "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-current" \
    "$pkgdir/usr/lib/waterfox-current/waterfox-current-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox-current"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox-current/"
  ln -Tsf /etc/waterfox-current/syspref.js "$pkgdir/usr/lib/waterfox-current/browser/defaults/preferences/syspref.js"

}
