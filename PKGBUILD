# Maintainer: Linus Karlsson <linus.karlsson@debricked.com>
pkgname=debricked
pkgver=2.1.4
pkgrel=1
pkgdesc="A CLI tool to interact with Debricked"
arch=('x86_64')
url="https://github.com/debricked/cli"
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5ddb2703d63bef6666a3ae4b826142f8810118b3d57c32737798f4ab01b943f8422b2499789ee40149287a25bdb15a12450edf13093fc7af5940d4583b2a11ba')

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

