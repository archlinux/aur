# $Id: PKGBUILD 161489 2016-02-13 22:22:08Z jelle $
# Maintainer: Ray Song <i@maskray.me>

pkgname=vte3-ng-fullwidth-emoji
_basever=0.42.4
pkgver=$_basever.a
pkgrel=1
pkgdesc="Enhanced Virtual Terminal Emulator widget for use with GTK3 (patched with support for fullwidth emoji)"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk3' 'vte-common')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gtk-doc' 'gperf')
url="https://github.com/thestinger/vte-ng"
source=(https://github.com/thestinger/vte-ng/archive/$pkgver.tar.gz fullwidth-emoji.patch)
sha256sums=('97f1572b1080614b9dcf261a8abe4c7bfd840f7dc91e9bb29ffe310525b28443'
            'dfa3510b1c0839a337e1c12faa10b1a3049f0e44881d4ff2496eb0a3ad4335e1')
provides=(vte3=$_basever vte3-select-text=$_basever vte3-ng)
conflicts=(vte3 vte3-select-text vte3-ng)
replaces=(vte3-select-text vte3-ng)

prepare() {
  patch -p1 < ../fullwidth-emoji.patch
}

build() {
  cd "vte-ng-$pkgver"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection
  make
}

package() {
  cd "vte-ng-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir/etc/profile.d/vte.sh"
}
