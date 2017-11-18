# Maintainer: Vic Luo <vicluo96 at gmail.com>

pkgname=cquery-git
_pkgname=cquery
pkgver=662.a60f93b
pkgrel=1
pkgdesc='Low-latency vscode language server for large C++ code-bases, powered by libclang.'
arch=('any')
url='https://github.com/jacobdufault/cquery/'
license=('MIT')
depends=('clang')
makedepends=("git" "python2")
source=('git+https://github.com/jacobdufault/cquery.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
    cd $_pkgname
    git submodule update --init --recursive
    sed -e "s/, '-Werror'//g" -i ./wscript
}

build() {
    cd $_pkgname
    python2 waf configure
    python2 waf build
}

check() {
    cd $_pkgname/build
    yes | ./app --test
}

package() {
    cd $_pkgname/build
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 ./app "${pkgdir}/usr/bin/cquery"
}
