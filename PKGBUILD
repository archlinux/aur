# Maintainer: Yorick Rommers <yorick-rommers@hotmail.com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=dattobd
pkgver=r1.8057a30
pkgrel=1
pkgdesc="kernel module for taking block-level snapshots and incremental backups of Linux block devices"
arch=('any')
url="https://github.com/datto/dattobd"
license=('GPL2')
makedepends=("linux-headers")
source=("git://github.com/datto/dattobd.git")
md5sums=("SKIP")
install=dattobd.install

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="${pkgdir}/usr"
}

package() {
  cd "${srcdir}/${pkgname}"

  msg "Removing ldconfig lines"
  find . -type f -name Makefile -exec sed -i '/ldconfig/d' {} \;

  install -dm755 "${pkgdir}/usr/lib"
  make PREFIX="${pkgdir}/usr" install
  echo "$pkgdir"
  install -Dm644 "src/dattobd.ko" "${pkgdir}/usr/lib/modules/$(uname -r)/dattobd.ko"
}
