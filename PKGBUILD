# Maintainer: Damien Guihal <dguihal@gmail.com>
# Do not forget SRCINFO :  makepkg --printsrcinfo > .SRCINFO
pkgname=soapui
pkgver=5.5.0
pkgrel=1
pkgdesc="A graphical Java program for inspecting, invoking, monitoring, simulating/mocking and functional/load/compliance/surveillance testing of REST/WADL and SOAP/WSDL-based Web Services over HTTP."
arch=('i686' 'x86_64')
url="http://www.soapui.org/"
license=('EUPL V.1.1')
groups=()
depends=('java-environment>=8' 'hicolor-icon-theme')
optdepends=('java-openjfx: Open JFX for Internal browser')
source=("https://s3.amazonaws.com/downloads.eviware/soapuios/$pkgver/SoapUI-$pkgver-linux-bin.tar.gz"
        "http://freeapps.co.uk.s3.amazonaws.com/images/thumbnails/$pkgname.png"
        "$pkgname.desktop"
        "$pkgname")
#generate with 'makepkg -g'
md5sums=('f26e9bae7953c0714eb18a7bc96fc7ab'
         '3cc08aca62edb502fc53013edf69f640'
         'f0e2fa73dd9a7c271e38c179b4e284a3'
         'b1eb2bcf5a0ff86bf128d13dc41d83de')
sha1sums=('547edeb46569e8224497e1a8564d6cbfded0c6b2'
          '9f12e2f0db63083a3fa4e5b6fdfd10c8dfd038c0'
          '4ced7d28c3c5880db600bf4769fdb1a3dc3a6fce'
          '89c2d3aabacb88343d60f57f4fe47546ab95ccf5')

build() {
  cd ${srcdir}/SoapUI-$pkgver

  #Correction du bug jxplorer
  sed -i -e 's/^java/${JAVA_HOME}\/bin\/java/' bin/soapui.sh
}

package() {
  mkdir -p ${pkgdir}/usr/share/soapui
  mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/SoapUI-$pkgver
  cp -R * ${pkgdir}/usr/share/soapui

  cd ${srcdir}
  install $pkgname.desktop -m 0644 -D ${pkgdir}/usr/share/applications/$pkgname.desktop
  install $pkgname.png -m 0644 -D ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$pkgname.png
  install $pkgname -m 0755 -D ${pkgdir}/usr/bin/soapui
  # Mise a jour de la version
  sed -i -e "s/#SOAPUIVER#/${pkgver}/" ${pkgdir}/usr/bin/soapui
  
  chmod 0755 ${pkgdir}/usr/share/soapui/bin/soapui.sh
  find ${pkgdir}/usr/share/soapui/wsi-test-tools -name *.sh -exec chmod 0755 {} \;
  cd ${pkgdir}/usr/share/soapui
  ln -sf bin/starter-page.html .
}

# vim:set ts=2 sw=2 et:

