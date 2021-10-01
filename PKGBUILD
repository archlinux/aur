# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: bemasher <bemasher@gmail.com>

_pkgname=rtlamr
pkgname=rtlamr-git
pkgver=v0.9.3.r5.g3965b5c5
pkgrel=1
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('any')
url="https://github.com/bemasher/rtlamr"
source=("git+https://github.com/bemasher/rtlamr.git")
md5sums=('SKIP')
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go' 'git')
provides=('rtlamr')
conflicts=('rtlamr')
options=('!strip' '!emptydirs')
_gourl=github.com/bemasher/rtlamr

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -p -Dm755 gopath/bin/rtlamr "$pkgdir/usr/bin/rtlamr"
}

# vim:set ts=2 sw=2 et:
