# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcf-validator
pkgver=0.7
pkgrel=1
pkgdesc="Validation suite for Variant Call Format (VCF) files"
arch=('x86_64')
url=https://github.com/EBIvariation/"${pkgname}"
license=('Apache')
depends=('libpthread-stubs' 'libodb-sqlite' 'odb')
makedepends=('cmake' 'boost')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/EBIvariation/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('da0cb126e2dad6f79a8ec503f02addf0b4e437f072e44a1cf832e64f0806d019')

prepare() {
  mkdir -p build
  # Cmake cannot located `libodb-sqlite` and `odb` libraries so patch it in.
  # Many thanks to the community for this small fix:
  #    https://bbs.archlinux.org/viewtopic.php?id=234124
  #
  sed -i \
    '/include_directories (lib)/ a link_directories ("/usr/lib/odb/")' \
    "${pkgname}-${pkgver}"/CMakeLists.txt
}

build() {
  cd build
  cmake ../"${pkgname}"-"${pkgver}" -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  install -Dm755 bin/vcf_validator "${pkgdir}"/usr/bin/vcf_validator
  install -Dm755 bin/vcf_debugulator "${pkgdir}"/usr/bin/vcf_debugulator

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 LICENSE_ODB "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_ODB
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
