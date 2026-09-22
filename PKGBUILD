# Source of truth for the AUR package: the release workflow copies this file to
# https://aur.archlinux.org/packages/yson-tools with pkgver/pkgrel bumped and
# regenerates .SRCINFO there. Edit it here, not in the AUR repository.

# Maintainer: Denis Sheremet <aur@lxlz.space>
pkgname=yson-tools
pkgver=0.4.0
pkgrel=1
pkgdesc="A set of tools for working with YSON format"
arch=('x86_64' 'aarch64')
url="https://github.com/lesf0/yson-tools"
license=('Apache-2.0')
depends=('python-jsondiff')
makedepends=('git' 'go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("git+https://github.com/lesf0/yson-tools.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GOPATH="$srcdir"/go
    mkdir -p "$GOPATH"/src/github.com/lesf0/
    ln -sf "$srcdir/yson-tools" "$GOPATH"/src/github.com/lesf0/yson-tools

    cd "$GOPATH"/src/github.com/lesf0/yson-tools/yson-convert
    go build -o yson-convert .

    # ysonq reports the version it was built from
    cd ../ysonq
    go build -ldflags "-X main.version=$pkgver" -o ysonq .
}

package() {
    install -Dm755 "go/src/github.com/lesf0/yson-tools/yson-convert/yson-convert" "${pkgdir}/usr/bin/yson-convert"
    install -Dm755 "go/src/github.com/lesf0/yson-tools/ysonq/ysonq" "${pkgdir}/usr/bin/ysonq"
    install -Dm755 "${srcdir}/yson-tools/yson-format" "${pkgdir}/usr/bin/yson-format"
    install -Dm755 "${srcdir}/yson-tools/ysondiff" "${pkgdir}/usr/bin/ysondiff"
}
