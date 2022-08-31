# Maintainer: hashworks <hashworks@archlinux.org>

pkgname=paperless-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="A golang command line binary to interact with a Paperless instance"
license=('Apache')
arch=('x86_64')
url='https://github.com/stgarf/paperless-cli'
depends=('glibc')
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2dfa01695c97c8cfc3db862565fe90c56d81e317e885e45a7da38dfd6bf723ea')

prepare(){
	cd "paperless-cli-${pkgver}"
	mkdir -p build/
}

build() {
	cd "paperless-cli-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	importPath="github.com/stgarf/paperless-cli/cmd"

	go build -ldflags "-X ${importPath}.Version=${pkgver} -X ${importPath}.BuildDate=$(date -Im) -X ${importPath}.GitCommit=v${pkgver} -X ${importPath}.GitState=clean -X ${importPath}.GitBranch=tag" -o build .
}

check() {
	cd "paperless-cli-${pkgver}"
	go test .
}

package() {
	cd "paperless-cli-${pkgver}"

	install -Dm755 "build/paperless-cli" "${pkgdir}/usr/bin/paperless-cli"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

