# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.34.2
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go-pie git dep go-bindata)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('92f1139306669e17983a703ef86d2d9f8387254d6d59151cfe971c82310b63d8f1342473b0030585e83829e776dd7a0dba506db1f2f5d44c72f92fff836a7ade')

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
