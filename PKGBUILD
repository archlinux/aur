# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.5.5
pkgrel=2
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
sha256sums=('106a804491120bfc9da8a2229b4ce33b4d99210ada0b4ad4f6e1590f81eef8d8')

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

