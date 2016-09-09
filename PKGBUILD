# Maintainer: Raansu <Gero3977@gmail.com>
# Contributors: Noel Maersk <veox at wemakethings dotnet>; Mike Lenzen <lenzenmi@gmail.com>

pkgname=litecoin-git
_gitname=litecoin
pkgver=v0.10.4.0.6.g623f20b
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
depends=('qt4' 'gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('litecoin' 'litecoin-qt' 'litecoind' 'litecoin-bin' 'litecoin-daemon')
conflicts=('litecoin' 'litecoin-qt' 'litecoind' 'litecoin-bin' 'litecoin-daemon')
source=('git://github.com/litecoin-project/litecoin.git'
        'https://github.com/litecoin-project/litecoin/pull/241.patch'
        'https://github.com/litecoin-project/litecoin/pull/251.patch')
sha256sums=('SKIP'
         '740a2519897e3d9953a6c0c1df09e9d4ce3dea2dd98243544914dd0bdf3f1d9f'
         '0a16e5a66d988ca8dabf86bf7c1002db5aa9c52a7107fe3a2f6941c4b03c5b58')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags| sed "s/-/./g"
}

prepare() {
    cd "$srcdir/$_gitname"
    git apply "$srcdir"/241.patch 
    git apply "$srcdir"/251.patch
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure
   make

}

package() {
	# install litecoin-qt client
	msg2 'Installing litecoin-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/litecoin-qt" "$pkgdir/usr/bin/litecoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/litecoin128.xpm" "$pkgdir/usr/share/pixmaps/litecoin128.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian-litecoin/litecoin-qt.desktop"
	
	# install litecoin-daemon
	msg2 'Installing litecoin-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/litecoind" "$pkgdir/usr/bin/litecoind"
	install -Dm644 "$srcdir/$_gitname/contrib/debian-litecoin/examples/litecoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/litecoin.conf"
	install -Dm644 "$srcdir/$_gitname/contrib/debian-litecoin/manpages/litecoin-qt.1" "$pkgdir/usr/share/man/man1/litecoin-qt.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian-litecoin/manpages/litecoind.1" "$pkgdir/usr/share/man/man1/litecoind.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian-litecoin/manpages/litecoin.conf.5" "$pkgdir/usr/share/man/man5/litecoin.conf.5"

	# install litcoin-cli
	msg2 'Installing litecoin-cli...'
	install -Dm755 "$srcdir/$_gitname/src/litecoin-cli" "$pkgdir/usr/bin/litecoin-cli"

	# install litecoin-tx
	msg2 'Installing litecoin-tx...'
	install -Dm755 "$srcdir/$_gitname/src/litecoin-tx" "$pkgdir/usr/bin/litecoin-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
