# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
pkgver=1.9.2
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.13")
source=(
	"https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
	"03-build_version_time.patch"
)
sha256sums=(
	"b49f082391380ac66e1e90f147594d7c3772a3b9eddb042f04b338083ae40e33"
	SKIP
	SKIP
	SKIP
)
options=("!buildflags")

# Won't allow installing of both patched and original version.
conflicts=("roadrunner-leo-patched")

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	cd "$pkgname-$pkgver"
	patch -p1 < $srcdir/03-build_version_time.patch
	go mod download
	make
}

check() {
	export GOPATH="$srcdir"/gopath
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin/" -m755 rr
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
