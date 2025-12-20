# Maintainer: Integral <integral@member.fsf.org>

pkgname=gxu-net-autologin
_srcname=GXU-Net-AutoLogin
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatic campus network authentication at Guangxi University"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Chocola-X/${_srcname}"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('38adfc35c93366c0abba22ebcefb8af225b20334c8f6679f993fee06e54b2f6f')

prepare() {
	cd "${_srcname}-${pkgver}/"
	sed -i "/configFileName =/s|config.txt|/etc/${pkgname}/config.txt|" main.go 
	mkdir -p build
}

build() {
	cd "${_srcname}-${pkgver}/"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build main.go
}

package() {
	cd "${_srcname}-${pkgver}/"
	install -Dm755 build/main "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 config.txt -t "${pkgdir}/etc/${pkgname}/"
}
