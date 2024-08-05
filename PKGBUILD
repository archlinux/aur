# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.5.0
pkgrel=1
pkgdesc="Build system for firmware images for several open source firmware solutions"
url="https://github.com/9elements/firmware-action"
arch=(x86_64)
license=(MIT)
makedepends=(
	'go'
	'upx'
)
depends=(
	'docker'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e2fe9e13dc05cd193ba07ee5921847ee0c596b5508cd31405d4f17e819745407')

check(){
	cd "${pkgname}-${pkgver}/action"
	go test -short -race -timeout 60m -shuffle=on ./...
}

build() {
	cd "${pkgname}-${pkgver}/action"
	go build -ldflags="-s -w" -o "${pkgname}"
	upx -9 "${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

