# Maintainer: René Wagner <rwa at clttr dot info>
# Contributor: Rafael Ascensão <rafa dot almas at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=git-bug-git
pkgver=v0.8.0.r187.g20e62977
pkgrel=1
pkgdesc='Distributed bug tracker embedded in Git'
arch=('x86_64')
url="https://github.com/MichaelMure/${pkgname%-git}"
license=('GPL3')
depends=('git')
makedepends=('go')
optdepends=('xdg-utils: open bugs in browser')
provides=('git-bug')
conflicts=('git-bug')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

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
    install -Dm644 doc/*.md              -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 misc/completion/bash/git-bug    -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 misc/completion/zsh/git-bug     -T "${pkgdir}/usr/share/zsh/site-functions/_git-bug"
}
