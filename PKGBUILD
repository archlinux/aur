# Maintainer: José Luis Salvador Rufo <salvador.joseluis@gmail.com>

pkgname=godns
pkgver=2.5.1
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
makedepends=('go')
backup=(etc/conf.d/godns.json)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/archive/v${pkgver}.tar.gz")
sha256sums=('5ad25dffe3874cf257efece6b95a81b6d18f4117bc132e61cd43eb364fbe70c1')

build() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	go mod download \
		golang.org/x/crypto \
		golang.org/x/net
	CGO_ENABLED=0 GOOS=linux GO111MODULE=on \
		go build \
		-gcflags "all=-trimpath=$srcdir" \
		-asmflags "all=-trimpath=$srcdir" \
		-ldflags "-extldflags ${LDFLAGS}" \
		cmd/godns/godns.go
	go clean -modcache
}

package() {
	install -Dm755 "${srcdir}"/$pkgname-$pkgver/godns "${pkgdir}/usr/bin/godns"
	install -Dm640 "${srcdir}"/$pkgname-$pkgver/config_sample.json "${pkgdir}/etc/conf.d/godns.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/config_sample.json "${pkgdir}/usr/share/godns/config_sample.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/systemd/godns.service "${pkgdir}/usr/lib/systemd/system/godns.service"
	sed -e 's/^\(ExecStart=\).*$/\1\/usr\/bin\/godns -c=\/etc\/conf.d\/godns.json/g' -i "${pkgdir}/usr/lib/systemd/system/godns.service"
}
