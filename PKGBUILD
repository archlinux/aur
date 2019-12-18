# Maintainer: Matt/ilikenwf <parwok@gmail.com>
pkgname=waterfox-current-git
pkgver=68.0+c8d4447d53f9
pkgrel=1
pkgdesc="More private and optimized Firefox fork. Alpha (gecko68) branch. CREATES SEPARATE PROFILE"
arch=('i686' 'x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=(gtk3 libffi libvpx icu libevent mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 'rust<=1:1.38.0-2' mercurial clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm)
optdepends=('libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags)
provides=()
conflicts=('waterfox-alpha-bin' 'waterfox-alpha-git')
install=waterfox-current.install
options=('!emptydirs' '!makeflags' '!strip')
source=(git://github.com/MrAlex94/Waterfox#branch=current
        mozconfig
        waterfox-current.desktop
        ignore_bad_validator.patch
        vendor.js)
sha512sums=('SKIP'
            'd7f49089c7aaf0ca72e2646bbdfd2f628a415762328bf52f9a4ba1dbc83462b6872c11b8424310b59a46e9b50e8ce3cc91fca88ae83e4cee34375ef45b29d81c'
            'acd1a8ea32747dcd3df976c64408bb01d06f30af399f8625f43930d6a8b64a76a00af08aca9cd525c74ee3f2e58f6a49b57bab9a8b6ec0e1497f27122a41b82a'
            'ab2aced2e371afad317ab3ffb3e8161c457f022327e182d426aa2ba4142112060225ced4610eb2525e1c739a4e56ad4e7cf78cc102232cf01cf06d0224a9c09d'
            'd927e5e882115c780aa0d45034cb1652eaa191d95c15013639f9172ae734245caae070018465d73fdf86a01601d08c9e65f28468621422d799fe8451e6175cb7')


# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'   
           
pkgver() {
	cd Waterfox
	echo $(cat browser/config/version.txt)"+"$(git rev-parse --short HEAD)
}

prepare() {
  cd Waterfox

  cp ../mozconfig .mozconfig

  # lcrmf breaks stuff
  sed -i 's/ \-lcrmf//g' "${srcdir}/Waterfox/old-configure.in"

  # the below is a really horrible thing to do but it allows commas in our optimizations to work
  patch -Np1 -i "${srcdir}/ignore_bad_validator.patch"
  
  mkdir -p "$srcdir/path"
}

build() {
  cd Waterfox

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"
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
  
  install -Dm644 ../vendor.js "$pkgdir/opt/waterfox-current/browser/defaults/preferences/vendor.js"

  for i in 16 32 64 48 128; do
      install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-current/browser/chrome/icons/default/default$i.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-current.png"
  done

  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-current/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox-current.png"
  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-current/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/waterfox-current.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-current.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-current.png"

  install -Dm644 ../waterfox-current.desktop \
    "$pkgdir/usr/share/applications/waterfox-current.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir/opt/waterfox-current/"{dictionaries,hyphenation}
  rm -rf "$pkgdir/opt/waterfox-current/hunspell"
  rm "$pkgdir/opt/waterfox-current/hunspell"||return 0
  ln -s /usr/bin/hunspell "$pkgdir/opt/waterfox-current"
  ln -s /usr/share/hyphen "$pkgdir/opt/waterfox-current"
}

