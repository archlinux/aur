# Maintainer: larte <lauri.arte@gmail.com>
pkgname=k8stail
pkgver=0.6.0
pkgrel=1
pkgdesc="Watch kubernetes logstreams filtering with namespace and labels, like tail -f"
arch=('x86_64' 'i686')
url="https://github.com/dtan4/k8stail"
license=('MIT')
depends=('glibc')
makedepends=('go' 'go-bindata' 'make' 'glide')
_archive=k8stail-$pkgver
source=($_archive.tar.gz::https://github.com/dtan4/k8stail/archive/v$pkgver.tar.gz)
md5sums=('18b257d9b02e7c4602b2641a00f7cca9')


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

        make deps
        make install
        #GOPATH=$srcdir/go go install -ldflags="-s -w -X \"main.Version=$pkgver\" -X \"main.Revision=aur-pkgbuild\""
}

check() {
        cd $srcdir/go/src/github.com/dtan4/$_archive
        GOPATH="$srcdir/go" make test
}

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -p -m755 "$srcdir/bin/$pkgname-$pkgver" "$pkgdir/usr/bin/k8stail"
   install -Dm644 $srcdir/$_archive/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
