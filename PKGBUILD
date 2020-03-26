# Maintainer: Sean Anderson <seanga2@gmail.com>
# Contributor: Roman Saveljev <roman.saveljev@haltian.com>
pkgname=kconfig-frontends
pkgver=4.11.0.1
pkgrel=1
pkgdesc='Out of the Linux source tree, packaging of the kconfig infrastructure, ready for use by third party projects'
arch=('x86_64' 'i686')
url="https://bitbucket.org/nuttx/tools/"
license=('GPL')
depends=('python' 'perl')
makedepends=('gperf')
source=("https://bitbucket.org/nuttx/tools/downloads/$pkgname-$pkgver.tar.bz2"
	"size_t.patch::https://bitbucket.org/nuttx/tools/downloads/$pkgname-3.12.0-sizet.patch"
        "kconfig-config2h")
noextract=()
md5sums=('635538534a016d66ca1223512f5fc424'
         '3a9507925fd25bd58cef05baae5a0712'
         '6596064684b8d2bca25e8fec3e265adf')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	echo | cat "${srcdir}/size_t.patch" - | patch -N --strip=1 
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -fi
	./configure --prefix=/usr --enable-frontends=mconf,conf,nconf
	make
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 -t ${pkgdir}/usr/bin kconfig-config2h
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
