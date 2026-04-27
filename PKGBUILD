# Maintainer: Guru <anjanaya@gmail.com>
pkgname=bleamd-git
pkgver=r29.g03516a4
pkgrel=1
pkgdesc="Standalone Markdown renderer for the terminal with search, hyperlinks, and extensive customization"
arch=('x86_64' 'aarch64')
url="https://github.com/guttermonk/bleamd"
license=('MIT')
provides=('bleamd')
conflicts=('bleamd')
makedepends=('git' 'go')
source=("${pkgname}::git+https://github.com/guttermonk/bleamd.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( git describe --long --tags --abbrev=7 2>/dev/null \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" \
    ) | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    local commit
    commit=$(git rev-parse --short=7 HEAD)
    go build -ldflags "-X main.GitCommit=${commit}" -o bleamd .
}

package() {
    cd "${pkgname}"
    install -Dm755 bleamd "${pkgdir}/usr/bin/bleamd"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
