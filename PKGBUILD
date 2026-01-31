# Maintainer: Eric Vogt <eric@vogt.dev>
pkgname=faustus-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI for browsing and previewing Claude Code sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/Fuwn/faustus"
license=('GPL-3.0')
makedepends=('go' 'git')
provides=('faustus')
conflicts=('faustus')
source=("${pkgname}::git+https://github.com/Fuwn/faustus.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    if tag=$(git describe --tags --abbrev=0 2>/dev/null); then
        echo "${tag#v}"
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o faustus .
}

package() {
    cd "${pkgname}"
    install -Dm755 faustus "${pkgdir}/usr/bin/faustus"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
