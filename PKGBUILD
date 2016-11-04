# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=hyperd
pkgver=0.7.0
pkgrel=1
pkgdesc="Hypervisor-agnostic Docker Runtime"
arch=('i686' 'x86_64')
url="https://www.hypercontainer.io/"
license=('Apache')
depends=('libvirt')
makedepends=('device-mapper' 'sqlite3' 'libvirt' 'go')
optdepends=('hyperstart: boot files for hyperd instances')
options=('!strip' '!emptydirs')
source=("hyperd-$pkgver.tar.gz::https://github.com/hyperhq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e79d4e6aebe01d2117e981050ecb88dd24f8a9e45e2fbe1a558bcd1ee5d90b88')

build() {
  cd "${pkgname}-${pkgver}"

  # Needs to be able to find itself in $GOPATH
  ln -s $(pwd) Godeps/_workspace/src/github.com/hyperhq/${pkgname}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -D hyperctl "${pkgdir}/usr/bin/hyperctl"
  install -D hyperd "${pkgdir}/usr/bin/hyperd"
  install -D -m644 package/dist/etc/hyper/config "${pkgdir}/etc/hyper/config"
  install -D -m644 package/dist/lib/systemd/system/hyperd.service "${pkgdir}/usr/lib/systemd/system/hyperd.service"
}
