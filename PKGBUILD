# Maintainer: Indusy <indusywu@qq.com>

pkgname=ts-go-git
_gitname="${pkgname%-git}"
pkgver=0.0.0
pkgrel=2
pkgdesc="Native port of TypeScript written in Go"
url="https://github.com/microsoft/typescript-go"
arch=("x86_64")
license=("Apache-2.0")
provides=("ts-go")
conflicts=("ts-go")
makedepends=("git" "go" "nodejs" "npm")
source=("${_gitname}::git+$url.git")
sha256sums=("SKIP")
pkgver() {
    cd "${srcdir}/${_gitname}"
    g_commit_count=$(git rev-list --count HEAD)
    _commit_hash=$(git rev-parse --short HEAD)
    echo "${pkgver}.r${_commit_count}.${_commit_hash}"
}

prepare() {
    cd "${_gitname}"
    git submodule update --init --recursive
}

build() {
    cd "${_gitname}"
    npm ci
    npx hereby build
}

package() {
    cd "${_gitname}"
    install -Dm755 "$srcdir/${_gitname}/built/local/tsgo" "$pkgdir/usr/bin/tsgo"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
