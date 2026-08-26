# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=javinizer
pkgver=1.5.1
pkgrel=1
pkgdesc="A metadata scraper and file organizer for JAV, with CLI, TUI, REST API, and a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/javinizer/javinizer-go"
license=('MIT')
makedepends=('go' 'git' 'make' 'npm')
provides=('javinizer')
conflicts=('javinizer-bin')
source=("${pkgname}::git+${url}/?tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_ENABLED=1
    cd web/frontend && npm install && cd ../..
    make build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 bin/javinizer "${pkgdir}/usr/bin/javinizer"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ./bin/javinizer completion bash 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/javinizer"
    ./bin/javinizer completion zsh 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_javinizer"
    ./bin/javinizer completion fish 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/javinizer.fish"
}
