# Maintainer: René 'r3j0' Jochum <r3j0@jochum.dev>

pkgname=leafwiki-git
pkgver=r1034.f98ab206
pkgrel=1
pkgdesc="Lightweight self-hosted wiki with Markdown files on disk"
arch=('x86_64' 'aarch64')
url="https://github.com/perber/leafwiki"
license=('MIT')
makedepends=('git' 'go>=1.26' 'nodejs>=26' 'npm')
provides=('leafwiki')
conflicts=('leafwiki-bin')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-mod=readonly -modcacherw"
    go mod download

    cd ui/leafwiki-ui
    npm ci --ignore-scripts
}

build() {
    cd "${pkgname%-git}"

    cd ui/leafwiki-ui
    VITE_API_URL=/ APP_VERSION="$pkgver" npm run build
    cd ../..

    # go:embed requires the built frontend to already be in place before `go build`.
    rm -rf internal/http/dist
    mkdir -p internal/http/dist
    cp -r ui/leafwiki-ui/dist/. internal/http/dist/

    export GOPATH="${srcdir}"
    export CGO_ENABLED=0
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"

    go build \
      -ldflags="-s -w -X github.com/perber/wiki/internal/http.EmbedFrontend=true -X github.com/perber/wiki/internal/http.Environment=production" \
      -o bin/leafwiki ./cmd/leafwiki
}

check() {
    cd "${pkgname%-git}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-mod=readonly -modcacherw"
    go test ./...
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 bin/leafwiki "${pkgdir}/usr/bin/leafwiki"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
