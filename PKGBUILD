# Maintainer: Mario Hros <m-aur@k3a.me>

pkgname=go-carbon
pkgver=0.15.6
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
		go-carbon.conf.diff
		go-carbon-dynamicuser.diff)
sha256sums=('411c132cc70b981a44283268f9ece9a00d684253fcdefc282272609d68beea4e'
            '174654ee0dfc98b220fa5be85365fce3a07fb94400ae8aecf5ae79e8af620758'
            'dceef1378a24a7acf7677284ee52f86e197fadeeab87b3c289cc0ac5741add9d')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	patch -p1 -i "${srcdir}/go-carbon.conf.diff"
	make all BUILD="$pkgver"
	mv ./go-carbon ./build/go-carbon-linux-amd64
	make package-tree
	(cd "build/root/lib/systemd/system" && patch -p1 <"${srcdir}/go-carbon-dynamicuser.diff")
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"

	install -Dm0755 "./build/go-carbon-linux-amd64" "${pkgdir}/usr/bin/go-carbon"
	cp -rfa "./build/root"/etc "${pkgdir}/"
	cp -rfa "./build/root"/lib "${pkgdir}/usr/"
}

# vim:set ts=4 sw=4 noet:
