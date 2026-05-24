# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=Skirk
pkgname=skirk-desktop
pkgver=0.1.55
pkgrel=2
pkgdesc="Socks over Google Drive"
arch=("any")
url="https://github.com/ShahabSL/Skirk"
license=("MIT")
depends=("gtk3" "webkit2gtk-4.1")
makedepends=("git" "go" "make" "npm" "cargo")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('d5ca685b2d1f979db1561f4f865bced93cfc1ea843f3fd5cb930b89a73a984d1')
conflicts=('skirk')
provides=('skirk')

prepare() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    mkdir -p bin
    go build -o bin/${pkgname/-desktop} \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
              -extldflags \"$LDFLAGS\"" \
    ./cmd/${pkgname/-desktop/}

    cd ./clients/desktop/
    npm ci --cache "${srcdir}/npm-cache" --ignore-scripts --no-audit --no-fund
    npm run tauri build -- --no-bundle
    npm prune --omit=dev --cache "${srcdir}/npm-cache"
}

test() {
    cd "${srcdir}/${_pkgname}"
    go test ./...
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 755 "bin/${pkgname/-desktop}" "${pkgdir}/usr/bin/${pkgname/-desktop}"
    install -D -m 755 "clients/desktop/src-tauri/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
