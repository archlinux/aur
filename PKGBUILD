# Maintainer: Linus Karlsson <linus.karlsson@debricked.com>
pkgname=debricked
pkgver=2.1.10
pkgrel=1
pkgdesc="A CLI tool to interact with Debricked"
arch=('x86_64')
url="https://github.com/debricked/cli"
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1826c39a497edd68e02bc5613c02bda7cddc7860803e1cef91023f417c5468615afdedacbac46b67d9726e62cb56831c747129c8e77f0aed3cff2cc6b5772a01')

prepare() {
	cd "cli-$pkgver"

	# download dependencies
	go mod download
	go mod verify
}

build() {
	cd "cli-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	(cd cmd/debricked && go generate -v -x)
	go build -ldflags "-X main.version=${pkgver}" -o debricked ./cmd/debricked
}

package() {
	cd "cli-$pkgver"
	install -Dpm 0755 debricked "$pkgdir/usr/bin/debricked"
	install -Dpm 0644 LICENSE "$pkgdir/usr/share/licenses/debricked/LICENSE"
}

