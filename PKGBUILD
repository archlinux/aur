# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=5.6.0
pkgrel=1
pkgdesc="A Freeware, closed-source multi-site incremental XMLTV EPG grabber"
arch=('any')
url="http://webgrabplus.com"
license=('LicenseRef-custom')
depends=('bash' 'dotnet-runtime-9.0' 'unzip' 'libxml2' 'wget')
makedepends=('dos2unix')
options=(!strip !emptydirs)
source=(
  "WebGrabPlus_V${pkgver}_install.tar.gz::https://webgrabplus.com/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_5.6_install.tar_0.gz"
  "wgpp.sh"
  "webgrabplus-license.txt"
)
sha256sums=('d7f7db32a8db289e9c37b79516f1dd007b3f2d40fea1023f99491d37ec1108af'
            '4ebf5d848dfc469741a062c48a1a9febdf6ad49a77de9c2950e56dcc26410743'
            'b56ecfd2f7b75d8fa09722cbc82abc594ed5f876c32122f34a48621a72fd2234')

prepare() {
  mv .${pkgname} "${pkgname}"
  cd "${pkgname}"
  
  # Run install script
  ./install.sh

  # Adapt XML formatting
  sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Copy program files
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/bin.net/" bin.net/*.{dll,txt,json}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/mdb/" mdb/*.{txt,xml}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/rex/" rex/*.{txt,xml}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" WebGrab++.config.{documented.xml,xml}
  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/" {install.sh,run.net.sh}
  
  # Install wrapper and license
  install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/webgrabplus-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Fix line endings
  find "${pkgdir}" -type f \( -name "*.xml" -o -name "*.txt" \) -exec dos2unix -q {} \;
}

# vim:set ts=2 sw=2 et:
