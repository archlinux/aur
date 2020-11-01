# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ucsc-kent-genome-tools
pkgver=405
pkgrel=1
pkgdesc="UCSC Kent bioinformatics utilities: kent source utilities"
arch=(x86_64)
url="http://hgdownload.soe.ucsc.edu/admin/exe/"
license=('custom:UCSC')
install="${pkgname}".install
depends=(libpng mariadb-clients uuid openssl)
source=(
  .hg.conf
  "${pkgname}".sh
  "${pkgname}"-"${pkgver}".src.tgz::http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v"${pkgver}".src.tgz
)
sha256sums=('359db5b022847d3d674f21821fa08a363d2183379d59a2b63129fcf90954d674'
            '5ccec9d5e4de9be22746fab1591127b61176c8c4d586c0dd1df13ee5e52a5367'
            '7102172b4186fb6afbbb36cf8efb24a5518172b291b58d3d5182bd8a7684328a')

prepare() {
  cd "${srcdir}"/userApps
  make clean
}

build() {
  cd "${srcdir}"/userApps
  make all
}

package() {
  install -Dm644 .hg.conf "${pkgdir}"/opt/"${pkgname}"/.hg.conf
  install -Dm755 "${pkgname}".sh  "${pkgdir}"/etc/profile.d/"${pkgname}".sh

  for script in "${srcdir}"/userApps/bin/*; do
    install -Dm755 "${script}" "${pkgdir}"/opt/"${pkgname}"/$(basename "${script}")
  done

  install -Dm644 "${srcdir}"/userApps/README "${pkgdir}"/usr/share/doc/"${pkgname}"/README
  install -Dm644 "${srcdir}"/userApps/kentUtils.Documentation.txt "${pkgdir}"/usr/share/doc/"${pkgname}"/kentUtils.Documentation.txt

  install -Dm644 "${srcdir}"/userApps/licenseUcscGenomeBrowser.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/licenseUcscGenomeBrowser.txt
  install -Dm644 "${srcdir}"/userApps/GenomeBrowserLicense.pdf "${pkgdir}"/usr/share/licenses/"${pkgname}"/GenomeBrowserLicense.pdf
  install -Dm644 "${srcdir}"/userApps/licenseBlat.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/licenseBlat.txt
}
