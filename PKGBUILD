# Maintainer: Linus Karlsson <linus.karlsson@debricked.com>
pkgname=debricked
pkgver=2.0.2
pkgrel=1
pkgdesc="A CLI tool to interact with Debricked"
arch=('x86_64')
url="https://github.com/debricked/cli"
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c5902bc3651176612cb6f772a7f9a897600d6f922f7d7cf768f2fb16bd11ce6efb27f4aff40aea94e1c68e16fbd787904376aa4aa5aa77e2fdbeff4e5a55c99d')

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

