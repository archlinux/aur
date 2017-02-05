# Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>
# Forked from palemoon PKGBUILD by WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
pkgname=palemoon-git
pkgver=27.2.0a1+dfe35096e
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency (git version)"
arch=('i686' 'x86_64')
url="http://www.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm' 'ffmpeg' 'libpulse' 'gcc5')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libpulse: PulseAudio audio driver'
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification')
conflicts=('palemoon')
provides=('palemoon' 'firefox')
install=palemoon.install
source=(git+"https://github.com/MoonchildProductions/Pale-Moon"
		rhbz-966424.patch
        palemoon.desktop
        mozconfig.in)
md5sums=('SKIP'
         '95d212604b6c8354f9e255db5c3ce0ea'
         '32231f6e6a532021fd04c6d7b32f4270'
         'e0c0ea868b019c2d83cec196d600e085')
         
pkgver() {
	cd Pale-Moon
	echo $(cat browser/config/version.txt)"+"$(git rev-parse --short HEAD)
}

prepare() {
  sed 's#%SRCDIR%#'"$srcdir"'#g' mozconfig.in > mozconfig
  cd Pale-Moon

  chmod -R +x build/autoconf/* python/*
  find . -name '*.sh' -exec chmod +x {} \;
}
  
build() {
  cd Pale-Moon
  
  patch -Np0 -i ../rhbz-966424.patch

  export CC=gcc-5
  export CXX=g++-5
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZCONFIG="$srcdir/mozconfig"
  export CPPFLAGS="$CPPFLAGS -O3 -msse2 -mfpmath=sse -march=native -mtune=native"
  export LDFLAGS="$LDFLAGS -Wl,-z,norelro,-O3,--sort-common,--as-needed,--relax,-z,combreloc,-z,global,--no-omagic"
  python2 mach build || echo "Next =>"
  python2 mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s "../lib/palemoon/palemoon" "$pkgdir/usr/bin/palemoon"
  install -Dm644 "$srcdir/palemoon.desktop" "$pkgdir/usr/share/applications/palemoon.desktop"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/palemoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/palemoon.png"

  # use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/palemoon/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/palemoon/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/palemoon/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  #ln -sf palemoon "$pkgdir/usr/lib/palemoon/palemoon-bin"
  rm -f "$pkgdir/usr/lib/palemoon/palemoon-bin"
}
