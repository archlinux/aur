# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=nix-search-cli
pkgver=20240321
pkgrel=1
pkgdesc='CLI client for search.nixos.org/packages'
arch=('x86_64' 'aarch64')
url='https://github.com/peterldowns/nix-search-cli'
license=('MIT')
makedepends=('go')
source=("git+https://github.com/peterldowns/${pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    date +%Y%m%d
    #git describe --long --tags --abbrev=7 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    mkdir -p build/
}

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/nix-search
}

package() {
    cd "$pkgname"

    install -Dm755 build/nix-search "$pkgdir"/usr/bin/nix-search
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

