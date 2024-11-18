# Maintainer: gao <gao66 at sdf dot org>

pkgname=cronicle-git
_pkgname=Cronicle
pkgver=v0.9.61.r494.g48490e0
pkgrel=1
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
install="$pkgname.install"
source=("git+$url.git")
sha256sums=(SKIP)
backup=('opt/cronicle/conf/config.json')

conflicts=('cronicle')
provides=('cronicle')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.r%s.g%s" "$(git tag --sort=-v:refname | head -n 1)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/opt/cronicle"
    cp -a ./* "$pkgdir/opt/cronicle/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE.md

    rm -rf "$pkgdir/opt/cronicle/.git"
}

