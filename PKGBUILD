# Maintainer: Matt/ilikenwf <parwok@gmail.com>
pkgname=waterfox-alpha-git
pkgver=68.0a2+85165bfd6f5f
pkgrel=1
pkgdesc="More private and optimized Firefox fork. Alpha (gecko68) branch. CREATES SEPARATE PROFILE"
arch=('i686' 'x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=(gtk3 libffi libvpx icu libevent mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust mercurial clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm)
optdepends=('libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags)
provides=()
conflicts=('waterfox-alpha-bin')
install=waterfox-alpha.install
options=('!emptydirs' '!makeflags' '!strip')
source=(git://github.com/MrAlex94/Waterfox#branch=gecko68
        mozconfig
        waterfox-alpha.desktop
        ignore_bad_validator.patch
        vendor.js)
sha512sums=('SKIP'
            'b63bfbce4cceef1751f9332d3e9583aa58c1df5b3cd09ce7be9803cdbaf321fdd98c8aa81b5a4b4e9c61814748a2b8a977c241427e1d7d07a0774d32bef59f2d'
            'a133c3667bc11b3d19b6a1c9379f0112eca6a59df4096f476e480782de7fd395784de935c6c19b16051a4d5507b0c7f020cb35728f5a4dceb60474a931525673'
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
  
  install -Dm644 ../vendor.js "$pkgdir/opt/waterfox-alpha/browser/defaults/preferences/vendor.js"

  for i in 16 32 64 48 128; do
      install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-alpha/browser/chrome/icons/default/default$i.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-alpha.png"
  done

  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-alpha/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox-alpha.png"
  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox-alpha/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/waterfox-alpha.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-alpha.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-alpha.png"

  install -Dm644 ../waterfox-alpha.desktop \
    "$pkgdir/usr/share/applications/waterfox-alpha.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir/opt/waterfox-alpha/"{dictionaries,hyphenation}
  rm -rf "$pkgdir/opt/waterfox-alpha/hunspell"
  rm "$pkgdir/opt/waterfox-alpha/hunspell"||return 0
  ln -s /usr/bin/hunspell "$pkgdir/opt/waterfox-alpha"
  ln -s /usr/share/hyphen "$pkgdir/opt/waterfox-alpha"
}

