# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=djictl-git
_pkgname=${pkgname%-git}
pkgver=r17.ddeced5
pkgrel=1
pkgdesc='CLI to manage your DJI Osmo device via BLE and without DJI MIMO'
arch=(x86_64)
url="https://github.com/xaionaro-go/$_pkgname"
license=(CC0-1.0)
depends=(glibc)
makedepends=(git go)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	go mod download
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	go build -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		"./cmd/$_pkgname"
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
