# Maintainer: Mateusz Paluszkiewicz <aifam96 at gmail dot com>
# Based on package 'vte3-ng-fullwidth-emoji' by Ray Song <i@maskray.me>

pkgname=vte3-ng-emoji-terminix-zsh-notify
_basever=0.46.0
pkgver=$_basever.a
pkgrel=3
pkgdesc="Enhanced Virtual Terminal Emulator widget for use with GTK3 
(patched with support for fullwidth emoji, support for Terminix 
triggers and zsh notification support)"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk3' 'vte-common' 'pcre2')
optdepends=('terminix: terminix support')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gtk-doc' 'gperf')
url="https://github.com/thestinger/vte-ng"
source=(https://github.com/thestinger/vte-ng/archive/$pkgver.tar.gz multi.patch)
sha256sums=('SKIP'
            'SKIP')
provides=(vte3=$_basever vte3-select-text=$_basever vte3-ng)
conflicts=(vte3 vte3-select-text vte3-ng)
replaces=(vte3-select-text vte3-ng)

prepare() {
  cd "vte-ng-$pkgver"
  patch -p1 < $srcdir/multi.patch
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
