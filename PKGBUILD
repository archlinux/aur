# Maintainer: José Luis Salvador Rufo <salvador.joseluis@gmail.com>

pkgname=godns
pkgver=3.3.4
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
makedepends=('go' 'make' 'npm')
backup=(etc/conf.d/godns.json)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/archive/v${pkgver}.tar.gz")
sha256sums=('d7c10bdeddfdfb3cc1a51e26dc594e5cc7175128badaecddf31020cf55c5e18e')

build() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	install -Dm755 "${srcdir}"/$pkgname-$pkgver/godns "${pkgdir}/usr/bin/godns"
	install -Dm640 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.json "${pkgdir}/etc/conf.d/godns.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.json "${pkgdir}/usr/share/godns/config_sample.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.yaml "${pkgdir}/usr/share/godns/config_sample.yaml"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/systemd/godns.service "${pkgdir}/usr/lib/systemd/system/godns.service"
	sed -e 's/^\(ExecStart=\).*$/\1\/usr\/bin\/godns -c=\/etc\/conf.d\/godns.json/g' -i "${pkgdir}/usr/lib/systemd/system/godns.service"
}
