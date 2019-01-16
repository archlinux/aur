pkgname=babelweb2-git
_pkgname=babelweb2
pkgver=r224.506f97f
pkgrel=1
pkgdesc='Yet Another Monitoring Tool for the Babel routing daemon.'
arch=('x86_64' 'i686')
url='https://github.com/Vivena/babelweb2'
license=('MIT')
makedepends=('git' 'go-pie')
source=("${_pkgname}::git+https://github.com/Vivena/babelweb2.git"
        "babelweb2.service")
sha256sums=('SKIP'
            '90592927110b955e2e533f90752c50b468dd8824379fdcfca2be41c42343ccfd')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p gopath/src/github.com/Vivena
  ln -rTsf $_pkgname gopath/src/github.com/Vivena/$_pkgname
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/Vivena/$_pkgname
  go get -v github.com/Vivena/babelweb2
}


build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/Vivena/$_pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd "$_pkgname"
  install -Dm 755 $_pkgname "${pkgdir}/usr/bin/$_pkgname"
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp -r static $pkgdir/usr/share/$_pkgname
  install -Dm644 "$srcdir/babelweb2.service" "$pkgdir/usr/lib/systemd/system/babelweb2.service"
}
