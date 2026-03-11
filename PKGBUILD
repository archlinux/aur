# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-git"
pkgver=v0.1.4.r0.ga5637f4
pkgrel=1
pkgdesc="Dune Analytics CLI"
arch=('x86_64' 'aarch64')
makedepends=('go' 'glibc')
url="https://github.com/duneanalytics/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_ENABLED=1
    go build -v -trimpath -buildmode=pie \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o dune ./cmd
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
