# Maintainer: Georg Pichler <georg.pichler@gmail.com>

pkgname=go-carbon
pkgver=0.19.1
pkgrel=1
pkgdesc="Golang implementation of Graphite/Carbon server with classic architecture: Agent -> Cache -> Persister"
arch=(i686 x86_64)
url='https://github.com/go-graphite/go-carbon'
license=('MIT')
depends=(glibc)
makedepends=('go>=1.14')
backup=(etc/go-carbon/go-carbon.conf
		etc/go-carbon/storage-{aggregation,schemas}.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/go-graphite/go-carbon/archive/refs/tags/v$pkgver.tar.gz
		go-carbon-dynamicuser.diff)
sha256sums=('e0eed27caf75d3fc37cbbc0082757cad3a2113f2652fa2afff53ad63c9d3b3d4'
            'd296c161fbad820c90fc25cdea8c1a8bf1c99d737fb2fc016978fbc006a3fa4d')

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
