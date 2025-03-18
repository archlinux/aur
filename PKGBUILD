# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=pixfmtdb-git
_pkgname=pixfmtdb
pkgver=r58.5cc8038d9b27
pkgrel=1
pkgdesc='A pixel format database'
arch=('x86_64')
url='https://gitlab.freedesktop.org/emersion/pixfmtdb'
license=('MIT')
makedepends=('git' 'go')
provides=('pixfmtdb')
conflicts=('pixfmtdb')
source=(
	"git+https://gitlab.freedesktop.org/emersion/pixfmtdb.git"
	"pixfmtdb.service"
)
sha256sums=(
	'SKIP'
	'203158db28c695a541a6fccd666958f3b7a5aa57b1ec0f3b2b4f3d644cc95994'
)

pkgver() {
	cd "$srcdir/pixfmtdb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pixfmtdb"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o pixfmtdb .
}

package() {
	cd "$srcdir/pixfmtdb"
	install -Dm755 pixfmtdb "$pkgdir/usr/bin/pixfmtdb"
	install -Dm644 "$srcdir/pixfmtdb.service" "$pkgdir/usr/lib/systemd/system/pixfmtdb.service"
}
