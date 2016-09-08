# Maintainer: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Raansu <gero3977@gmail.com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>
# Clams original code by nochowderforyou <https://github.com/nochowderforyou>

pkgname='clam-git'
_gitname=clams
pkgver=1.4.5.273.g304677d
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
        "diff.patch")
sha256sums=('SKIP'
      
'35bf3c157717e8d6376c3a15b18297b6dadf842f5aff79c9243e26b77bbb1bb6')

pkgver() {
        cd "$srcdir/$_gitname"
        git describe | sed "s/^v//; s/-/./g"
}

prepare() {
    cd "$srcdir/$_gitname"
    patch -Np1 -i "$srcdir"/diff.patch
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
