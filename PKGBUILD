# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.21.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('5cf02a94a9687cf09fd95426cee9d58d215f8dd899fbc50a637d7f230d3007b423ce7d7da407cdb1036731d481cba0766e1899f47bf9f49035da0de025c95444')

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
