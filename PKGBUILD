# Maintainer: maze <maze@pyth0n.org>

pkgver=3.0.2.r0.g7354e4e
pkgrel=1
pkgdesc="Pacman repository manager"
pkgname=pkgrepo
url="https://git.maze.io/maze/pkgrepo"
arch=('x86_64')
license=('MIT')
builddepends=('go' 'git')
source=('git+https://git.maze.io/maze/pkgrepo.git')
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname && git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir
    mkdir -p go/git.maze.io/maze
    pushd go/git.maze.io/maze
    ln -sf $srcdir/$pkgname
    popd
    GOPATH="$srcdir/go" go get -v git.maze.io/maze/$pkgname
}

build() {
    GOPATH="$srcdir/go" make -C $srcdir/$pkgname clean all DESTDIR=$srcdir/build
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m0755 "$srcdir/build/pkgrepo" "$pkgdir/usr/bin/pkgrepo"
}
