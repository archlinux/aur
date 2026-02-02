pkgname=dnstt-git
pkgver=1.20241021.0.2.ge5e873b
pkgrel=1
pkgdesc='IP over DNS tunnel using UDP, DoT or DoH (like iodine)'
arch=('x86_64')
url="http://www.bamsoftware.com/software/dnstt"
license=('CC0-1.0')
makedepends=('go' 'git')
source=("git+https://www.bamsoftware.com/git/dnstt.git")
sha256sums=('SKIP')
provides=('dnstt')
conflicts=('dnstt')
pkgver() {
	cd dnstt
	git describe --long --tags --dirty | sed 's/^v//;s/-/./g'
}
build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd dnstt/dnstt-server
	go build
	cd ..
	cd dnstt-client
	go build
}
package() {
	cd dnstt
	install -Dm755 dnstt-server/dnstt-server "$pkgdir"/usr/bin/dnstt-server
	install -Dm755 dnstt-client/dnstt-client "$pkgdir"/usr/bin/dnstt-client
}
