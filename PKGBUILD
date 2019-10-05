# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-beta-kde
pkgver=68.0b1
pkgrel=0
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
provides=("waterfox-beta=${pkgver}")
conflicts=('waterfox-beta')
options=('!emptydirs' '!makeflags' 'zipman')
replaces=("waterfox-alpha-kde")
_commit=457d639a1063852916f426c5e9aa74a72f5beb47
source=("git+https://github.com/MrAlex94/Waterfox.git#commit=$_commit"
        waterfox-beta.desktop
        distribution.ini
        "vendor.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/vendor.js"
        "waterfox-beta.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/waterfox-beta.1"
        "syspref.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/syspref.js"
        "waterfox-kde-68.0b1.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta-kde/patches/waterfox-kde-68.0b1.patch"
        "mozilla-nongnome-proxies.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/patches/mozilla-nongnome-proxies.patch"
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/kde.js"
        "australis-photon.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/patches/australis-photon.patch"
        "pocket.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/patches/pocket.patch"
        "silence_crash_reporter.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta/patches/silence_crash_reporter.patch"
        "rust_1.38.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-beta-kde/patches/rust_1.38.patch"
        )
sha256sums=('SKIP'
            'f3efe9ae00e229fade337413243769da05268ad98046ccd2aecbdc511b007dbe'
            '3961c09993c442df97832866ddaea5bcc1ade1313beb313b5ceba60166933016'
            'eaf0cb37d03bf222f678f24baff06a2a56cac3d6c0eeae059dee3cfb7020292d'
            '354081aa8b081bc831d30043704e2f144fcdfeb7ed3e5b4814163bcb335c42d9'
            '1362b56a0b5ddaad0761d8d3a04ea072a591772de8c9f7fd5c0459d2bba2379b'
            'da09c1c8a83f74a67ddeec827af7c5a495841408d97af6d13d9142264831e398'
            'ffa9d71bd6dd60eaaef70ba67444c75b6ce0313a107b5b086fd3d30df865ccbf'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            '48506e0483ec1f645425ee7b83f44e8c36cfe2495fe25b4131ed831912003104'
            '2c59d72ce943ecdda01e93e1452b9fcc94cfae129830a1e6e9c1fced47f78e04'
            'aac778c9c34dc0bd38c7f60b3a308481d64716d208211119404e955ed17633fc'
            'cf87e4af66aedd85b72434ed65e3e063d08e7d32b47b9dd44d9a6f2bcf4f81cc')

prepare() {

  cd Waterfox

  patch -Np1 -i ../waterfox-kde-68.0b1.patch
  patch -Np1 -i ../mozilla-nongnome-proxies.patch
  patch -Np1 -i ../australis-photon.patch
  patch -Np1 -i ../pocket.patch
  patch -Np1 -i ../silence_crash_reporter.patch
  patch -Np1 -i ../rust_1.38.patch

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

ac_add_options --enable-optimize="-O2 -msse3 -march=x86-64 -mtune=generic -w"
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

#X=$(($(getconf _NPROCESSORS_ONLN 2>/dev/null || getconf NPROCESSORS_ONLN)*3/2))

#mk_add_options AUTOCLOBBER=1
#mk_add_options MOZ_MAKE_FLAGS=-j6

ac_add_options --prefix=/usr

ac_add_options --with-app-name=waterfox-beta
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
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-startup-notification
ac_add_options --enable-hardening
ac_add_options --enable-lto
ac_add_options --enable-linker=gold
ac_add_options --enable-ccache=ccache

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

  # LTO needs more open files
  ulimit -n 4096

  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox-beta/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/waterfox-beta/browser/defaults/preferences/kde.js"

  for i in 16 32 48 64 128; do
    install -Dm644 browser/branding/alpha/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-beta.png"
  done
  install -Dm644 browser/branding/alpha/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-beta.png"
  install -Dm644 browser/branding/alpha/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-beta.png"

  install -Dm644 $srcdir/waterfox-beta.desktop \
    "$pkgdir/usr/share/applications/waterfox-beta.desktop"

  install -Dm644 $srcdir/waterfox-beta.1 \
    "$pkgdir/usr/share/man/man1/waterfox-beta.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-beta/distribution/distribution.ini"

  # Use system-provided dictionaries
  if [ -d $pkgdir/usr/lib/waterfox-beta/dictionaries ]; then
    rm -r "$pkgdir"/usr/lib/waterfox-beta/dictionaries
  fi

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-beta" <<END
#!/bin/sh
exec /usr/lib/waterfox-beta/waterfox-beta "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-beta" \
    "$pkgdir/usr/lib/waterfox-beta/waterfox-beta-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox-beta"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox-beta/"
  ln -Tsf /etc/waterfox-beta/syspref.js "$pkgdir/usr/lib/waterfox-beta/browser/defaults/preferences/syspref.js"

}
