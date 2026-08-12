# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=docker-credential-atcr
pkgver=0.1.4
pkgrel=1
pkgdesc="Docker credential helper for ATCR (AT Container Registry)"
arch=('x86_64' 'aarch64')
url="https://atcr.io"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!debug')
_repo="https://tangled.org/did:plc:pddp4xt5lgnv2qsegbzzs4xg/at-container-registry"
source=("$pkgname::git+$_repo.git#tag=v$pkgver")
sha256sums=('b6a2d7ce72c9826c810bc81ddb83c6704c15baa246b502a9b8ff0f0212c1aa61')

prepare() {
    cd "$pkgname"

    # Workspace mode would merge in the unrelated scanner and deploy modules;
    # the credential helper is part of the root module.
    rm -f go.work go.work.sum

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
        ./cmd/credential-helper
}

check() {
    cd "$pkgname"

    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go test ./cmd/credential-helper/...
}

package() {
    cd "$pkgname"

    install -Dm755 build/docker-credential-atcr "$pkgdir/usr/bin/docker-credential-atcr"
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 INSTALLATION.md "$pkgdir/usr/share/doc/$pkgname/INSTALLATION.md"
}
