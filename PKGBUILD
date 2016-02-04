# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=docker-machine
pkgver=0.6.0rc4
_pkgver=0.6.0-rc4
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
makedepends=('go' 'git')
optdepends=('net-tools: required for VirtualBox driver')

source=("https://github.com/docker/machine/archive/v${_pkgver}.tar.gz")
sha256sums=('0e9be95ac643180958bd0de9167cd1ad20fb83083318434131293b2876be23c8')

prepare() {
    export GOPATH="${srcdir}"

    cd $srcdir
    mkdir -p src/github.com/docker
    rm -rf src/github.com/docker/machine
    mv machine-${_pkgver} src/github.com/docker/machine

    cd $srcdir/src/github.com/docker/machine
    go get github.com/tools/godep
    make dep-restore
}

build() {
    export GOPATH="${srcdir}"

    cd $srcdir/src/github.com/docker/machine
    USE_CONTAINER=false make build
}

package() {
    cd $srcdir/src/github.com/docker/machine
    install -Dm755 bin/docker-machine $pkgdir/usr/bin/docker-machine
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/docker-machine/LICENSE
}
