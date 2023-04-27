# Maintainer: José Luis Salvador Rufo <salvador.joseluis@gmail.com>

pkgname=godns
pkgver=2.9.7
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
makedepends=('go')
backup=(etc/conf.d/godns.json)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/archive/v${pkgver}.tar.gz")
sha256sums=('e30eaf84a5a1d82998523011fb5b4723fc7cfd6f0a2868f38eb9bfd8f34e0bc8')

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
