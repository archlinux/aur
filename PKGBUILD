# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=slit-git
pkgver=1.3.0.r8.gd18e9c3
pkgrel=1
pkgdesc='A modern PAGER for viewing logs, get more than most in less time'
arch=(x86_64)
url="https://github.com/tigrawap/slit"
license=(MIT)
makedepends=(go)
conflicts=(slit)
provides=(slit)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/tigrawap/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tigrawap/slit"
}

build() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	export GOPATH="${srcdir}/go"

	mkdir -p build
	go build -o build/slit \
		-trimpath -modcacherw -ldflags "-s -w" \
		./cmd/slit
}

package() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	install -Dm755 "build/slit" "${pkgdir}/usr/bin/slit"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
