# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=git-bug-git
pkgver=0.7.0.r6.g05c968ca
pkgrel=1
pkgdesc='Distributed bug tracker embedded in Git'
arch=('x86_64')
url="https://github.com/MichaelMure/${pkgname%-git}"
license=('GPL3')
depends=('git')
makedepends=('go-pie')
optdepends=('xdg-utils: open bugs in browser')
provides=('git-bug')
conflicts=('git-bug')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    export GOPATH=${srcdir}
    go mod vendor -v
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export GOPATH=${srcdir}
    commands_path='github.com/MichaelMure/git-bug/commands'
    go generate
    go build \
        -mod=vendor \
        -trimpath \
        -ldflags "-X ${commands_path}.GitCommit=$(git rev-list -1 HEAD) \
                  -X ${commands_path}.GitLastTag=$(git describe --abbrev=0 --tags) \
                  -X ${commands_path}.GitExactTag=$(git name-rev --name-only --tags HEAD) \
                  -extldflags ${LDFLAGS}"
    }

check() {
    cd "${srcdir}/${pkgname%-git}"
    export GOPATH=${srcdir}
    go test -mod=vendor -bench=. ./...
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 "${pkgname%-git}"               -t "${pkgdir}/usr/bin"
    install -Dm644 doc/man/*.1                     -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 README.md doc/*.md              -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 misc/bash_completion/git-bug    -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 misc/zsh_completion/git-bug     -T "${pkgdir}/usr/share/zsh/site-functions/_git-bug"
}
