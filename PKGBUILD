# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.11
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/terraformer'
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("d3f3710d15fcb75cda82d1c3d51e7ce37eeb059bc22351449d84f3b6d3fa2e43")

prepare(){
	cd "terraformer-${pkgver}"
	mkdir -p build/
}

build() {
	cd "terraformer-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build .
}

check() {
	cd "terraformer-${pkgver}"
	go test .
}

package() {
	cd "terraformer-${pkgver}"

	install -Dm755 "build/terraformer" "${pkgdir}/usr/bin/terraformer"

	sed -e 's|docs/waze-sre-logo.png|https://github.com/GoogleCloudPlatform/terraformer/blob/master/docs/waze-sre-logo.png|' -i README.md
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

