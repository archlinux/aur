#Maintainer: M0Rf30

_pkgname=openbazaard
pkgname=${_pkgname}-git
pkgver=v0.4.1.r31.g47bca526
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network (Latest devel version)"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=()
install=${_pkgname}.install
makedepends=(go git upx)
_user=github.com/OpenBazaar
_repo=openbazaar-go
source=("${_repo}::git+https://${_user}/${_repo}.git"
		"${_pkgname}.service"
)
options=('strip' 'upx')

prepare(){
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
  
  msg2 "Install binary file"
  install -Dm755 "$GOPATH"/bin/${_repo} $pkgdir/usr/bin/${_pkgname}-next

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}-next.service
  
  msg2 "Symlinking for gui launch"
  install -dm755 $pkgdir/opt/openbazaar-go/
  ln -sr /usr/bin/${_pkgname}-next $pkgdir/opt/openbazaar-go/openbazaard
}

pkgver() {
  cd ${_repo}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         '6a83a6632beb62410756c7b7d2607af9')
