#Maintainer: M0Rf30

pkgname=openbazaard
pkgver=0.9.4
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network (Latest devel version)"
arch=(arm armv6h armv7h aarch64 i686 x86_64)
url="http://openbazaar.org"
license=('MIT')
depends=()
install=${pkgname}.install
makedepends=(go upx)
_user=github.com/OpenBazaar
_repo=openbazaar-go
source=("https://github.com/OpenBazaar/openbazaar-go/archive/v$pkgver.tar.gz"
		"${pkgname}.service"
)
options=('strip' 'upx')

export GOOS=linux
case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=386 GO386=387 ;;
  arm) export GOARCH=arm GOARM=5 ;;
  armv6h) export GOARCH=arm GOARM=6 ;;
  armv7h) export GOARCH=arm GOARM=7 ;;
  aarch64) export GOARCH=arm64 ;;
esac

build(){
  cd $srcdir
  export GOPATH="$PWD"/.gopath
  mkdir -p "$GOPATH"/src/${_user}
  ln -sf "$PWD"/${_repo}-${pkgver} "$GOPATH"/src/${_user}/${_repo}

  cd "$GOPATH"/src/${_user}/${_repo}
  go get -v
}

package() {
  export PATH="$PATH":"$PWD"/.gopath/bin
  cd "$GOPATH"/src/${_user}/${_repo}

  go build
  
  msg2 "Installing binary file"
  install -Dm755 "$GOPATH"/bin/${_repo} $pkgdir/usr/bin/${pkgname}

  msg2 "Installing systemd service"
  install -Dm644 $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  
  msg2 "Symlinking for gui launch"
  install -dm755 $pkgdir/opt/openbazaar-go/
  ln -sr /usr/bin/${pkgname} $pkgdir/opt/openbazaar-go/${pkgname}
}

md5sums=('eeabc3ce4908fc26bbfcbc6b3e914c57'
         '9737f9240006f5b215b128c25f68f6f4')
