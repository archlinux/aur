# Maintainer: Matt/ilikenwf <parwok@gmail.com>
pkgname=waterfox-alpha-git
pkgver=68.0a2+6dc6672ccfb1
pkgrel=1
pkgdesc="More private and optimized Firefox fork. Alpha (gecko68) branch. CREATES SEPARATE PROFILE"
arch=('i686' 'x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=('gtk2' 'libffi' 'libvpx' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font' 'cbindgen')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13' 'clang' 'llvm' 'cargo')
provides=()
conflicts=('waterfox-alpha-bin')
install=waterfox-alpha.install
options=('!emptydirs' '!makeflags' '!strip')
source=(git://github.com/MrAlex94/Waterfox#branch=gecko68
        mozconfig
        waterfox-alpha.desktop
        ignore_bad_validator.patch
        disable-synth-dammit.patch
        vendor.js)
sha512sums=('SKIP'
            '2462c2ca8451d542b1ca7d344c34500372e95fea7d882b47cd64d2315aefce773af4803a475b9678a71bc0a647d12785e1892505798a1c5709d215690af85518'
            'a133c3667bc11b3d19b6a1c9379f0112eca6a59df4096f476e480782de7fd395784de935c6c19b16051a4d5507b0c7f020cb35728f5a4dceb60474a931525673'
            'ab2aced2e371afad317ab3ffb3e8161c457f022327e182d426aa2ba4142112060225ced4610eb2525e1c739a4e56ad4e7cf78cc102232cf01cf06d0224a9c09d'
            'd58c856c1614dfd674a3c4c79f6dd237c0417dbf37c89a269a8744bad46bff4c707a5e319872762f8bd05c2dd532ffa225490dfafaab784c70131c72614b0d4e'
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
  
  # and this is a hacky workaround so we can build without html5 and 
  # speex support - also in .mozconfig if you want to build with it, comment both out
  warning "Applying patch to facilitate build without speex and html5 voice synth."
  warning "To build with it, please edit the .mozconfig and adjust the options to enable what you need: "
  warning "		ac_add_options --disable-accessibility"
  warning "		ac_add_options --disable-synth-speechd"
  warning "		ac_add_options --disable-webspeech=1"
  warning "Then, comment out the disable-synth-dammit.patch line in the PKGBUILD."
  warning "Press ENTER if you want to build now or CTRL+C to abort..."
  read
	
  patch -Np1 -i "${srcdir}/disable-synth-dammit.patch"
  
  mkdir -p "$srcdir/path"
}

build() {
  cd Waterfox

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  ./mach build
}

package() {
  cd Waterfox
  mkdir -p "$pkgdir"
  DESTDIR="$pkgdir" ./mach install
  
  # laziness
  rm "$pkgdir/usr/bin/waterfox"
  mv "$pkgdir/opt/waterfox" "$pkgdir/opt/waterfox-alpha"
  ln -s "/opt/waterfox-alpha/waterfox" "$pkgdir/usr/bin/waterfox-alpha"

  install -Dm644 ../vendor.js "$pkgdir/opt/waterfox-alpha/browser/defaults/preferences/vendor.js"

  for i in 16 32 64 48 128; do
      install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default$i.png" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-alpha.png"
  done

  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox-alpha.png"
  install -Dm644 "$srcdir/Waterfox/obj-x86_64-pc-linux-gnu/dist/waterfox/browser/chrome/icons/default/default128.png" \
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

