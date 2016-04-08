# $Id: PKGBUILD 161489 2016-04-05 22:22:08Z jelle $
# Maintainer: Ray Song <i@maskray.me>

pkgname=vte3-ng-fullwidth-emoji
_basever=0.44.0
pkgver=$_basever.a
pkgrel=1
pkgdesc="Enhanced Virtual Terminal Emulator widget for use with GTK3 (patched with support for fullwidth emoji)"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk3' 'vte-common' 'pcre2')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gtk-doc' 'gperf')
url="https://github.com/thestinger/vte-ng"
source=(https://github.com/thestinger/vte-ng/archive/$pkgver.tar.gz fullwidth-emoji.patch)
sha256sums=('bfa4f4148a63e8b730ab272792f55d03c8afa632bb5c28a440e1a5a8134c4b1b'
            '85e9c7f2014419238077f0cbe3fc522dc8afc81430dd49840cd1e33622623270')
provides=(vte3=$_basever vte3-select-text=$_basever vte3-ng)
conflicts=(vte3 vte3-select-text vte3-ng)
replaces=(vte3-select-text vte3-ng)

prepare() {
  cd "vte-ng-$pkgver"
  patch -p1 < $srcdir/fullwidth-emoji.patch
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
