# Maintainer: beelzy
pkgname=kame-tools-git
pkgver=5ae1ae1
pkgrel=3
pkgdesc="A tool for bundling 3DS theme files"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/beelzy/kame-tools"
license=('MIT')
makedepends=('git' 'zip')
depends=('gcc-libs')

_gitroot='https://gitlab.com/beelzy/kame-tools.git'
_gitname='kame-tools'

source=("git+${_gitroot}"
        "git+https://github.com/Steveice10/buildtools.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git log --pretty=format:"%h" -1
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule init
    git config submodule.buildtools.url $srcdir/buildtools
    git submodule sync
    git -c protocol.file.allow=always submodule update
    cd buildtools
    git apply ../aarch64.patch
}

build() {
    cd "$srcdir/$_gitname"
    make BUILD_FLAGS="$LDFLAGS"
}

package() {
    install -D "$srcdir/$_gitname/output/linux-$CARCH/kame-tools" "$pkgdir/usr/bin/kame-tools"
    install -Dm644 "$srcdir/$_gitname/LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
