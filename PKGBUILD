# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto

pkgver=2.3.0
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.codeplex.com/"
license=('MSR-LA')
depends=()
makedepends=('unzip' 'gcc' 'autoconf')
source=("https://download.microsoft.com/download/B/3/7/B3720F6B-4F4A-4B54-9C6C-751EF194CBE7/SEAL_v2.3.0-1.zip")
md5sums=('dbbe3be7ae612dcc5ce390e722036a15')
provides=('sealcrypto')

build() {
  cd "${srcdir}"
  unzip -o "SEAL_v${pkgver}-1.zip"
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
