# Maintainer: larte <lauri.arte@gmail.com>
pkgname=k8stail
pkgver=0.7.0
pkgrel=2
pkgdesc="Watch kubernetes logstreams filtering with namespace and labels, like tail -f"
arch=('x86_64' 'i686')
url="https://github.com/dtan4/k8stail"
license=('MIT')
depends=('glibc')
makedepends=('go' 'go-bindata' 'make')
_archive=k8stail-$pkgver
source=($_archive.tar.gz::https://github.com/dtan4/k8stail/archive/v$pkgver.tar.gz)
md5sums=('f4d8cb3b40d4ca62ad0757047006d1f7')


prepare() {
     cd $srcdir/$_archive
     msg2 "Patching makefile"
     sed -i -e 's/REVISION.*:=.*/REVISION := "aur-pkgbuild"/' Makefile

     msg2 "mkdir -p $srcdir/go/src/github.com/dtan4"
     mkdir -p $srcdir/go/src/github.com/dtan4

     msg2 "ln -sf $srcdir/$_archive $srcdir/go/src/github.com/dtan4/$archive"
     ln -sf $srcdir/$_archive $srcdir/go/src/github.com/dtan4/$archive
}

build() {
        cd $srcdir/go/src/github.com/dtan4/$_archive
        export GOPATH=$srcdir/go
        export GOBIN="$srcdir/bin"
        export PATH=$PATH:$GOPATH/bin

        make install
}

check() {
        cd $srcdir/go/src/github.com/dtan4/$_archive
        GOPATH="$srcdir/go" make test
}

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -p -m755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/k8stail"
   install -Dm644 $srcdir/$_archive/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
