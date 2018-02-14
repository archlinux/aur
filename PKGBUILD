# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto

pkgver=2.3.0.4
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.codeplex.com/"
license=('MSR-LA')
depends=()
makedepends=('tar' 'gcc' 'autoconf')
source=("https://download.microsoft.com/download/B/3/7/B3720F6B-4F4A-4B54-9C6C-751EF194CBE7/SEAL_v2.3.0-4_Linux.tar.gz")
md5sums=('a0aa3e0ea796f02cf7c978aa4722c1fa')
provides=('sealcrypto')

build() {
  cd "${srcdir}"
  tar xvf "SEAL_v2.3.0-4_Linux.tar.gz"
  cd "SEAL/SEAL"
  autoreconf -i || true
  bash configure
  make
}

package() {
  cd "${srcdir}/SEAL"
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/seal/util
  cp "bin/libseal.a" ${pkgdir}/usr/lib
  sed -i 's/#include "\(.*\)"/#include <\1>/g' SEAL/seal/*.h
  cp SEAL/seal/*.h ${pkgdir}/usr/include/seal
  sed -i 's/#include "\(.*\)"/#include <\1>/g' SEAL/seal/util/*.h
  cp SEAL/seal/util/*.h ${pkgdir}/usr/include/seal/util
}
