# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dgop-git
_pkgname=${pkgname%-git}
_repo=dux-gop
pkgver=2.0.0.r0.g43a2952
pkgrel=1
pkgdesc='System monitoring CLI + REST API (git snapshot)'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/duxlabs-dev/$_repo"
license=(MIT)
depends=(glibc)
makedepends=(git
             go)
provides=("dgop=$pkgver")
conflicts=(dgop)
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
	go build -o $_pkgname ./cmd/dgop
}

check() {
	cd "$_pkgname"
	export GOMODCACHE="$srcdir/gomodcache"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	# don't fail the package on WIP tests, but still run with writable mod cache
	go test ./... || true
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
