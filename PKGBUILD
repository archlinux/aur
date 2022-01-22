# Maintainer: Damien Guihal <dguihal@gmail.com>
# Do not forget SRCINFO :  makepkg --printsrcinfo > .SRCINFO
pkgname=soapui
pkgver=5.7.0
pkgrel=1
pkgdesc="A graphical Java program for inspecting, invoking, monitoring, simulating/mocking and functional/load/compliance/surveillance testing of REST/WADL and SOAP/WSDL-based Web Services over HTTP."
arch=('i686' 'x86_64')
url="http://www.soapui.org/"
license=('EUPL V.1.1')
groups=()
depends=('java-environment>=12' 'hicolor-icon-theme')
optdepends=('java-openjfx: Open JFX for Internal browser')
source=("https://s3.amazonaws.com/downloads.eviware/soapuios/$pkgver/SoapUI-$pkgver-linux-bin.tar.gz"
        "http://freeapps.co.uk.s3.amazonaws.com/images/thumbnails/$pkgname.png"
        "$pkgname.desktop"
        "$pkgname")
#generate with 'makepkg -g'
md5sums=('531d1b29baf1efc9a1885b3ad0735735'
         '3cc08aca62edb502fc53013edf69f640'
         'f0e2fa73dd9a7c271e38c179b4e284a3'
         '2cd183f3ffcb9d4560dd6f275323baa5')
sha1sums=('339ff044d47637599c4a1f414b74e8f00fde100d'
          '9f12e2f0db63083a3fa4e5b6fdfd10c8dfd038c0'
          '4ced7d28c3c5880db600bf4769fdb1a3dc3a6fce'
          '9a4b0d63fed9af9f4619beed02fbe62f08c214f4')

build() {
  cd "${srcdir}/SoapUI-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/usr/share/soapui"
  mkdir -p "${pkgdir}/usr/bin"
  cd "${srcdir}/SoapUI-${pkgver}" || exit 1
  cp -R ./* "${pkgdir}/usr/share/soapui"

  cd "${srcdir}" || exit 1
  install "${pkgname}.desktop" -m 0644 -D "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install "${pkgname}.png" -m 0644 -D "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install "${pkgname}" -m 0755 -D "${pkgdir}/usr/bin/soapui"
  # Mise a jour de la version
  sed -i -e "s/#SOAPUIVER#/${pkgver}/" "${pkgdir}/usr/bin/soapui"

  # Seems to cause some issues "java.lang.NoSuchMethodError: 'boolean org.apache.xmlbeans.XmlOptionsBean.isLoadDTDGrammar()"
  #  fixed by removing it
  # Outdated since 5.7.0
  #rm "${pkgdir}/usr/share/soapui/lib/xmlbeans-xmlpublic-2.6.0.jar"
  
  chmod 0755 "${pkgdir}/usr/share/soapui/bin/soapui.sh"
  find "${pkgdir}/usr/share/soapui/wsi-test-tools" -name '*.sh' -exec chmod 0755 {} \;
  cd "${pkgdir}/usr/share/soapui" || exit 1
  ln -sf bin/starter-page.html .
}

# vim:set ts=2 sw=2 et:

