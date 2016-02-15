# Maintainer: orumin <dev@orum.in>

pkgname=airzoshi
pkgver=2.23.1
pkgrel=1
arch=('any')
license=('custom')
pkgdesc="The Adobe Air based ebooks reader"
url="http://www.satokazzz.com/airzoshi-desktop"
source=('http://www.satokazzz.com/airzoshi/air/AirZoshi.air'
        'airzoshi.desktop')
md5sums=('287b293d3e92606a34f2183881738ada'
         '4023c26c759217e984f99ae8581f3893')
noextract=("AirZoshi.air")
install=airzoshi.install
depends=(adobe-air-sdk desktop-file-utils)
makedepends=(unzip)

build () {
  cd "${srcdir}"

  mkdir -p $pkgname
  cd "${srcdir}/${pkgname}"
  unzip -o "${srcdir}/AirZoshi.air"
}

package () {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/airapps"

  install -dm755 "${pkgdir}/opt/airapps"
  cp -pr "${pkgname}" "${pkgdir}/opt/airapps"

  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/airzoshi"
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/airzoshi/META-INF/AIR/application.xml /opt/airapps/airzoshi/" >> "${pkgdir}/usr/bin/airzoshi"
  chmod 755 "${pkgdir}/usr/bin/airzoshi"

  for dim in 16 32 48 128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${dim}x${dim}/apps
    ln -s /opt/airapps/$pkgname/icons/AirZoshi_${dim}.png "${pkgdir}"/usr/share/icons/hicolor/${dim}x${dim}/apps/${pkgname}.png
  done

  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
