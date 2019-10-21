# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.34.1
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go-pie git dep go-bindata)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('d9d15860424e77e9be8df33ff4337d6d6c87cb3593d870fab526f7005ee95e5ddfccc1f36aed4e41840b09cdd29814841d7bd67fbbc8ce0b7cb928e7059e074c')

prepare() {
  mkdir -p gopath/src/github.com/minishift
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/minishift/$pkgname
  export GOPATH="$srcdir"/gopath

  # the dependencies can be fetched here if needed
  cd gopath/src/github.com/minishift/$pkgname
  dep ensure
}

build() {
  export GOPATH=${srcdir}/gopath
  cd gopath/src/github.com/minishift/$pkgname

  make
}

package() {
  install -Dm755 "gopath/bin/minishift" "${pkgdir}/usr/bin/minishift"
}
