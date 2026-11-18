# Maintainer: Ivan
# Based on the official extra/cliphist PKGBUILD (Caleb Maclennan, Luis Aleman Vazquez)

pkgname=cliphist-git
_pkgname=cliphist
pkgver=0.7.0.r14.gf968c4f
pkgrel=1
pkgdesc='wayland clipboard manager (git version, configurable -max-store-size)'
arch=(i686 x86_64)
url="https://github.com/sentriz/$_pkgname"
license=(GPL-3.0-only)
depends=(glibc
         wl-clipboard)
makedepends=(git go)
optdepends=('xdg-utils: image and mime inferance')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --match 'v*' | sed 's/^v//;s/-\([0-9]*\)-g/.r\1.g/'
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build \
		-ldflags "-linkmode external -extldflags '$LDFLAGS'" \
		-o "$_pkgname"
}

check() {
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm644 "contrib/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
}
