# Maintainer: Simone Cimarelli <aquilairreale [AT] ymail [DOT] com>

_basename=drive
pkgname=$_basename-git
pkgver=0.4.0.r4.gbede608
pkgrel=1
pkgdesc="Google Drive client for the command line (development version)"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/odeke-em/$_basename"
license=("APACHE")
makedepends=("git" "go>=1.9")
source=("$_basename::git+https://github.com/odeke-em/$_basename.git#branch=master"
        'qrcode.patch')
sha256sums=('SKIP'
            'd984022881f618a572ea39f55d143f34c634015c5119dd2a7194353d0323734b')
provides=("$_basename")
conflicts=("$_basename")

pkgver() {
    cd "$srcdir/$_basename"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p go/src/github.com/odeke-em
    ln -rTsf "$_basename" "go/src/github.com/odeke-em/$_basename"
    export GOPATH="$srcdir/go"
    cd "go/src/github.com/odeke-em/$_basename"
    go get -v -d ./...
    chmod -R u+w "$srcdir/go"
    patch -p1 -N -i "$srcdir/qrcode.patch" -d "$srcdir/$_basename"
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
