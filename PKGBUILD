# Maintainer: hunkyburrito <hunkyburrito@protonmail.com>
pkgname=go-grip-git
pkgver=v0.5.6.r0.gac5f2a7
pkgrel=1
pkgdesc='lightweight, Go-based tool designed to render Markdown files locally, replicating GitHub'\''s style'
url="https://github.com/chrishrb/go-grip"
arch=('x86_64')
license=('MIT')
provides=('go-grip')
depends=('glibc')
makedepends=('go' 'git')
optdepends=()
source=("${pkgname%-git}::git+$url.git")
sha512sums=('SKIP')
conflicts=('go-grip')

prepare () {
    cd "${srcdir}/${pkgname%-git}"
    mkdir -p build
}

pkgver () {
    cd "${pkgname%-git}"
    (
         set -o pipefail
         git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-s -ldflags=-w -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}" LICENSE
    install -Dm755 build/${pkgname%-git} "${pkgdir}"/usr/bin/"${pkgname%-git}"
}
