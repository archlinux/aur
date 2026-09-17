# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

## GPG key: https://github.com/devdinu.gpg
## GPG key: https://github.com/lawngnome.gpg
## GPG key: https://github.com/burmudar.gpg
## GPG key: https://github.com/web-flow.gpg

pkgname=sourcegraph-cli
pkgver=8.0.0
pkgrel=1
pkgdesc='Command line interface to Sourcegraph'
url='https://github.com/sourcegraph/src-cli'
arch=(x86_64 aarch64)
license=(Apache-2.0)
depends=(glibc)
makedepends=(go git)
provides=(src-cli)
conflicts=(src-cli)
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('82f21c441b918b78e4fa70ddad54e41e365723742360a7545307de28debc2254')
validpgpkeys=('FFE6471128FB90BF5A2CB537977764A4DD435036' # Dinesh Kumar
              '4C824CB6E018D60F90418A3CCDDA7B793B3E9A18' # Adam Harvey
              '2E9B74BAD62664E6088C2935EDE8072F89D58CD9' # William Bezuidenhout
              '968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub

prepare() {
    cd "$pkgname"
    mkdir -p build
    export GOPATH="$srcdir"
    go mod download -modcacherw
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
    go test ./... -skip "TestFilterInvalidLines"
}

package() {
    cd "$pkgname"
    install -Dv build/src -t "$pkgdir/usr/bin/"
    ln -sv /usr/bin/src "$pkgdir/usr/bin/src-cli"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
