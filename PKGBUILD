# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=lemonade-git
pkgver=1.1.2.r0.gfb41f18
pkgrel=2
pkgdesc='A remote utility tool (copy, paste and open browser) over TCP.'
url="https://github.com/lemonade-command/lemonade"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/lemonade-command/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/lemonade-command/lemonade"
}

build() {
	cd "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	mkdir -p build
	export GOPATH="${srcdir}/go" GO111MODULE="auto"

	go build -trimpath -modcacherw \
		-ldflags "-s -w -X github.com/lemonade-command/lemonade/lemon.Version=${pkgver}" \
		-o build/lemonade
}

package() {
	cd "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	install -Dm755 "build/lemonade" "${pkgdir}/usr/bin/lemonade"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
