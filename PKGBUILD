# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=docker-compose-cli
pkgver=1.0.32
pkgrel=1
pkgdesc="Easily run your Compose application to the cloud with compose-cli"
arch=('x86_64')
url="https://github.com/docker/compose-cli"
license=(Apache)
source=("https://github.com/docker/compose-cli/archive/refs/tags/v${pkgver}.tar.gz")
depends=('docker')
makedepends=('go')
sha256sums=('02d84445cbff3304e020c7672580f1607dd8c0c06e06ab1974ad6e5ce7557fe5')

prepare(){
	cd "compose-cli-$pkgver"

	sed -i 's#com.docker.cli#docker#' \
		cli/mobycli/exec.go \
		api/context/store/storedefault.go

	mkdir -p build/
}

build() {
	cd "compose-cli-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build \
		-o build \
		-ldflags="-X github.com/docker/compose-cli/internal.Version=${pkgver}" \
		./cli/...
}

check() {
	cd "compose-cli-$pkgver"

#	go test ./...
}

package() {
	cd "compose-cli-$pkgver"

	install -Dm755 build/cli "$pkgdir"/usr/bin/$pkgname
}
