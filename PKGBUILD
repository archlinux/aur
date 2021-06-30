# Maintainer: Simone Cimarelli <aquilairreale [AT] ymail [DOT] com>

_basename=goi3autowname
pkgname=$_basename-git
pkgver=0.2.r9.g351c6b3
pkgrel=1
pkgdesc="i3 workspace auto rename"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/tbellembois/$_basename"
license=("APACHE")
makedepends=("git" "go>=1.9")
source=("$_basename::git+https://github.com/tbellembois/$_basename.git#branch=master")
sha256sums=('SKIP')
provides=("$_basename")
conflicts=("$_basename")

pkgver() {
    cd "$srcdir/$_basename"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p go/src/github.com/tbellembois
    ln -rTsf "$_basename" "go/src/github.com/tbellembois/$_basename"
    export GOPATH="$srcdir/go"
    cd "go/src/github.com/tbellembois/$_basename"
    go get -v -d ./...
    chmod -R u+w "$srcdir/go"
}

build() {
    export GOPATH="$srcdir/go"
    cd "go/src/github.com/tbellembois/$_basename"
    go install -v \
        -gcflags "all=-trimpath=$GOPATH" \
        -asmflags "all=-trimpath=$GOPATH" \
        -ldflags "-extldflags $LDFLAGS" \
        ./...
}

package() {
    install -Dm755 "$srcdir/go/bin/$_basename" "$pkgdir/usr/bin/$_basename"
}
