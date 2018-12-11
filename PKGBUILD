# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=git-bug-git
pkgver=0.4.0.r29.gc92da55
pkgrel=1
pkgdesc='Distributed bug tracker embedded in Git'
arch=('x86_64' 'i686')
url="https://github.com/MichaelMure/${pkgname%-git}"
license=('GPL3')
depends=('git')
makedepends=('go-pie' 'dep')
optdepends=('xdg-utils: open bugs in browser')
provides=('git-bug')
conflicts=('git-bug')
source=("git+${url}.git")
sha256sums=('SKIP')

_gitbugsrc="gopath/src/${url#*://}"

pkgver(){
    cd "${srcdir}/${_gitbugsrc}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    mkdir -p "${srcdir}/${_gitbugsrc%/*}"
    ln -rTsf "${srcdir}/${pkgname%-git}" "${srcdir}/${_gitbugsrc}"

    export GOPATH="${srcdir}/gopath"
    cd "${srcdir}/${_gitbugsrc}"
    dep ensure
}

build() {
    export GOPATH="${srcdir}/gopath"
    cd "${srcdir}/${_gitbugsrc}"
    go generate .
    go install \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-extldflags ${LDFLAGS}" \
        ./...
    }

check() {
    export GOPATH="${srcdir}/gopath"
    cd "${srcdir}/${_gitbugsrc}"
    go test -bench=. ./...
}

package() {
    install -Dm755 "${srcdir}/gopath/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    cd "${srcdir}/${_gitbugsrc}"
    install -Dm644 doc/man/*.1                  -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 README.md doc/*.md           -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 misc/bash_completion/git-bug -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 misc/zsh_completion/git-bug  -T "${pkgdir}/usr/share/zsh/site-functions/_git-bug"
}
