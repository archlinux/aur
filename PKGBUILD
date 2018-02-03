# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch-alpha-git
pkgrel=1
pkgver=05557ee31a34414087a0e38db389e15118e462b4
epoch=
pkgdesc="A utility to that uses containerd to build stateless operating system images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/godarch/darch"
license=('MIT')
groups=()
depends=('libseccomp')
makedepends=('go')
checkdepends=()
optdepends=()
provides=('containerd', 'runc')
conflicts=('containerd', 'runc', 'darch')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/godarch/darch.git#branch=develop")
md5sums=('SKIP')
noextract=()
validpgpkeys=()
_gourl=github.com/google/codesearch

pkgver() {
    local git_sha=`git --git-dir $srcdir/darch/.git rev-parse HEAD`
    echo "$git_sha"
}

build() {
    rm -rf "$srcdir/src/github.com/godarch"
    mkdir -p "$srcdir/src/github.com/godarch"
    mv "$srcdir/darch" "$srcdir/src/github.com/godarch"
    export GOPATH="$srcdir"
    export GOBIN="$srcdir/bin"
    export PATH=$PATH:$GOBIN
    cd "$srcdir/src/github.com/godarch/darch"
    make ci BUNDLE_RUNTIME="yes"
}

package() {
    local arch=`go env GOARCH`
    tar -xzpf "$srcdir/src/github.com/godarch/darch/output/darch-$arch-with-runtime.tar.gz" -C "$pkgdir"
}
