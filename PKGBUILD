# Maintainer: Villager <villager@disroot.org>

pkgname=webtunnel-git
pkgver=r30.ae511e2
pkgrel=1
pkgdesc='Pluggable Transport based on HTTP Upgrade'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
provides=('webtunnel')
conflicts=('webtunnel')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd webtunnel
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd webtunnel

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o webtunnel-client ./main/client
	go build -o webtunnel-server ./main/server
}

package() {
	cd webtunnel

	install -Dm755 webtunnel-client -t "${pkgdir}/usr/bin/"
	install -Dm755 webtunnel-server -t "${pkgdir}/usr/bin/"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
