# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.6.1
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
sha256sums=('99e3e3365e8506308cfee110573bd7b3c906d5d98da6ddd2783181a0437c65a1')

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

