# Maintainer: aksr <aksr at t-com dot me>
pkgname=typo-git
pkgver=r19.7cc4581
pkgrel=1
pkgdesc="A modern version of the original Unix typo command."
arch=('i686' 'x86_64')
url="https://github.com/robpike/typo"
license=('BSD')
makedepends=('git' 'go>=1.5')
conflicts=('typo')
_gourl=robpike.io/cmd/typo

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v -d ${_gourl}
  sed -i '93s|.*|	path := filepath.Join(string(os.PathSeparator), "usr", "share", "doc", "'"$pkgname"'", base)|g' \
    "$srcdir"/src/${_gourl}/typo.go
  cd "$srcdir"/src/${_gourl}
  GOPATH="$srcdir" go build -o typo
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"/src/${_gourl}
  install -Dm755 typo "$pkgdir/usr/bin/typo"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 typo.png $pkgdir/usr/share/doc/$pkgname/typo.png
  sed '409,489!d' typo.go > README
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 w2006.txt $pkgdir/usr/share/doc/$pkgname/w2006.txt
  ln -rs $pkgdir/usr/share/doc/$pkgname/w2006.txt $pkgdir/usr/share/doc/$pkgname/words
}

