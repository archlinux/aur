# Maintainer: Avenge Media <avengemediallc at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=dux-gop-git
_pkgname=dux-gop
_binname=dgop
pkgver=2.0.0.r1.gc1dbfaf
pkgrel=1
pkgdesc='System monitoring CLI + REST API (git)'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/duxlabs-dev/$_pkgname"
license=(MIT)
depends=(glibc)
makedepends=(git
             go)
provides=("$_binname=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_binname" "$_pkgname" dgop-git)
replaces=(dgop-git)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p gomodcache
}

build() {
	cd "$_pkgname"
	export GOMODCACHE="$srcdir/gomodcache"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$_binname" "./cmd/$_binname"
}

check() {
	cd "$_pkgname"
	export GOMODCACHE="$srcdir/gomodcache"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go test ./... || true
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_binname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
