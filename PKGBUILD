# Maintainer: Mario Hros <m-aur@k3a.me>

pkgname=go-carbon
pkgver=0.17.1
pkgrel=1
pkgdesc="Golang implementation of Graphite/Carbon server with classic architecture: Agent -> Cache -> Persister"
arch=(i686 x86_64)
url='https://github.com/go-graphite/go-carbon'
license=('MIT')
depends=(glibc)
makedepends=('go>=1.14')
backup=(etc/go-carbon/go-carbon.conf
		etc/go-carbon/storage-{aggregation,schemas}.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/go-graphite/go-carbon/archive/v$pkgver.tar.gz
		go-carbon-dynamicuser.diff)
sha256sums=('32ed6c1298f52eaea06689a497c55c0f6aa7961a7db9b9373fb343f5eabecc4d'
            'dceef1378a24a7acf7677284ee52f86e197fadeeab87b3c289cc0ac5741add9d')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	cp go-carbon.conf.example deploy/go-carbon.conf
	make BUILD="$pkgver"
	mkdir out
	mv ./go-carbon ./out/go-carbon-linux-amd64
	make package-tree
	(cd "out/root/lib/systemd/system" && patch -p1 <"${srcdir}/go-carbon-dynamicuser.diff")
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"

	install -Dm0755 "./out/go-carbon-linux-amd64" "${pkgdir}/usr/bin/go-carbon"
	cp -rfa "./out/root"/etc "${pkgdir}/"
	cp -rfa "./out/root"/lib "${pkgdir}/usr/"
}

# vim:set ts=4 sw=4 noet:
