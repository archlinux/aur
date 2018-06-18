# Maintainer: Muhkoenig

pkgname=("operator-sdk-git")
pkgver=r386.a719b04
pkgrel=1
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
arch=("x86_64")
url="https://github.com/operator-framework/operator-sdk"
license=("apache")
makedepends=("git" "go" "make" "dep")
provides=("operator-sdk")
conflicts=("operator-sdk")
source=("git+https://github.com/operator-framework/operator-sdk.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${provides}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "${srcdir}/build/src/github.com/operator-framework/"
    ln -sf "${srcdir}/operator-sdk" "${srcdir}/build/src/github.com/operator-framework/"
}

build() {
    export GOPATH="${srcdir}/build/"
    cd "${srcdir}/build/src/github.com/operator-framework/operator-sdk/"
    make dep
    make install
}

package() {
    install -Dm755 "${srcdir}/build/bin/operator-sdk" "${pkgdir}/usr/bin/${provides}"
    install -Dm644 "${srcdir}/operator-sdk/LICENSE" "{$pkgdir}/usr/share/licenses/${provides}/LICENSE"
}
