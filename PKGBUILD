# Maintainer: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Raansu <gero3977@gmail.com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>
# Clams original code by nochowderforyou <https://github.com/nochowderforyou>

pkgname='clam-git'
_gitname=clams
pkgver=1.4.5.273.g304677d
pkgrel=3
arch=('any')
url="http://www.clamclient.com"
depends=('qt4' 'miniupnpc' 'db4.8' 'boost-libs' 'qrencode')
makedepends=('pkg-config' 'git' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
license=('MIT')
pkgdesc="The most widely held crypto-currency ever! This package provides both the GUI QT4 and daemon clients."
provides=('clam-qt' 'clamd')
conflicts=('clam-qt' 'clamd')
source=("git://github.com/nochowderforyou/clams.git"
        "http://github.com/nochowderforyou/clams/pull/295.patch")
sha256sums=('SKIP'
            '121528e6e76c30379b9041f62058e719d2f054f5e8df69c7540b924195f38331')

pkgver() {
        cd "$srcdir/$_gitname"
        git describe | sed "s/^v//; s/-/./g"
}

prepare() {
    cd "$srcdir/$_gitname"
    git apply "$srcdir"/295.patch
}

build() {
	cd "$srcdir/$_gitname"
    CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1 -UUPNPDISCOVER_SUCCESS"
    ./autogen.sh
    ./configure
    make
}

package() {
	# install clam-qt client
	msg2 'Installing clam-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/clam-qt" "$pkgdir/usr/bin/clam-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/clams80.xpm" "$pkgdir/usr/share/pixmaps/clams80.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/clam-qt.desktop"

	# install clam daemon
	msg2 'Installing clam-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/clamd" "$pkgdir/usr/bin/clamd"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/clam.conf" "$pkgdir/usr/share/doc/$pkgname/examples/clam.conf"
 	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/clamd.1" "$pkgdir/usr/share/man/man1/clamd.1"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/clam.conf.5" "$pkgdir/usr/share/man/man5/clam.conf.5"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
