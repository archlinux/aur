# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on `fastly` by Luis Martinez <luis.martinez@disroot.org>
# Contributor: oss@fastly.com

_pkgname=fastly
pkgname="$_pkgname-git"
pkgver=r1071.gfc70ca57
pkgrel=1
pkgdesc='CLI for the Fastly platform'
url='https://github.com/fastly/cli'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'rust')
provides=('fastly')
conflicts=('fastly-bin' 'fastly')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	go mod download
	sed -i '/CGO_ENABLED=/s/0/1/g' Makefile
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname"
	make build \
		VERSION="$pkgver" \
		CLI_ENV="production" \
		GORELEASER_ARGS="--rm-dist --single-target" \
		GO_ARGS="${GOFLAGS}"
	./fastly --completion-script-bash > fastly.bash
	./fastly --completion-script-zsh > _fastly
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dv fastly -t "$pkgdir/usr/bin/"
	install -Dvm644 fastly.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dvm644 _fastly -t "$pkgdir/usr/share/zsh/site-functions/"
}
