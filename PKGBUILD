# Maintiner: Mikhail f. Shiryaev <mr dot felixoid at gmail com>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
_baseversion=0.0
_debiangitsuffix=git20180827.d94f0cb
_debianpkgrel=1
pkgver=$_baseversion$_debiangitsuffix
pkgrel=1
pkgdesc="debianize go library packages"
arch=('x86_64' 'i686')
url=https://github.com/Debian/dh-make-golang
license=('BSD')
makedepends=('go'
             'pandoc'
             'git')
options=('!strip' '!emptydirs')
source=("http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix.orig.tar.xz"
	"http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix-$_debianpkgrel.debian.tar.xz")

sha256sums=('c2d5d3c8a83424823a631f0314c90c76cf0f89954d145ea492afef4dbdeae74a'
            'a6213eafbf3592fdde83abcf30e01220c612e9d38525c3ffae23a3ea52c30c0d')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/google/go-github/github
  go get github.com/gregjones/httpcache
  go get github.com/russross/blackfriday
  go get golang.org/x/net/html
  go get golang.org/x/net/publicsuffix
  go get golang.org/x/sync/errgroup
  go get golang.org/x/tools/go/vcs
  go get golang.org/x/tools/refactor/importgraph
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  cd "$srcdir/debian"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  pandoc -f markdown -t man -s man/dh-make-golang.md -o "$pkgdir/usr/share/man/man1/dh-make-golang.1"
}
