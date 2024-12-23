# Maintainer: envolution
# Contributor: Damien Guihal <dguihal@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=soapui
pkgver=5.8.0
pkgrel=1
pkgdesc="free and open source cross-platform functional testing solution for APIs and web services"
arch=('i686' 'x86_64')
url="http://www.soapui.org/"
license=('EUPL-1.1')
depends=('java-environment>=17' hicolor-icon-theme ttf-dejavu)
optdepends=('java-openjfx: Open JFX for Internal browser')
source=(
  "https://dl.eviware.com/soapuios/5.8.0/SoapUI-${pkgver}-linux-bin.tar.gz"
  "${pkgname}.png::https://raw.githubusercontent.com/SmartBear/soapui/refs/heads/next/soapui-installer/src/install4j/resources/images/SoapUI-OS_48-48.png"
  "$pkgname.desktop")
md5sums=('7a247d4ea2a8171f81accd344a44e900'
         'e4866edd68c373e9cf11903272d1d995'
         '65b69df4f67f9f7802fd4e56493e58d0')

package() {
  cd "${srcdir}/SoapUI-${pkgver}"

  #directories
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  #application files
  cp -r bin lib "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  #additional files
  cp -r Tutorials "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 RELEASENOTES.txt "${pkgdir}/usr/share/doc/${pkgname}/RELEASENOTES.txt"

  #desktop files
  install -Dm644 "${srcdir}/soapui.desktop" "${pkgdir}/usr/share/applications/soapui.desktop"
  install -Dm644 "${srcdir}/soapui.png" "${pkgdir}/usr/share/pixmaps/soapui.png"

  #launcher
  cat >"${pkgdir}/usr/bin/soapui" <<EOF
#!/bin/sh
cd /usr/share/java/${pkgname}/bin
./soapui.sh "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/soapui"

  # Fix permissions
  find "${pkgdir}/usr/share/java/${pkgname}/bin" -type f -exec chmod 755 {} \;
  chmod -R go-w "${pkgdir}/usr/share/java"
}

# vim:set ts=2 sw=2 et:
