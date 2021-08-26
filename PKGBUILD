# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor: Marcelo Cavalcante <marcelo@marcelocavalcante.net>
# Contributor: Jens Kleikamp <jens@codes-concepts.com>
# Contributor: Philipp Gildein <rmbl@openspeak-project.org>

pkgbase=smuxi
pkgname=('smuxi-server' 'smuxi')
pkgver=1.1
pkgrel=1
pkgdesc="User-friendly and cross-platform IRC client for sophisticated users for GNOME/GTK+"
arch=('any')
url="https://smuxi.im/"
license=('GPL')
makedepends=('gtk-sharp-2-git' 'notify-sharp' 'log4net' 'nini' 'gtkspell' 'stfl' 'intltool')
options=('!emptydirs')
source=(https://smuxi.im/jaws/data/files/$pkgbase-$pkgver.tar.gz{,.asc})
validpgpkeys=('ABE195E150A8DBE7809D3F427127E5ABEEF946C8') # Mirco Bauer
sha256sums=('7f16f880b0035e503e41958bbc1a98f5ebff5662d202822e1e59930f2348b5bc'
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
  depends=('smuxi-server' 'gtk-sharp-2-git' 'notify-sharp' 'gtkspell')

  cd frontend
  mkdir -p "$pkgdir"/usr/{bin,lib/smuxi,share/man/man1}
  mv smuxi-frontend-gnome "$pkgdir/usr/bin"
  mv smuxi-frontend-gnome.1 "$pkgdir/usr/share/man/man1"
  mv smuxi-frontend-gnome* "$pkgdir/usr/lib/smuxi"
  mv {applications,icons,metainfo} "$pkgdir/usr/share"
}
