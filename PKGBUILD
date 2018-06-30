# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.20.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('80d34b46b5db13d8c45087a8ed913a03cf892f792f209a3f11265b2a9ad63d18449d6e5fbbf267693007bacf530995bceea09b1f00ff2d236a5093f00993ebee')

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
