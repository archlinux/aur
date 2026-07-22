# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=chemtool-proper
pkgver=1.6.14
pkgrel=3
pkgdesc="Chemtool ported to Gtk3 with assistance from Codex"
arch=(i686 x86_64)
license=('GPL2')
url="http://ruby.chemie.uni-freiburg.de/~martin/chemtool/chemtool.html"
depends=('gtk3')
replaces=('chemtool')
provides=('chemtool')
options=(!libtool)
source=(http://ruby.chemie.uni-freiburg.de/~martin/chemtool/chemtool-$pkgver.tar.gz
        0001-Add-GTK3-compatibility-drawing-layer.patch
        0002-Port-chemtool-sources-to-GTK3.patch
        gtk3_build_system.patch
        chemtool.desktop)

prepare() {
  cd "$srcdir"/chemtool-$pkgver
  patch -Np1 -i ../gtk3_build_system.patch
  patch -Np2 -i ../0001-Add-GTK3-compatibility-drawing-layer.patch
  patch -Np2 -i ../0002-Port-chemtool-sources-to-GTK3.patch
  ./autogen.sh
}

build() {
  cd "$srcdir"/chemtool-$pkgver
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/chemtool-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 gnome/chemtool.png "$pkgdir"/usr/share/pixmaps/chemtool.png
  install -D -m644 "$srcdir"/chemtool.desktop "$pkgdir"/usr/share/applications/chemtool.desktop
}

sha256sums=('86161a0461386b334a5ffb17cdf094a491941884678272f45749813514ddafcb'
            'b7278a7256ef5c2cfc6ede8e9d577cae662d9e107a3d29b152122f499ffa68b9'
            'a81ffc0a44b4c856a2633eefcb9d0aced2695c5de0f7bbcb99ba952665a9a8ff'
            '5cfb774056a88c6e7dcd52233c740a27e592208292e9471e565b86832ec99e16'
            '9c35347faa7aa664c012f0d66fffbd469c4f2f3f8f24e5dd0cd42d554e9c5ac7')
