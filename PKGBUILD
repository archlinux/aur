# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.3.2
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
sha256sums=('48f2ed3c9fc4154e110dbcdb55ee30b7fc5caa2ecf5f169ef2975dce638c4395')

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

