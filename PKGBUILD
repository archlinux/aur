# Maintainer: Linus Karlsson <linus.karlsson@debricked.com>
pkgname=debricked
pkgver=1.8.10
pkgrel=1
pkgdesc="A CLI tool to interact with Debricked"
arch=('x86_64')
url="https://github.com/debricked/cli"
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('123f5ebda002faba757334c8d8ba8c674314ec6c4df0cc13fb7892f93c6ea7a1fd9cd3a3a9141351933bb07b7fc66b5c199f7230e5bb6e7f9fcd9ab9beab35b1')

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
	go build -o debricked ./cmd/debricked
}

package() {
	cd "cli-$pkgver"
	install -Dpm 0755 debricked "$pkgdir/usr/bin/debricked"
	install -Dpm 0644 LICENSE "$pkgdir/usr/share/licenses/debricked/LICENSE"
}

