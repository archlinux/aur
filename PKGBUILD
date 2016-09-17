# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=pandacoin-git
_gitname=pandacoin
pkgver=v3.0.2.11.gc337d27
pkgrel=1
pkgdesc="Pandacoin -- Rethinking cryptocurrency (git version)"
arch=('any')
url="http://dev.digitalpandacoin.org/"
license=('MIT')
depends=('gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('qt5-base' 'qt5-tools' 'pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('pandacoin' 'pandacoin-qt' 'pandacoind' 'pandacoin-bin' 'pandacoin-daemon')
conflicts=('pandacoin' 'pandacoin-qt' 'pandacoind' 'pandacoin-bin' 'pandacoin-daemon')
source=('git://github.com/DigitalPandacoin/pandacoin.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags| sed "s/-/./g"
}

prepare() {
    cd "$srcdir/$_gitname"
}

build() {
  cd "$srcdir/$_gitname"
   qmake
   make -j$(nproc)
   cd src/
   make -j$(nproc) -f makefile.unix 
}

package() {
	# install pandacoin-qt client
	msg2 'Installing pandacoin-qt...'
	install -Dm755 "$srcdir/$_gitname/pandacoin-qt" "$pkgdir/usr/bin/pandacoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/pandacoin80.xpm" "$pkgdir/usr/share/pixmaps/pandacoin80.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/pandacoin-qt.desktop"
	
	# install pandacoin-daemon
	msg2 'Installing pandacoin-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/pandacoind" "$pkgdir/usr/bin/pandacoind"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/pandacoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/pandacoin.conf"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/pandacoind.1" "$pkgdir/usr/share/man/man1/pandacoind.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/pandacoin.conf.5" "$pkgdir/usr/share/man/man5/pandacoin.conf.5"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
