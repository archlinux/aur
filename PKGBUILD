# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcf-validator
pkgver=0.6
pkgrel=2
pkgdesc="Validation suite for Variant Call Format (VCF) files"
arch=('i686' 'x86_64')
url=https://github.com/EBIvariation/vcf-validator
license=('Apache')
depends=('libpthread-stubs' 'libodb-sqlite' 'odb')
makedepends=('cmake' 'boost')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/EBIvariation/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('9ae64caea3439feed1f24268d82610f90dac6578169e0d87f82caeb7c349dadc')

prepare() {
  mkdir -p build
  sed -i '/include_directories (lib)/ a link_directories ("/usr/lib/odb/")' "${pkgname}-${pkgver}"/CMakeLists.txt
}

build() {
  cd build
  cmake ../"${pkgname}"-"${pkgver}" -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  install -Dm755 build/bin/vcf_validator "${pkgdir}"/usr/bin/vcf_validator
  install -Dm755 build/bin/vcf_debugulator "${pkgdir}"/usr/bin/vcf_debugulator

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 LICENSE_ODB "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_ODB
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
