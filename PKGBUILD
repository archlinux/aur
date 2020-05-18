# Maintainer :         Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor :        Aniket-Pradhan <aniket17133@iiitd.ac.in>
# Owner/Contributor :  Paul Bergeron https://github.com/dinedal


pkgname=textql-git
_pkgname="${pkgname%-git}"

pkgver() { git -C "$_pkgname" describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=2.0.3.r48.1d6fef5
pkgrel=2

pkgdesc='Execute SQL against structured text like CSV or TSV'
arch=('x86_64')
url="https://github.com/dinedal/$_pkgname"
license=('MIT')

makedepends=('git' 'go-pie')

options=('!emptydirs' 'zipman')

source=("git+$url.git")
sha256sums=('SKIP')


prepare(){
  mkdir -p gopath/src/github.com
  ln -rsf "$_pkgname" gopath/src/github.com/
  cd "gopath/src/github.com/$_pkgname"
  GOPATH="$srcdir/gopath" go get -v -d ./...
}

build(){
  cd "gopath/src/github.com/$_pkgname"
  GOPATH="$srcdir/gopath" go build -v -ldflags "-X main.VERSION=$(<VERSION) -s" textql/main.go
}

package() {
  cd "$_pkgname"
  install -Dm755 main                         "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE                    -t"$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 Readme.md textql_usage.gif -t"$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 "man/$_pkgname.1"          -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
