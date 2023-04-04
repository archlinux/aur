# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=apx
pkgver=1.8.1
pkgrel=1
pkgdesc='Wrapper around multiple package managers to install packages and run commands inside a managed container'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/apx'
license=(GPL3)
depends=(
	distrobox
	glibc
)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('bfec4cd8f8b7e1a866344f2d146309edaf6744c99fea0cfce570a9a48054112db880a4dcafe8472aa44cf4e8ce17ce92b3d8c2ed1b22ec05be67eb30009ddaed')

prepare(){
	cd "${pkgname}-${pkgver}"
	mkdir -p build/
	sed -i 's|ubuntu|archlinux|g;s|apt|pacman|g;s|share/apx|bin|g' config/config.json
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

check() {
	cd "${pkgname}-${pkgver}"
	go test
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "config/config.json" "${pkgdir}/etc/apx/config.json"
}
