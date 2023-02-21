# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=virusgotal-git
pkgver=1.0.2.r5.g295d2dc
pkgrel=5
pkgdesc="VirusTotal zero dependency command line client."
arch=('x86_64')
url="https://github.com/moldabekov/virusgotal"
license=('MIT')
depends=()
makedepends=('go' 'git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/moldabekov"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"
	export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"

	if ! go get -v -t ./...; then
	test -f "go.mod" || go mod init

	sed -i -e '/.*kingpin.v2/c\\t"github.com/alecthomas/kingpin/v2"' main.go
	go mod tidy

	GO111MODULE=auto go get \
		github.com/alecthomas/kingpin/v2 \
		github.com/fatih/color \
		github.com/moldabekov/spinner
	fi
}

build() {
	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	mkdir -p build

	export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
	go build -trimpath -ldflags "-s -w" \
		-o build/virusgotal
}

package() {
	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	install -Dm755 "build/virusgotal" "${pkgdir}/usr/bin/virusgotal"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
