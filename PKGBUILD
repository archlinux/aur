# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=5.4.0
pkgrel=1
pkgdesc="A Freeware, closed-source multi-site incremental XMLTV EPG grabber"
arch=('any')
url="http://webgrabplus.com"
license=('LicenseRef-custom')
depends=('bash' 'dotnet-runtime-9.0' 'unzip' 'libxml2' 'wget')
makedepends=('dos2unix')
options=(!strip !emptydirs)
noextract=("WebGrabPlus_V${pkgver}_install.tar.gz")
source=(
  "WebGrabPlus_V${pkgver}_install.tar.gz::https://wgpluspluslicense.file.core.windows.net/webgrabplus/downloads/WebGrabPlus_V5.4.0_install.tar.gz?sv=2025-05-05&spr=https&st=2025-08-03T11%3A59%3A06Z&se=2026-08-04T11%3A59%3A00Z&sr=f&sp=r&sig=Im%2Fd%2BUk098EIw%2BlgA17mF5AgOMMxHFiosOOaiXs%2FzME%3D"
  "wgpp.sh"
  "webgrabplus-license.txt"
)
sha256sums=('532da2944d50e359cec313326329a50028e494f4d3d8d909a4b5e9522e7f10b4'
            '7e2b4fd74027eac3305d046748cb985ca86b2597970e67fff2690d660c72d5f3'
            'b56ecfd2f7b75d8fa09722cbc82abc594ed5f876c32122f34a48621a72fd2234')

prepare() {
  mkdir -p "${pkgname}"
  cd "${pkgname}"
  tar -xf "${srcdir}/WebGrabPlus_V${pkgver}_install.tar.gz"
  
  # Run install script
  ./install.sh

  # Adapt XML formatting
  sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.example.xml

  # Download latest version of SiteIniPack
  cd bin.net
  ./SiteIni.Pack.Update.sh
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Copy program files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r --no-preserve=mode,ownership {doc,siteini.pack} "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/bin.net/" bin.net/*.{dll,txt,json}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/mdb/" mdb/*.{txt,xml}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/rex/" rex/*.{txt,xml}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" WebGrab++.config.{example.xml,xml}
  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/" {install.sh,run.net.sh}
  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/bin.net/" bin.net/*.sh
  
  # Install wrapper and license
  install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/webgrabplus-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Fix line endings
  find "${pkgdir}" -type f \( -name "*.xml" -o -name "*.txt" \) -exec dos2unix -q {} \;
}

# vim:set ts=2 sw=2 et:
