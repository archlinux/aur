# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=gpu-manager-git
_pkgname=gpu-manager
pkgver=26
pkgrel=1
pkgdesc="GPU Manager is used for managing the nvidia GPU devices in Kubernetes cluster."
arch=('x86_64')
url="https://github.com/tkestack/gpu-manager"
license=('Apache')
makedepends=('git' 'go' 'cuda>=10.2')
source=("${_pkgname}::git+https://github.com/tkestack/gpu-manager.git#branch=master")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH=$GOPATH:`pwd`
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH="${srcdir}"/.gopath
    export CGO_CFLAGS="-I/opt/cuda/targets/x86_64-linux/include"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -d $pkgdir/etc/gpu-manager
    install -d $pkgdir/usr/lib/systemd/user
    install -Dm755 go/bin/gpu-manager $pkgdir/usr/bin/gpu-manager
    install -Dm755 go/bin/gpu-client $pkgdir/usr/bin/gpu-client
    
    install -Dm644 build/extra-config.json $pkgdir/etc/gpu-manager/
    install -Dm644 build/gpu-manager.conf $pkgdir/etc/gpu-manager/
    install -Dm644 build/volume.conf $pkgdir/etc/gpu-manager/

    install -Dm644 build/gpu-manager.service $pkgdir/usr/lib/systemd/user/
}
