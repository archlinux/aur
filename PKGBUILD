# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=docker-credential-atcr-git
pkgver=0.1.4.r46.g5aa13ab
pkgrel=1
pkgdesc="Docker credential helper for ATCR (AT Container Registry)"
arch=('x86_64' 'aarch64')
url="https://atcr.io"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("docker-credential-atcr=$pkgver-$pkgrel")
conflicts=('docker-credential-atcr')
options=('!debug')
source=("$pkgname::git+https://tangled.org/did:plc:pddp4xt5lgnv2qsegbzzs4xg/at-container-registry.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    # On main the helper is a separate module that imports atcr.io/pkg/credhelper,
    # so it only builds in workspace mode. Drop the scanner, deploy and seamark
    # modules upstream's go.work also lists.
    rm -f go.work go.work.sum
    go work init . ./cmd/credential-helper/atcr

    mkdir -p build
}

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # -ldflags here replaces the one from GOFLAGS, so repeat -linkmode=external.
    go build -o build/docker-credential-atcr \
        -ldflags "-linkmode=external \
                  -X main.version=$pkgver \
                  -X main.commit=$(git rev-parse HEAD) \
                  -X main.date=$(date -u -d "@$SOURCE_DATE_EPOCH" +%Y-%m-%d)" \
        ./cmd/credential-helper/atcr
}

check() {
    cd "$pkgname"

    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go test ./pkg/credhelper/... ./cmd/credential-helper/atcr/...
}

package() {
    cd "$pkgname"

    install -Dm755 build/docker-credential-atcr "$pkgdir/usr/bin/docker-credential-atcr"
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 INSTALLATION.md "$pkgdir/usr/share/doc/$pkgname/INSTALLATION.md"
}
