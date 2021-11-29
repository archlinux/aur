# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

_pkgbase='worm'
pkgname='worm-git'
pkgdesc="A floating, tag-based window manager written in Nim"
pkgver=0.1.0.108.g815be87
pkgrel=1
arch=('x86_64')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('nimble' 'nim' 'git')
depends=('xorg-server')
install=$_pkgbase.install

source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    echo "$(grep '^version       =' worm.nimble|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgbase"
    nimble -y build -d:release --gc:arc
}

package() {
    cd "$_pkgbase"

    # bin
    install -D -m755 "worm" "$pkgdir/usr/bin/worm"
    install -D -m755 "wormc" "$pkgdir/usr/bin/wormc"

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"

    # X session file
    install -Dm644 "assets/worm.desktop" "$pkgdir/usr/share/xsessions/worm.desktop"
}
