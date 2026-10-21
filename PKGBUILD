# Maintainer: Jaime Martínez Rincón <mrjaime1999@gmail.com>
pkgname=tailbridge-git
pkgver=r24.c6853e7
pkgrel=1
pkgdesc='Expose individual devices across a LAN and a Tailscale tailnet (IPv4 aliases, NAT and per-device /32 routes)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/jamezrin/tailbridge'
license=('MIT')
depends=('glibc' 'nftables' 'tailscale')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

prepare() {
	cd "${pkgname%-git}"
	export GOPATH="${srcdir}/gopath"
	export GOTOOLCHAIN=local
	export GOFLAGS='-modcacherw'
	go mod download
}

build() {
	cd "${pkgname%-git}"
	export GOPATH="${srcdir}/gopath"
	export GOTOOLCHAIN=local
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	go build -o build/tailbridge \
		-ldflags "-linkmode=external -X main.version=${pkgver}" \
		./cmd/tailbridge
}

check() {
	cd "${pkgname%-git}"
	export GOPATH="${srcdir}/gopath"
	export GOTOOLCHAIN=local
	export GOFLAGS='-mod=readonly -modcacherw'
	go test ./internal/...
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 build/tailbridge "${pkgdir}/usr/bin/tailbridge"
	sed 's|/usr/local/bin/tailbridge|/usr/bin/tailbridge|' contrib/systemd/tailbridge.service |
		install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/tailbridge.service"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 docs/USAGE.md "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
