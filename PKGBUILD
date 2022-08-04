# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=chigo-git
pkgver=1.4.0.r2.gb3cb538
pkgrel=1
pkgdesc='Lolcat port for Golang'
url="https://github.com/UltiRequiem/chigo"
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

	install -m755 -d "${srcdir}/go/src/github.com/UltiRequiem/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/UltiRequiem/chigo"
}

build() {
	cd "${srcdir}/go/src/github.com/UltiRequiem/chigo"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	go build \
		-trimpath -modcacherw -ldflags "-s -w " \
		-o build/chigo
}

package() {
	cd "${srcdir}/go/src/github.com/UltiRequiem/chigo"

	install -Dm755 "build/chigo" "${pkgdir}/usr/bin/chigo"
	install -Dm644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
