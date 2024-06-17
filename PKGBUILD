pkgname=nbis
pkgver=5.0.0
pkgrel=4
pkgdesc="NIST Biometric Image Software"
arch=('x86_64')
url="https://www.nist.gov/services-resources/software/nist-biometric-image-software-nbis"
license=('custom')
depends=('libx11')
makedepends=('cmake')
options=('!makeflags')
source=("https://nigos.nist.gov/nist/nbis/nbis_v5_0_0.zip"
            "0000-use-extern-header-an2k.patch"
            "0001-include-unistd-header-linux.patch")
sha256sums=('0adf8ab0f6b0e4208de50ca00ba21d3d77112ecd66288757ddfed21f6bee92c3'
            '66234fc7c296d0a5dc53409196cba6dfd1feb129f87aacd78d3d54a0629fd58e'
            '27458d182ba946c31c7f06bfefde9696460c269e2837a07f6690102f521f1445')

package() {
  cd "${srcdir}/Rel_${pkgver}"
  patch -p0 < "${srcdir}/0000-use-extern-header-an2k.patch"
  patch -p0 < "${srcdir}/0001-include-unistd-header-linux.patch"
  install -d "${pkgdir}/usr"
  ./setup.sh "${pkgdir}/usr"
  make config
  make it
  make install
  rm "${pkgdir}"/usr/bin/{cjpeg,djpeg,jpegtran,rdjpgcom,wrjpgcom}
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/lib/
  rm "${pkgdir}"/usr/man/man1/{wrjpgcom.1,rdjpgcom.1,djpeg.1}
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/nbis" "${pkgdir}/usr/share"
}
