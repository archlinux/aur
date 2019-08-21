# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cxo
projectname=skycoin
pkgdesc="CX Object Storage System for the Skycoin Blockchain"
pkgver=3.1.0
pkggopath="github.com/$projectname/$pkgname"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=('go' 'dep')
source=("https://$pkggopath/archive/v$pkgver.tar.gz")
sha256sums=('e4fc5221d89b0f548a0093c944829c0b3e94f96efcc339effc5fea34f4accbd3')

prepare() {

mkdir -p $srcdir/go/src/${pkggopath//$pkgname/} "$srcdir"/go/bin
ln -rTsf $srcdir/$pkgname-$pkgver $srcdir/go/src/$pkggopath
cd $srcdir/go/src/$pkggopath/
#git submodule --quiet update --init --recursive
export GOPATH="$srcdir"/go
export GOBIN=${GOPATH}/bin
export PATH=${GOPATH}/bin:${PATH}
msg2 'installing go dependencies'
#dep init
dep ensure
cd cmd
go install -v ./...
}

package() {
msg2 'installing CXO'
options=(!strip staticlibs)
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/lib/$projectname/go/bin
export GOPATH=$pkgdir/usr/lib/$projectname/go
export GOBIN=$pkgdir/usr/lib/$projectname/go/bin
cxobin="$srcdir"/go/bin
cxobins=$( ls $cxobin )
  for i in $cxobins; do
    install -Dm755 $srcdir/go/bin/$i $pkgdir/usr/lib/$projectname/go/bin/$i
    ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$i $pkgdir/usr/bin/$i
    chmod 755 $pkgdir/usr/bin/$i
  done
}
