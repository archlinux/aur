# Maintainer: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Raansu <gero3977@gmail.com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>
# Clams original code by nochowderforyou <https://github.com/nochowderforyou>

pkgname='clam-git'
_gitname=clams
pkgver=1.4.5.265.ge15b722
pkgrel=1
arch=('any')
url="http://www.clamclient.com"
depends=('qt4' 'miniupnpc' 'db4.8' 'boost-libs' 'qrencode')
makedepends=('pkg-config' 'git' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
license=('MIT')
pkgdesc="The most widely held crypto-currency ever! This package provides both the GUI QT4 and daemon clients."
provides=('clam-qt' 'clamd')
conflicts=('clam-qt' 'clamd')
source=("git://github.com/nochowderforyou/clams.git"
        "https://github.com/bitcoin/bitcoin/commit/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch")
sha256sums=('SKIP'
            '0910004577764c2251a33c4868c7358a42da68f94d6462e44bbcb1945cefd748')

pkgver() {
        cd "$srcdir/$_gitname"
        git describe | sed "s/^v//; s/-/./g"
}

prepare() {
    cd "$srcdir/$_gitname"
    patch -Np1 -i "$srcdir"/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch
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
	install -D -m755 "$srcdir/$_gitname/src/qt/clam-qt" "$pkgdir/usr/bin/clam-qt"

	# install clam daemon
	install -D -m755 "$srcdir/$_gitname/src/clamd" "$pkgdir/usr/bin/clamd"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
