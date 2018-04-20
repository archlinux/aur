# Maintainer: Mario Hros <m-aur@k3a.me>

_userid=511
_username=carbon

pkgname=go-carbon
pkgver=0.12.0
pkgrel=1
pkgdesc="Golang implementation of Graphite/Carbon server with classic architecture: Agent -> Cache -> Persister"
arch=(i686 x86_64)
url='https://github.com/lomik/go-carbon'
license=('MIT')
conflicts=("$_pkgname-git")
options=('!strip')
depends=(glibc)
makedepends=('go>=1.8')
source=($pkgname-$pkgver.tar.gz::https://github.com/lomik/go-carbon/archive/v$pkgver.tar.gz
		go-carbon.conf.diff)
sha256sums=('2661492a9b0209977548ef86340f606e29630ab9d5d971bdf745d4b30495875c'
            '174654ee0dfc98b220fa5be85365fce3a07fb94400ae8aecf5ae79e8af620758')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	patch -p1 -i "${srcdir}/go-carbon.conf.diff" 
	make all package-tree BUILD="$pkgver"
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"

	mkdir -p "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"	
	echo "u $_username $_userid \"$pkgname user\" /var/lib/graphite" > "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
	echo "d /var/log/go-carbon 0750 $_username daemon - -"	> "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
	echo "d /var/lib/graphite 0700 $_username - - -" >> "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm0755 "./go-carbon" "${pkgdir}/usr/bin/go-carbon"
	cp -rfa "./build/root"/etc "${pkgdir}/"
	cp -rfa "./build/root"/lib "${pkgdir}/usr/lib"
}

