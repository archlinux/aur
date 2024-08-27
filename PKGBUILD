# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

_pkgbase='worm'
pkgname='worm-git'
pkgdesc="A floating, tag-based window manager written in Nim"
pkgver=0.2.5.257.gbe59f19
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('nimble' 'nim' 'git')
depends=('xorg-server')
install=$_pkgbase.install
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')
provides=("worm")
conflicts=("worm")

pkgver() {
    cd "$_pkgbase"
    echo "$(grep '^version       =' worm.nimble|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgbase"
    nimble -y build -d:release --gc:arc --passC:"-Wno-error=incompatible-pointer-types"
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
    
    # docs
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgbase/README.md"
    install -Dm644 "docs/wormc.md" "$pkgdir/usr/share/doc/$_pkgbase/WORMC.md"
    
    # examples
    install -Dm755 "examples/rc" "$pkgdir/usr/share/doc/$_pkgbase/examples/rc"
    install -Dm644 "examples/sxhkdrc" "$pkgdir/usr/share/doc/$_pkgbase/examples/sxhkdrc"
    install -Dm755 "examples/jgmenu_run" "$pkgdir/usr/share/doc/$_pkgbase/examples/jgmenu_run"
}
