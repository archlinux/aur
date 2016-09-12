# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=verge-git
_gitname=VERGE
pkgver=r465.87922b3
pkgrel=2
pkgdesc="VERGE is the privacy focused & secure alternative to other cryptocurrencies. (git version)"
arch=('i686' 'x86_64')
url="http://vergecurrency.com/"
license=('MIT')
depends=('gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('pkg-config' 'git' 'qt5-webkit' 'qt5-base' 'qt5-tools' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('verge' 'verge-qt' 'verged' 'verge-bin' 'verge-daemon')
conflicts=('verge' 'verge-qt' 'verged' 'verge-bin' 'verge-daemon')
source=('git://github.com/vergecurrency/VERGE.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed "s/-/./g" ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/$_gitname"
	msg2 "Fixing verge-qt.desktop icons so we don't conflict with bitcoin"
	grep -rl Icon contrib/debian/verge-qt.desktop | xargs sed -i 's/bitcoin80/verge80/g'
	grep -rl Exec contrib/debian/verge-qt.desktop | xargs sed -i 's/verge-qt/VERGE-qt/g'
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure --with-gui=qt5
	make
}

package() {
	# install verge-qt client
	msg2 'Installing verge-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/VERGE-qt" "$pkgdir/usr/bin/VERGE-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/bitcoin80.xpm" "$pkgdir/usr/share/pixmaps/verge80.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/verge-qt.desktop"

	# install verge-daemon
	msg2 'Installing verge-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/VERGEd" "$pkgdir/usr/bin/VERGEd"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/novacoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/VERGE.conf"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/verged.1" "$pkgdir/usr/share/man/man1/verged.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/verge.conf.5" "$pkgdir/usr/share/man/man5/verge.conf.5"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
