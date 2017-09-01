# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat-git
pkgver=r122.561b2d4
pkgrel=1
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('ccat' 'ccrypt')
source=($pkgname::git+https://github.com/jingweno/ccat.git)
md5sums=('SKIP')
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p "$srcdir/go"
    export GOPATH="$srcdir/go"
    go get github.com/mattn/go-colorable
    go get github.com/spf13/cobra
    go get github.com/mattn/go-isatty
    go get github.com/sourcegraph/syntaxhighlight
    msg2 'Building ccat'
    ./bin/build
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/$pkgname/bin/ccat "$pkgdir/usr/bin"
  
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/

}
