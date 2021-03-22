# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>
# Contributor: David Vogt <d@408.ch>

pkgname=git-bug
pkgver=0.7.2
pkgrel=1
pkgdesc='Distributed bug tracker embedded in Git'
arch=('x86_64')
url="https://github.com/MichaelMure/${pkgname%-git}"
license=('GPL3')
depends=('git')
makedepends=('go')
optdepends=('xdg-utils: open bugs in browser')
source=("git+${url}.git#commit=cc4a93c8ce931b1390c61035b888ad17110b7bd6")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname%-git}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    local commands_path='github.com/MichaelMure/git-bug/commands'
    go generate
    go build \
        -mod=readonly \
        -buildmode=pie \
        -trimpath \
        -ldflags "-X ${commands_path}.GitCommit=$(git rev-list -1 HEAD) \
                  -X ${commands_path}.GitLastTag=$(git describe --abbrev=0 --tags) \
                  -X ${commands_path}.GitExactTag=$(git name-rev --name-only --tags HEAD) \
                  -extldflags \"${LDFLAGS}\""
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 "${pkgname%-git}"               -t "${pkgdir}/usr/bin"
    install -Dm644 doc/man/*.1                     -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 README.md doc/*.md              -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 misc/bash_completion/git-bug    -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 misc/zsh_completion/git-bug     -T "${pkgdir}/usr/share/zsh/site-functions/_git-bug"
}
