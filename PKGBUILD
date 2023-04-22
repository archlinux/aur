# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor: Marcelo Cavalcante <marcelo@marcelocavalcante.net>
# Contributor: Jens Kleikamp <jens@codes-concepts.com>
# Contributor: Philipp Gildein <rmbl@openspeak-project.org>

pkgbase=smuxi
pkgname=('smuxi-server' 'smuxi')
pkgver=1.2.1
pkgrel=1
pkgdesc="User-friendly and cross-platform IRC client for sophisticated users for GNOME/GTK+"
arch=('any')
url="https://smuxi.im/"
license=('GPL')
makedepends=('notify-sharp' 'log4net' 'nini' 'gtkspell' 'stfl' 'intltool')
options=('!emptydirs')
source=(https://smuxi.im/jaws/data/files/$pkgbase-$pkgver.tar.gz{,.asc})
validpgpkeys=('ABE195E150A8DBE7809D3F427127E5ABEEF946C8') # Mirco Bauer
sha256sums=('cb96475e4ec3479b37b4357178cb00a1a404a67ba24d5fc0f6c4fd3fae5816e5'
            'SKIP')

prepare() {
  cd $pkgbase-$pkgver
  sed -i 's|$(datarootdir)/appdata|$(datarootdir)/metainfo|' src/Frontend-GNOME/Makefile.{am,in}
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --enable-frontend-stfl \
              --with-vendor-package-version="Arch Linux $pkgver-$pkgrel"
  LANG=C make -j1
}

package_smuxi-server() {
  pkgdesc+=" (common files and server)"
  depends=('log4net' 'nini' 'stfl')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  # Split frontend
  [[ -d $srcdir/frontend ]] && rm -r "$srcdir/frontend/"
  mkdir "$srcdir"/frontend
  mv "$pkgdir"/usr/bin/smuxi-frontend-gnome \
     "$pkgdir"/usr/lib/smuxi/smuxi-frontend-gnome* \
     "$pkgdir"/usr/share/{applications,icons,metainfo} \
     "$pkgdir"/usr/share/man/man1/smuxi-frontend-gnome.1 \
     "$srcdir/frontend/"
}

package_smuxi() {
  pkgdesc+=" (frontend)" 
  depends=('smuxi-server' 'notify-sharp' 'gtkspell')

  cd frontend
  mkdir -p "$pkgdir"/usr/{bin,lib/smuxi,share/man/man1}
  mv smuxi-frontend-gnome "$pkgdir/usr/bin"
  mv smuxi-frontend-gnome.1 "$pkgdir/usr/share/man/man1"
  mv smuxi-frontend-gnome* "$pkgdir/usr/lib/smuxi"
  mv {applications,icons,metainfo} "$pkgdir/usr/share"
}
