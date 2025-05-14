# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>

pkgname=up-git
pkgver=0.4.r2.g840f23c
pkgrel=1
license=('Apache-2.0')
pkgdesc="A tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('x86_64')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url")
sha1sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	mkdir build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$pkgname"
	go build -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		-o build \
		.
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$pkgname"

	go test -v ./...
}

package() {
	cd "$pkgname"

	install -vDm755 -t "$pkgdir/usr/bin" build/up

	install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

