# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Owner/Cofntributer: Paul Bergeron https://github.com/dinedal

pkgname=textql-git
pkgver=2.0.3
pkgrel=1
pkgdesc="Execute SQL against structured text like CSV or TSV"
arch=('x86_64' 'i686')
url="https://github.com/dinedal/textql"
license=('MIT')
depends=('go-pie')
makedepends=('dep')
options=('!strip' '!emptydirs')
source=("textql-git::git+https://github.com/dinedal/textql")

prepare(){
  mkdir -p gopath/src/github.com
  ln -rTsf $pkgname $srcdir/gopath/src/github.com/$pkgname
  export GOPATH="$srcdir"/gopath
  cd $GOPATH/src/github.com/$pkgname
  dep ensure
}

build(){
  export GOPATH=$srcdir/gopath
  cd gopath/src/github.com/$pkgname
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 gopath/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
    install -Dm644 "$srcdir/src/$_gourl/$f" \
    "$pkgdir/usr/share/licenses/$pkgname/$f"
  fi
  done
}

md5sums=('SKIP')
