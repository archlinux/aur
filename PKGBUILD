# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=lmt
pkgver=0.0.1
pkgrel=1
pkgdesc="Run applications with resource limits (CPU, memory, cores) enforced using cgroupsv2 on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/Rohansjamadagni/lmt"
license=('LicenseRef-unknown')
depends=('glibc' 'systemd')
makedepends=('go>=1.20')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88432a16264209c6f561a90072bbc600fb1d90f44431d44c95a5d23431daec60')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/$pkgname-build" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
