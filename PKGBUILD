# Maintainer: id <pcmid at gmail dot com>

pkgname=ovn
pkgver=24.03.2
pkgrel=1
pkgdesc='Open Virtual Network'
license=('Apache')
arch=('x86_64')
depends=('openvswitch' 'libxdp' 'numactl' 'libunwind')
makedepends=('git')
url='https://github.com/ovn-org/ovn'
source=("git+https://github.com/ovn-org/ovn#tag=v${pkgver}")
sha256sums=('ab461f916607f3b998541f9370e3a0f859f8c883b62fbd50d1c41167371b938f')

prepare() {
  cd ${pkgname}

  git submodule update --init
}

build() {
  cd ${pkgname}

  cd ovs
  ./boot.sh
  ./configure
  make

  cd ..
  ./boot.sh
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    CFLAGS="-g -O2"

  make
}



package() {
  cd ${pkgname}

  make -j 1 DESTDIR="${pkgdir}" install
}
