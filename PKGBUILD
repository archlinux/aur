# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto

pkgver=2.3.1
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('any')
url="https://sealcrypto.org/"
license=('MSR-LA')
depends=()
makedepends=('tar' 'gcc' 'autoconf')
source=("https://download.microsoft.com/download/B/3/7/B3720F6B-4F4A-4B54-9C6C-751EF194CBE7/SEAL_2.3.1.tar.gz")
sha1sums=('d45694ede6ba46c8bdae00718d4a8348e2aaac6a')
provides=('sealcrypto')

build() {
  cd "${srcdir}"
  tar xvf "SEAL_2.3.1.tar.gz"
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
