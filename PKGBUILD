# Maintainer: Eric Vogt <eric@vogt.dev>
pkgname=faustus-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI for browsing and previewing Claude Code sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/Fuwn/faustus"
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
provides=('faustus')
conflicts=('faustus')
source=("${pkgname}::git+https://github.com/Fuwn/faustus.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    # Try git tag first, then extract from Taskfile.yaml, fallback to commit
    git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || \
    grep -oP 'VERSION:\s*\K[0-9.]+' Taskfile.yaml 2>/dev/null || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Man page
    install -Dm644 man/faustus.1 "${pkgdir}/usr/share/man/man1/faustus.1"

    # Shell completions
    install -Dm644 completions/faustus.zsh "${pkgdir}/usr/share/zsh/site-functions/_faustus"
    install -Dm644 completions/faustus.bash "${pkgdir}/usr/share/bash-completion/completions/faustus"
    install -Dm644 completions/faustus.fish "${pkgdir}/usr/share/fish/vendor_completions.d/faustus.fish"
}
