# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=5.3.1
pkgrel=1
pkgdesc="A Freeware, closed-source multi-site incremental XMLTV EPG grabber"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://webgrabplus.com"
license=('LicenseRef-custom')
depends=('bash' 'dotnet-runtime-8.0' 'unzip' 'libxml2' 'wget')
makedepends=('dos2unix')
optdepends=('dotnet-runtime-8.0-bin: binary dotnet core runtime alternative')
options=(!strip !emptydirs)
source=(
  "${url}/sites/default/files/download/SW/V5.3.0/WebGrabPlus_V5.3_install.tar.gz"
  "${url}/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_V${pkgver}_beta_install.tar.gz"
  "wgpp.sh"
  "webgrabplus-license.txt"
)
sha256sums=('d619430b8099070eabe1f871f72aa946afb876e80fd8f2d58f5bd647cbb0dad7'
            '60957de302b2466aaa7400e707ffb54e449f1e0d9e9d9468ca678dc30b4b8d09'
            '4601d8217543718c93e02fad9ec395c062ed3354e6730ae72d03783cfce8d5c8'
            'b56ecfd2f7b75d8fa09722cbc82abc594ed5f876c32122f34a48621a72fd2234')

prepare() {
  # Rename folder
  mv ".${pkgname}" "${pkgname}"

  # Run install script
  cd "${pkgname}"
  ./install.sh

  # Adapt XML formatting
  sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml

  # Download latest version of SiteIniPack
  cd bin.net
  ./SiteIni.Pack.Update.sh
}

package() {
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  
  # Copy program files
  cp -Pr --no-preserve='mode,ownership' "${srcdir}/${pkgname}" "${pkgdir}/usr/share"
  
  # Install launcher script and license
  install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/webgrabplus-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Set proper permissions and fix line endings
  find "${pkgdir}" -type f -name "*.sh" -exec chmod 755 {} \;
  find "${pkgdir}" -type f \( -name "*.xml" -o -name "*.txt" \) -exec dos2unix -q {} \;
}

# vim:set ts=2 sw=2 et:
