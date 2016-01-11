# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.5
pkgrel=1
epoch=2
pkgdesc='Machine management for a container-centric world'
arch=('i686' 'x86_64')
url='https://github.com/docker/machine'
install="docker-machine.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine-bin')
makedepends=('go' 'godep')

source=("https://github.com/docker/machine/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('b6dee30f6e8eb1d3f130cbd9545018e0abb514a968bcd1acd6006ae343f8f402')

prepare() {
    cd $srcdir

    mkdir -p src/github.com/docker
    rm -rf src/github.com/docker/machine
    mv machine-${pkgver} src/github.com/docker/machine
		        
    cd src/github.com/docker/machine
    GOPATH=$srcdir godep restore || return 0
    return 0
}

build() {
    cd $srcdir/src/github.com/docker/machine
    GOPATH=$srcdir USE_CONTAINER=false make build
}

package() {
    cd $srcdir/src/github.com/docker/machine
    install -Dm755 bin/docker-machine $pkgdir/usr/bin/docker-machine
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}

