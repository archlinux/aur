# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=tn5250j
pkgver=0.7.6
pkgrel=3
pkgdesc="5250 terminal emulator for iSeries and AS/400 written in Java"
url="http://tn5250j.org/"
arch=('any')
license=('GPL2')
depends=('bash' 'java-runtime' 'hicolor-icon-theme')
makedepends=('ant')
optdepends=('tn5250j-plugin-itext: to convert the spool texts in PDF'
            'tn5250j-plugin-jtopen: to export spool and data files'
            'tn5250j-plugin-jython: to execute Python scripts inside tn5250j'
            'tn5250j-plugin-kunststoff: to apply the Kunststoff look and feel'
            'tn5250j-plugin-log4j: to enable a more detailed logging'
            'tn5250j-plugin-mail: to send email messages for exported data or screenshots')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}"
        "${pkgname}.desktop")
sha256sums=('45c009695cde613d9b419970277ecb010604705ae2deb52a2e45bc4c105053ba'
            '02ae481923b7f94b4852a5f706b97086245d2fa37aed4c5934dd77d38cf0d5de'
            'ba0fc30eab33ead695cffdba329dbadf8d05f67adac9a34fa905827a60421fcd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Fix Java version
  sed -i 's/compile.source" value="1.6"/compile.source" value="1.8"/' build.xml
  sed -i 's/compile.target" value="1.6"/compile.target" value="1.8"/' build.xml
  # Copy (as rename) some icons
  cp -f "resources/tn5250j-128.png" "resources/tn5250j-128x128.png"
  cp -f "resources/tn5250j-256.png" "resources/tn5250j-256x256.png"
  cp -f "resources/tn5250j-512.png" "resources/tn5250j-512x512.png"
}

build() {
  cd "${pkgname}-${pkgver}"
  ant compile
}

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install startup script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"

  # Package 
  cd "${pkgname}-${pkgver}"
  ant package
  # Install java packages
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "build/${pkgname}.jar"
  # Install sample files
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}" 
  cp -r scripts "${pkgdir}/usr/share/${pkgname}"
  # Install resources
  cd "resources"
  # Install icons
  for _size in 16 32 48 128 256 512
  do
    install -m 644 -D "${pkgname}-${_size}x${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m 644 -D "${pkgname}-icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}" 
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    *.txt *.policy *.properties *.html *.php *.ssl
}

