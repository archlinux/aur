# Maintainer: José Luis Salvador Rufo <salvador.joseluis@gmail.com>

pkgname=godns
pkgver=2.8.8
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
makedepends=('go')
backup=(etc/conf.d/godns.json)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/archive/v${pkgver}.tar.gz")
sha256sums=('d7939f7a5ab15cdee229d6d54db6598cc8ea370fbf667dea0b25d8816a744453')

build() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	go mod download \
		golang.org/x/crypto \
		golang.org/x/net
	CGO_ENABLED=0 GOOS=linux \
		go build \
		-gcflags "all=-trimpath=$srcdir" \
		-asmflags "all=-trimpath=$srcdir" \
		-ldflags "-extldflags ${LDFLAGS}" \
		cmd/godns/godns.go
	go clean -modcache
}

package() {
	install -Dm755 "${srcdir}"/$pkgname-$pkgver/godns "${pkgdir}/usr/bin/godns"
	install -Dm640 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.json "${pkgdir}/etc/conf.d/godns.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.json "${pkgdir}/usr/share/godns/config_sample.json"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/config_sample.yaml "${pkgdir}/usr/share/godns/config_sample.yaml"
	install -Dm644 "${srcdir}"/$pkgname-$pkgver/configs/systemd/godns.service "${pkgdir}/usr/lib/systemd/system/godns.service"
	sed -e 's/^\(ExecStart=\).*$/\1\/usr\/bin\/godns -c=\/etc\/conf.d\/godns.json/g' -i "${pkgdir}/usr/lib/systemd/system/godns.service"
}
