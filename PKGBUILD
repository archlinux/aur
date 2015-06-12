# Maintainer: Rohit Agrawal <rohit at rohitagr dot com>

_pkgname=tunsocks
pkgname=tunsocks-git
pkgver=r3.19662d0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="User-level IP forwarding and SOCKS proxy for VPNs that provide tun-like interface"
license=('BSD')
depends=('libpcap')
makedepends=('git')
url="https://github.com/russdill/tunsocks"
source=('git+https://github.com/russdill/tunsocks.git' 'git://git.sv.gnu.org/lwip.git' )
sha1sums=('SKIP' 'SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.lwip.url "$srcdir/lwip"
	git submodule update
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install

	install -D -m0644 "$srcdir/lwip/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

