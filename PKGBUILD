# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: fossdd <fossdd@tutanota.com>

pkgname=ijq-git
_pkgname=${pkgname%-git}
pkgver=1.1.2.r1.g88f0d9a
pkgrel=1
pkgdesc='Interactive jq tool, like jqplay for the commandline'
url="https://git.sr.ht/~gpanders/$_pkgname"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(jq)
makedepends=(go
             git
             scdoc)
provides=("ijq=$pkgver")
conflicts=(ijq)
source=("git+https://git.sr.ht/~gpanders/ijq")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export GOPATH="$srcdir"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\" -X main.Version=$pkgver" \
		. ./...
	make docs
}

check() {
	cd "$_pkgname"
	export GOPATH="$srcdir"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$_pkgname.1"
}
