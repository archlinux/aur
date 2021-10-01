# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

_pkgname=rtlamr-collect
pkgname=rtlamr-collect-git
pkgver=r31.7951486
pkgrel=1
pkgdesc=" Data aggregation for rtlamr."
arch=('any')
url="https://github.com/bemasher/rtlamr-collect"
source=("git+https://github.com/bemasher/rtlamr-collect.git")
md5sums=('SKIP')
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go' 'git')
provides=('rtlamr-collect')
conflicts=('rtlamr-collect')
options=('!strip' '!emptydirs')
_gourl=github.com/bemasher/rtlamr-collect

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p gopath/src/${_gourl%/*}
  ln -rTsf $_pkgname gopath/src/$_gourl
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_gourl
  go install \
     -trimpath \
     -modcacherw \
     -ldflags "-extldflags $LDFLAGS" \
     -v ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_gourl
  go test ./...
}


package() {
  install -p -Dm755 gopath/bin/rtlamr-collect "$pkgdir/usr/bin/rtlamr-collect"
}

# vim:set ts=2 sw=2 et:
