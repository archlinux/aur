# Maintainer: Linus Karlsson <linus.karlsson@debricked.com>
pkgname=debricked
pkgver=2.1.9
pkgrel=1
pkgdesc="A CLI tool to interact with Debricked"
arch=('x86_64')
url="https://github.com/debricked/cli"
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a9671119b31dee8209f7ded8de8a164d29147e9d151e78dcac1f944c940c9c286a41b366a5fea7720e37b9e5c0fd6c6bdb22ff7b33229eca51dac2c9146ed515')

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

