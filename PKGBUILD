# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

## GPG key: https://github.com/lawngnome.gpg
## GPG key: https://github.com/web-flow.gpg

pkgname=sourcegraph-cli
pkgver=4.1.1
_commit=c967c5e
pkgrel=1
pkgdesc='Command line interface to Sourcegraph'
url='https://github.com/sourcegraph/src-cli'
arch=('x86_64' 'aarch64')
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
provides=('src-cli')
conflicts=('src-cli')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('4C824CB6E018D60F90418A3CCDDA7B793B3E9A18' # Adam Harvey
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname"
	go build -o build ./cmd/src
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
	install -Dv build/src -t "$pkgdir/usr/bin/"
	ln -sv /usr/bin/src "$pkgdir/usr/bin/src-cli"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
