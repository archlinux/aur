# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=changie
pkgver=1.24.0
pkgrel=1
epoch=0
pkgdesc="Automated changelog tool for preparing releases with lots of customization options."
arch=('x86_64')
url="https://github.com/miniscruff/$pkgname"
license=('MIT')
depends=()
makedepends=('go' 'git')
conflicts=()
source=(
    "git+https://github.com/miniscruff/$pkgname#tag=v$pkgver"
)
sha256sums=(
    'SKIP'
)

prepare() {
    cd "$pkgname"
    mkdir -p "build/"
    case $CARCH in
        "x86_64")
            _GOARCH="amd64"
            ;;
        *)
            echo "Selected architecture is unsupported."
            exit 1
            ;;
    esac
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -o build \
        -buildmode=pie \
        -trimpath -ldflags="-linkmode=external -X main.version=$pkgver" \
        -mod=readonly \
        -modcacherw \
        .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
    cd "$pkgname"
    install -Dm0755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
