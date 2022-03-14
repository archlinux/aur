# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: oss@fastly.com

pkgname=fastly
pkgver=1.7.1
pkgrel=1
pkgdesc='CLI for the Fastly platform'
url='https://github.com/fastly/cli'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname::git+$url#tag=v$pkgver?signed"
        'Makefile.patch')
sha256sums=('SKIP'
            'f16a46642b72d46388a0838cb19cf61b0873b1754edbc7acf4e4535f6adda63f')
validpgpkeys=('A4C2C78656BA5E3DD5F122E4BCE379A5D550C407') ## Mark McDonnell (Integralist)

prepare() {
	cd "$pkgname"
	patch -p1 < "$srcdir/Makefile.patch"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	VERSION="$pkgver" CLI_ENV="production" make fastly
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D fastly -t "$pkgdir/usr/bin/"
}
