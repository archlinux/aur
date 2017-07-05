# Maintainer: Roman Lisagor <rlisagor at gmail dot com>

pkgname=calico-cni
pkgver=1.11.2
pkgrel=1
pkgdesc="Calico CNI plugin"
arch=('x86_64')
url="https://github.com/projectcalico/cni-plugin"
license=("Apache")
makedepends=('go' 'glide')
depends=('glibc')
source=("https://github.com/projectcalico/cni-plugin/archive/v${pkgver}.tar.gz"
        "no-install-during-build.patch")
sha512sums=('5d678d9734990ebb1c4300b402964714ccb9b6417909b5b28f4719db130e7728ec3a191f64800b2361fed871d205b183ecd22690580f0aeafafe2086e9d9fff3'
            '8253e4ef31856b5d47ea363e3156cff797bcb617b4a898148343c23d1c6f7717148cdc6d3a7ea50c8f897320661d310feffce6f3c484ee55999841e945e882e4')


prepare() {
  rm -rf ${srcdir}/gopath
  mkdir -p ${srcdir}/gopath/{src,bin,pkg}
  mkdir -p ${srcdir}/gopath/src/github.com/projectcalico/

  mv cni-plugin-${pkgver} ${srcdir}/gopath/src/github.com/projectcalico/cni-plugin

  cd ${srcdir}/gopath/src/github.com/projectcalico/cni-plugin
  patch -Np1 -i "${srcdir}/no-install-during-build.patch"
}

build() {
  cd ${srcdir}/gopath/src/github.com/projectcalico/cni-plugin
  export GOPATH=${srcdir}/gopath
  glide install -strip-vendor
  make binary CALICO_CNI_VERSION=v${pkgver}
}

package() {
  install -Dm755 \
    ${srcdir}/gopath/src/github.com/projectcalico/cni-plugin/dist/calico \
    ${pkgdir}/opt/cni/bin/calico

  install -Dm755 \
    ${srcdir}/gopath/src/github.com/projectcalico/cni-plugin/dist/calico-ipam \
    ${pkgdir}/opt/cni/bin/calico-ipam
}
