# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.34.3
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
depends=('glibc')
makedepends=(go-pie git dep go-bindata)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('72ea978311334fb43549114c3b13a2030af14d3c9ae9da5d980355726013c0964f18521a1e5bacb333fffe9bb06476b97b12aa0df4131193a3f25b7fc9932f27')

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
