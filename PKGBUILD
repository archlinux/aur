# Maintainer: Sean Anderson <seanga2@gmail.com>
# Contributor: Roman Saveljev <roman.saveljev@haltian.com>
pkgname=kconfig-frontends
pkgver=4.11.0.1
pkgrel=2
pkgdesc='Out of the Linux source tree, packaging of the kconfig infrastructure, ready for use by third party projects'
arch=('x86_64' 'i686')
url="https://bitbucket.org/nuttx/tools/"
license=('GPL')
depends=('python' 'perl')
makedepends=('gperf')
source=("https://bitbucket.org/nuttx/tools/downloads/$pkgname-$pkgver.tar.bz2"
	"gperf_3.1.patch::https://bitbucket.org/nuttx/tools/downloads/gperf3.1_kconfig_id_lookup.patch"
        "kconfig-config2h")
noextract=()
md5sums=('635538534a016d66ca1223512f5fc424'
         'ff705ec02d96e7d82b4c5a80e891c36e'
         '6596064684b8d2bca25e8fec3e265adf')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -N --strip=1 < "${srcdir}/gperf_3.1.patch"
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
