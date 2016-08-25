#Maintainer: M0Rf30

_pkgname=openbazaard
pkgname=${_pkgname}-git
pkgver=371.8811c69
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=()
install=${_pkgname}.install
makedepends=(go git)
_user=github.com/OpenBazaar
_repo=openbazaar-go
source=("${_repo}::git+https://${_user}/${_repo}.git"
		"${_pkgname}.service"
)
options=('strip')
provides=(${_pkgname})
replaces=(${_pkgname})

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
  install -Dm755 "$GOPATH"/bin/${_repo} $pkgdir/usr/bin/${_pkgname}

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service
}

pkgver() {
  cd ${_repo}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '8901b5947b19402920df6df10f8d1ab6')
