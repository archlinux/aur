# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=5.3
pkgrel=2
pkgdesc="A Freeware, closed-source multi-site incremental XMLTV EPG grabber"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://webgrabplus.com"
license=('LicenseRef-donator')
depends=('bash' 'dotnet-runtime-8.0' 'unzip' 'libxml2' 'wget')
optdepends=('dotnet-runtime-8.0-bin: binary dotnet core runtime alternative')
source=("${url}/sites/default/files/download/SW/V${pkgver}.0/WebGrabPlus_V${pkgver}_install.tar.gz"
        "wgpp.sh")
sha256sums=('d619430b8099070eabe1f871f72aa946afb876e80fd8f2d58f5bd647cbb0dad7'
            '2c968010115a492874aaaae396757e7e6a9ce628d2d1a9ae148cabb4aced5831')

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
  cp -Pr --no-preserve='mode,ownership' "${srcdir}/${pkgname}" "${pkgdir}/usr/share"
  find "${pkgdir}" -type f -name "*.sh" -exec chmod 755 {} \;
  install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
