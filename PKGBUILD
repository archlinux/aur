# Maintainer: Simone Cimarelli <aquilairreale [AT] ymail [DOT] com>

_basename=drive
pkgname=$_basename-git
pkgver=v0.3.9.1.r51.gb868c96
pkgrel=1
pkgdesc="Google Drive client for the command line (development version)"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/odeke-em/$_basename"
license=("APACHE")
makedepends=("go")
source=("$_basename::git+https://github.com/odeke-em/$_basename.git#branch=master")
md5sums=("SKIP")
provides=("$_basename")
conflicts=("$_basename")

pkgver() {
    cd "$srcdir/$_basename"
    git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p go/src/github.com/odeke-em
    ln -rTsf "$_basename" "go/src/github.com/odeke-em/$_basename"
    export GOPATH="$srcdir/go"
    cd "go/src/github.com/odeke-em/$_basename"
    go get -v -d ./...
}

build() {
    export GOPATH="$srcdir/go"
    cd "go/src/github.com/odeke-em/$_basename"
    go install -v \
        -gcflags "all=-trimpath=$GOPATH" \
        -asmflags "all=-trimpath=$GOPATH" \
        -ldflags "-extldflags $LDFLAGS" \
        ./...
}

package() {
    install -Dm755 "$srcdir/go/bin/$_basename" "$pkgdir/usr/bin/$_basename"
}
