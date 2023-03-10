# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: oss@fastly.com

## GPG key: https://github.com/web-flow.gpg

pkgname=fastly
pkgver=8.0.0
pkgrel=1
pkgdesc='CLI for the Fastly platform'
url='https://github.com/fastly/cli'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'tomlq')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('A4C2C78656BA5E3DD5F122E4BCE379A5D550C407' ## Mark McDonnell (Integralist)
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

prepare() {
	cd "$pkgname"
	go mod download
	sed -i '/CGO_ENABLED=/s/0/1/g' Makefile
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname"
	make build \
		VERSION="$pkgver" \
		CLI_ENV="production" \
		GORELEASER_ARGS="--rm-dist --single-target" \
		GO_ARGS="${GOFLAGS}"
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -Dv fastly -t "$pkgdir/usr/bin/"
}
