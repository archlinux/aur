# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Triangulum Labs <triangulumlabs@gmail.com>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=libusrsctp-git
pkgver=0.9.5.0.r41.g1ade45c
pkgrel=2
pkgdesc='A portable SCTP userland stack'
arch=(x86_64 i686)
url='https://github.com/sctplab/usrsctp'
license=(BSD)
makedepends=(cmake git)
conflicts=("${pkgname%-git}" usrsctp-git)
provides=("${pkgname%-git}=$pkgver" usrsctp-git)
replaces=(usrsctp-git)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	unset CPPFLAGS
	export CFLAGS="$CFLAGS -fPIC"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		.
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
