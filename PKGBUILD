# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: NeoRaider <neoraider@universe-factory.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libxcb-git
pkgver=1.11.r58.gb15c96f
pkgrel=1
pkgdesc="X11 client-side library - git version"
arch=('i686' 'x86_64')
url="http://xcb.freedesktop.org/"
depends=('xcb-proto-git' 'libxdmcp' 'libxau')
makedepends=('git' 'libxslt' 'python')
conflicts=('libxcb')
provides=("libxcb=$pkgver")
license=('custom')
source=("git+http://anongit.freedesktop.org/git/xcb/libxcb.git"
        'libxcb-1.1-no-pthread-stubs.patch')
sha256sums=('SKIP'
            '3923bcb1930b851012968435909597d8d5251c72153511cb2982636c97100cc3')

pkgver() {
  cd $srcdir/${pkgname%-*}
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
  cd $srcdir/${pkgname%-*}

  patch -Np1 < ../libxcb-1.1-no-pthread-stubs.patch
}

build() {
  cd $srcdir/${pkgname%-*}

  ./autogen.sh \
    --prefix=/usr \
    --enable-xinput \
    --enable-xkb \
    --disable-static

  make
}

package() {
  cd $srcdir/${pkgname%-*}

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 bs=2:
