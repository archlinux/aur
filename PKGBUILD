# Maintainer: Sébastien Viande <sviande@gmail.com>
pkgname=grepai-git
pkgver=0.24.1.r0.g98fc281
pkgrel=1
pkgdesc="Semantic Search & Call Graphs for AI Agents (100% Local)"
arch=('x86_64' 'aarch64')
url="https://yoanbernabeu.github.io/grepai/"
license=('MIT')
makedepends=('go>=1.24' 'git')
optdepends=('ollama: for local LLM embeddings')
provides=('grepai')
conflicts=('grepai')
source=("${pkgname}::git+https://github.com/yoanbernabeu/grepai.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    local _version
    _version=$(git describe --tags --abbrev=0 | sed 's/^v//')
    go build \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external -s -w -X main.version=${_version}" \
        -o bin/grepai ./cmd/grepai
}

package() {
    cd "${pkgname}"
    install -Dm755 bin/grepai "${pkgdir}/usr/bin/grepai"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
