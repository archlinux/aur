# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Denis Meiswinkel <denis.meiswinkel@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=dee-fixed
_pkgname=dee
pkgver=1.2.7
pkgrel=9
pkgdesc="Model to synchronize multiple instances over DBus."
arch=("i686" "x86_64")
url="https://launchpad.net/dee"
license=("LGPL")
depends=("glib2" "icu")
provides=("dee")
conflicts=("dee")
makedepends=("gobject-introspection" "python2" "vala")
source=(
	"https://launchpad.net/${_pkgname}/1.0/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
	# Adapted from https://bugs.launchpad.net/dee/+bug/1579529/+attachment/4658709/+files/fix-misleading-indentation.patch
	"fix-misleading-indentation.patch"
)
sha256sums=('1bf0336ce684aa0f48d6eae2469628c1a9b43695a77443bc31a5790aa673bf8a'
            '01a23a135e9cd8cc23c11e62a0c08a4d6e6fb328a4f74f9ada7ac4cf91888854')

prepare() {
	cd ${_pkgname}-${pkgver}
	patch -p1 -i ../fix-misleading-indentation.patch
}

build() {
	cd ${_pkgname}-${pkgver}
	export PYTHON="/usr/bin/python2"
	./configure --prefix="/usr" --sysconfdir="/etc" --localstatedir="/var" --disable-{static,tests}
	make
}

package() {
	cd $_pkgname-$pkgver
	make DESTDIR="${pkgdir}" install

# Is this useful? Fedora does not include these.
#  # Install GI overrides for python 3 as well
#  install -dm 755 "${pkgdir}"/usr/lib/python3.3/site-packages/gi/overrides
#  ln -s ../../../../python2.7/site-packages/gi/overrides/Dee.py "$pkgdir/usr/lib/python3.3/site-packages/gi/overrides/Dee.py"
}

# vim: ts=2 sw=2 et:
