# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-current-kpe
pkgver=2019.10
pkgrel=1
pkgdesc="Free, open and private browser with patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'hunspell' 'ttf-font' 'hicolor-icon-theme' 'kwaterfoxhelper')
makedepends=('unzip' 'zip' 'diffutils' 'python' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'libpulse' 'alsa-lib' 'jack' 'cbindgen' 'nasm' 'python2-setuptools'
             'nodejs' 'python2-psutil' 'ccache' 'nss' 'nspr' 'binutils')
optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech')
provides=("waterfox-current=${pkgver}")
conflicts=('waterfox-current')
options=('!emptydirs' '!makeflags' 'zipman')
replaces=("waterfox-beta-kde")
_commit=7ea07fcb1e202014c942c0b76cfd26d94f0d1a7f
source=("git+https://github.com/MrAlex94/Waterfox.git#commit=$_commit"
        "waterfox-current.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/waterfox-current.desktop"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/distribution.ini"
        "vendor.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/vendor.js"
        "waterfox-current.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/waterfox-current.1"
        "syspref.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/syspref.js"
        "waterfox-current-kde-68.0.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/waterfox-current-kde-68.0.patch"
        "mozilla-nongnome-proxies.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/mozilla-nongnome-proxies.patch"
        "allow_run_current_when_classic.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/allow_run_current_when_classic.patch"
        "disable_some_telemetry.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/disable_some_telemetry.patch"
        "icon_mish_mash.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/icon_mish_mash.patch"
        "Bug1500436.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/Bug1500436.patch"
        "rust_1.39.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-current-kpe/patches/rust_1.39.patch"
        )
sha256sums=('SKIP'
            '346b791515d05645be86e0f3404187e6397a22460ad54eb27aaf3054d81c2cd8'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            '43718dfaf40156f1248f2bbee72a3a6586d93209a9168f61245aa944e4e2e08d'
            'a49c774f3077b0882d0a9672fadf1637894014ec916ead700375163f33672f9c'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            '6d25efa495ac7669c43f4bad78f548416678d5e350efed30ad717d86156ccac4'
            'ffa9d71bd6dd60eaaef70ba67444c75b6ce0313a107b5b086fd3d30df865ccbf'
            'c409dcc7b62f2efc47f7eed53760c7b073fba4b7023c1179ca560c8979aee43b'
            'eb798add6fa923ac7921c728ccbc3a984eeab9205b49ee6a3ef6f9a1cab468ac'
            'ffb7e8a1191276f95faa321672b45f5b5b79c5452d2a8c8f921a30ac8843096a'
            'd17a9f31f995047ce54ef63a3c2fc14809509c9bdfff9fd0b4e8a35793e080f9'
            'eefc8a39b3de5259a955abace3cf224694485b1c0de55552bb5dc4b51951bc88')

prepare() {

  cd Waterfox

  patch -Np1 -i ../waterfox-current-kde-68.0.patch
  patch -Np1 -i ../mozilla-nongnome-proxies.patch
  patch -Np1 -i ../allow_run_current_when_classic.patch
  patch -Np1 -i ../disable_some_telemetry.patch
  patch -Np1 -i ../icon_mish_mash.patch
  patch -Np1 -i ../Bug1500436.patch
  patch -Np1 -i ../rust_1.39.patch

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
ac_add_options --enable-ccache=ccache
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

export MOZ_PGO=1
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
