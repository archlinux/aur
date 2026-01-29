# Maintainer: Sébastien Viande <sviande@gmail.com>
pkgname=grepai-git
pkgver=r130.98fc281
pkgrel=1
pkgdesc="Semantic Search & Call Graphs for AI Agents (100% Local)"
arch=('x86_64' 'aarch64')
url="https://yoanbernabeu.github.io/grepai/"
license=('MIT')
makedepends=('go>=1.24' 'git')
provides=('grepai')
conflicts=('grepai')
source=("${pkgname}::git+https://github.com/yoanbernabeu/grepai.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make build
}

package() {
    cd "${pkgname}"
    install -Dm755 bin/grepai "${pkgdir}/usr/bin/grepai"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
