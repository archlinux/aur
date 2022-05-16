# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=changie
pkgver=1.7.0
pkgrel=1
epoch=0
pkgdesc="Automated changelog tool for preparing releases with lots of customization options."
arch=('x86_64')
url="https://github.com/miniscruff/changie"
license=('MIT')
depends=()
makedepends=('go')
conflicts=()
source=("git+https://github.com/miniscruff/changie#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    mkdir -p "src/github.com/miniscruff"
    mv "changie" "src/github.com/miniscruff/changie"
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
    cd "$srcdir/src/github.com/miniscruff/changie"
    GOOS=linux \
    GOARCH=${_GOARCH} \
    GOARM=${_GOARM} \
    CGO_ENABLED=0 \
    GOPATH="$srcdir" \
    go build \
        -modcacherw \
        -o "$srcdir/changie" \
        -gcflags "all=-trimpath=$srcdir" \
        -asmflags "all=-trimpath=$srcdir" \
        -ldflags "-extldflags ${LDFLAGS} -X main.version=$pkgver" \
        "github.com/miniscruff/changie"
}

package() {
    install -Dm0755 "$srcdir/changie" "$pkgdir/usr/bin/changie"
}
