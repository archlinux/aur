# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=verge-git
_gitname=VERGE
pkgver=r465.87922b3
pkgrel=3
pkgdesc="VERGE is the privacy focused & secure alternative to other cryptocurrencies. (git version)"
arch=('i686' 'x86_64')
url="http://vergecurrency.com/"
license=('MIT')
depends=('gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('pkg-config' 'git' 'qt5-webkit' 'qt5-base' 'qt5-tools' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('verge' 'verge-qt' 'verged' 'verge-bin' 'verge-daemon')
conflicts=('verge' 'verge-qt' 'verged' 'verge-bin' 'verge-daemon')
source=('git://github.com/vergecurrency/VERGE.git'
        'https://github.com/vergecurrency/VERGE/pull/40.patch')
sha256sums=('SKIP'
            'c608694554c0f303bb0e0f1f8357a1b375a37146a0e59f938866166e2ac0a594')

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
	git apply "$srcdir"/40.patch
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
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/verge80.xpm" "$pkgdir/usr/share/pixmaps/verge80.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/VERGE-qt.desktop"

	# install verge-daemon
	msg2 'Installing verge-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/VERGEd" "$pkgdir/usr/bin/VERGEd"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/VERGE.conf" "$pkgdir/usr/share/doc/$pkgname/examples/VERGE.conf"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/VERGEd.1" "$pkgdir/usr/share/man/man1/VERGEd.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/VERGE.conf.5" "$pkgdir/usr/share/man/man5/VERGE.conf.5"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
