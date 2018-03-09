# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
# Forked from palemoon-git PKGBUILD
pkgname=newmoon-git
pkgver=27.9.0a1+e9a220677
pkgrel=1
pkgdesc="Open source, unbranded web browser based on Firefox focusing on efficiency (git version)"
arch=('i686' 'x86_64')
url="http://www.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'libevent' 'hunspell' 'startup-notification')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm' 'ffmpeg' 'libpulse' 'gcc5')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libpulse: PulseAudio audio driver'
            'hyphen: library for hyphenation and justification')
conflicts=()
provides=('firefox')
install=newmoon.install
source=(git+"https://github.com/MoonchildProductions/Pale-Moon"
		rhbz-966424.patch
        newmoon.desktop
        mozconfig.in)
md5sums=('SKIP'
         '95d212604b6c8354f9e255db5c3ce0ea'
         'd663992d87725434f02c57814ec24a67'
         '261ad3141f2576f2f1884bd1ddf4a64f')
         
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
  python2 mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/newmoon"
  ln -s "../lib/newmoon/palemoon" "$pkgdir/usr/bin/newmoon"
  install -Dm644 "$srcdir/newmoon.desktop" "$pkgdir/usr/share/applications/newmoon.desktop"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/newmoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/newmoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/newmoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/newmoon.png"

  # use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/newmoon/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/newmoon/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/newmoon/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  rm -f "$pkgdir/usr/lib/newmoon/palemoon-bin"
}
