# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.22.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('3424633132e15b39e3ad805a8d7601369905306a2833870b665662ca0624f6cd0825def7fba92c6385bcc3e39711da69a6c48aeebfbc4301cf6cc8f331c2c09e')

prepare() {
  mkdir -p work/{bin,pkg,src/github.com/minishift}
  export GOPATH=${srcdir}/work
  export PATH=$PATH:$GOPATH/bin
  go get github.com/golang/dep/cmd/dep
  mv minishift-${pkgver} work/src/github.com/minishift/minishift
}

build() {
  cd work/src/github.com/minishift/minishift
  make vendor
  make
}

# check() {
#   cd work/src/github.com/minishift/minishift
#   make test
# }

package() {
  install -Dm755 "${srcdir}/work/bin/minishift" "${pkgdir}/usr/bin/minishift"
}
