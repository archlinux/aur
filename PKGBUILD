# Maintainer: Guoyi
pkgname=gffread
pkgver=0.12.9
pkgrel=1
pkgdesc="GFF/GTF utility providing format conversions, region filtering, FASTA sequence extraction and more"
arch=('x86_64')
url="https://github.com/gpertea/gffread"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('make' 'git')
optdepends=()
source=(https://github.com/gpertea/gffread/archive/refs/tags/v${pkgver}.tar.gz
        gclib::git+https://github.com/gpertea/gclib.git)
sha256sums=('92eb4a52fdd14c5fd3684041ef2d040c44d7414d076467a326eea2efa087a085'
            'SKIP')

prepare() {
  cd "${srcdir}/gclib"
  # Fix for "different exception specifier" error in GCC 14+
  sed -i 's/GList(GList<OBJ>&& list);/GList(GList<OBJ>\&\& list) noexcept;/' GList.hh

  cd "${srcdir}/${pkgname}-${pkgver}"
  # Patch run_tests.sh to use the binary in the current directory
  sed -i 's|prog="../gffread"|prog="../gffread"|' run_tests.sh
}

build() {
  cd "${srcdir}/gclib"
  make
  cd "${srcdir}/${pkgname}-${pkgver}"
  make release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./run_tests.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
