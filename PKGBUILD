# Maintainer: id <pcmid at gmail dot com>

pkgname=ovn
pkgver=25.03.0
pkgrel=1
pkgdesc='Open Virtual Network'
license=('Apache')
arch=('x86_64')
depends=('openvswitch' 'libxdp' 'numactl' 'libunwind')
makedepends=('git' 'python')
url='https://github.com/ovn-org/ovn'
source=(
  "git+https://github.com/ovn-org/ovn#tag=v${pkgver}"
  "ovn-controller-vtep.service"
  "ovn-controller.service"
  "ovn-db@.service"
  "ovn-ic-db.service"
  "ovn-ic.service"
  "ovn-northd.service"
  "sysconfig.template"
)
sha256sums=('cf9e7506b43e849384813cc69a0aa9835ae1eea71998134cc8cd5901ef05f716'
            '4c749321376d086749ba91f2dac4152f233af93bde8099291eb3e16cb2543915'
            '48a8f2f84466e00dd8323dc1da4916708e6393e75454bec8d407bae65444f380'
            '52b96809234cfcae4e0d0a7f78677d9f5c8aaaa4e6cf88e489b1d4c87544e639'
            'f053953c364b69578635a60712c0370d29ae57eea0fb927a5a5968c2c662cb71'
            '180092323affdd6e00741b483eb581dc2ee1b771f8e9366e98640b54872365fb'
            'ec9c87b7a6f2d1df27cd0a58791e055e32c964aed1e4c23dbcb69f7019438edf'
            '6bb0f44a927e45978a1ff733167749958ccf96701ffb89141e3c12d4d870372a')

prepare() {
  cd ${pkgname}

  git submodule update --init --depth=1
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
  install -Dm 0644 ovn-controller-vtep.service "${pkgdir}"/usr/lib/systemd/system/ovn-controller-vtep.service
  install -Dm 0644 ovn-controller.service "${pkgdir}"/usr/lib/systemd/system/ovn-controller.service
  install -Dm 0644 ovn-db@.service "${pkgdir}"/usr/lib/systemd/system/ovn-db@.service
  install -Dm 0644 ovn-ic-db.service "${pkgdir}"/usr/lib/systemd/system/ovn-ic-db.service
  install -Dm 0644 ovn-ic.service "${pkgdir}"/usr/lib/systemd/system/ovn-ic.service
  install -Dm 0644 ovn-northd.service "${pkgdir}"/usr/lib/systemd/system/ovn-northd.service
  install -Dm 0644 sysconfig.template "${pkgdir}"/etc/sysconfig/ovn

  cd ${pkgname}
  make -j 1 DESTDIR="${pkgdir}" install
}
