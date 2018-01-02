# Maintainer: robertfoster

_pkgname=openbazaard
pkgname=${_pkgname}-git
pkgver=v0.11.0.rc2.r1.g8540a8a1
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network (Latest devel version)"
arch=(arm armv6h armv7h aarch64 i686 x86_64)
url="http://openbazaar.org"
license=('MIT')
depends=()
#install=${_pkgname}.install
makedepends=(go git upx)
conflicts=('openbazaard')
options=('strip' 'upx')
_user=github.com/OpenBazaar
_repo=openbazaar-go

source=("${_repo}::git+https://${_user}/${_repo}.git"
	"${_pkgname}.service"
	"${_pkgname}.conf")

export GOOS=linux
case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=386 GO386=387 ;;
  arm) export GOARCH=arm GOARM=5 ;;
  armv6h) export GOARCH=arm GOARM=6 ;;
  armv7h) export GOARCH=arm GOARM=7 ;;
  aarch64) export GOARCH=arm64 ;;
esac


pkgver() {
  cd ${_repo}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd $srcdir
  export GOPATH="$PWD"/.gopath
  mkdir -p "$GOPATH"/src/${_user}
  ln -sf "$PWD"/${_repo} "$GOPATH"/src/${_user}/${_repo}

  cd "$GOPATH"/src/${_user}/${_repo}
  go get -v
}

package() {
  export PATH="$PATH":"$PWD"/.gopath/bin
  cd "$GOPATH"/src/${_user}/${_repo}

  go build
  
  install -Dm755 "$GOPATH"/bin/${_repo} $pkgdir/usr/bin/${_pkgname}

  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service
  install -D -m644 "${srcdir}/${_pkgname}".conf "$pkgdir/etc/conf.d/${_pkgname}"
  
  install -dm755 $pkgdir/opt/openbazaar-go/
  ln -sr /usr/bin/${_pkgname} $pkgdir/opt/openbazaar-go/openbazaard
}

md5sums=('SKIP'
         'a6ee246f8be0b85697eca8d9a86014cd'
         '93ff9255cb400c6748f6cb45a5456962')
