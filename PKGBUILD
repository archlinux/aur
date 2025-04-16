# Maintainer: Kashyap Chhatbar <first name [dot] cc [at] gmail [dot] com>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ucsc-kent-genome-tools
pkgver=480
pkgrel=1
pkgdesc="UCSC Kent bioinformatics utilities: kent source utilities"
arch=(x86_64)
url="http://hgdownload.soe.ucsc.edu/admin/exe/userApps.archive"
license=('custom:UCSC')
install="${pkgname}".install
depends=(libpng mariadb-clients uuid openssl)
source=(
  .hg.conf
  "${pkgname}".sh
  "${pkgname}"-"${pkgver}".src.tgz::${url}/userApps.v"${pkgver}".src.tgz
)
sha256sums=('359db5b022847d3d674f21821fa08a363d2183379d59a2b63129fcf90954d674'
            '5ccec9d5e4de9be22746fab1591127b61176c8c4d586c0dd1df13ee5e52a5367'
            '4667a4221740c426e0d6a709eb59029d3b48f55346fea464ff5490e3ee0c7aed')

# define strings to replace in sed
streambuf="#include <streambuf>"
cstdint="#include <cstdint>"

prepare() {
  cd "${srcdir}"/userApps
  make clean
  sed -i "/${streambuf}/a ${cstdint}" kent/src/hg/lib/straw/straw.cpp
}

build() {
  cd "${srcdir}"/userApps
  make utils
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
