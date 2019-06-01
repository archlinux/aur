# Maintainer: Milindu Sanoj Kumarage <AgentMilindu@gmail.com>
# Maintainer: Ayush Jain <ayushjain20n@gmail.com>
# Maintainer: Apoorva M <app.apoorva@gmail.com>
pkgname=dunner
pkgver=2.1.1
pkgrel=1
pkgdesc='A container based task-runner'
arch=('any')
url='https://github.com/leopardslab/dunner'
license=('MIT')
makedepends=('go' 'dep' 'git')
depends=('docker')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('970087b3fd9f2d7a99c37e72bc1639a93f976847cbecb79b7b6f2312658f6818')

prepare(){
  if [ -z "$GOPATH" ]
  then
    echo "\$GOPATH is empty, setting it to ~/go"
    mkdir -p $HOME/go
    export GOPATH=$HOME/go
    mkdir -p $GOPATH/bin
    mkdir -p $GOPATH/src
    mkdir -p $GOPATH/pkg
  else
    echo ""
  fi
  mkdir -p $GOPATH/src/github.com/leopardslab/$pkgname
  mv $pkgname-$pkgver/* $GOPATH/src/github.com/leopardslab/$pkgname
  cd $GOPATH/src/github.com/leopardslab/$pkgname
  echo "Installing dependencies"
  dep ensure -v
}

build() {
  cd $GOPATH/src/github.com/leopardslab/$pkgname
  echo "Installing dunner"
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 $GOPATH/bin/$pkgname "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 $GOPATH/src/github.com/leopardslab/dunner/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
