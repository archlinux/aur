# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.17
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/terraformer'
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a14a3e275a585f921c937ee923291733c9cafa19d774aab90535818ad21ccdef')

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

