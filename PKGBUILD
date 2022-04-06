# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=docker-compose-cli
pkgver=1.0.23
pkgrel=1
pkgdesc="Easily run your Compose application to the cloud with compose-cli"
arch=('x86_64')
url="https://github.com/docker/compose-cli"
license=(Apache)
source=("https://github.com/docker/compose-cli/archive/refs/tags/v${pkgver}.tar.gz")
depends=('docker')
makedepends=('go')
sha256sums=('132ac0ddd77bf8b302a735dafde04f522143517a5974449e42d6b90b5d009242')

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
	go build -o build ./cli/...
}

check() {
	cd "compose-cli-$pkgver"

#	go test ./...
}

package() {
	cd "compose-cli-$pkgver"

	install -Dm755 build/cli "$pkgdir"/usr/bin/$pkgname
}
