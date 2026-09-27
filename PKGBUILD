# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=onlyoffice-documentserver-bin
pkgver=9.4.0
pkgrel=2
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('x86_64')
url="https://github.com/ONLYOFFICE/DocumentServer"
optdepends=(
'nginx: reverse-proxy'
)
conflicts=('onlyoffice-documentserver')
license=('AGPL')
source=("$pkgname-$pkgver.rpm::https://github.com/ONLYOFFICE/DocumentServer/releases/download/v${pkgver}/onlyoffice-documentserver.x86_64.rpm"
        "onlyoffice-docservice.service"
        "onlyoffice-documentserver.sysusers"
        "onlyoffice-documentserver.tmpfiles"
        "local.json")
sha512sums=('d02ff8904f76629b5b44a028d25db910b1c080c14a58dbeee2a8d783d98b8545b3fb81f00cd18787792739a78f6f88971fb002207620ca653b6a217fc295f1fb'
            'd028b3c5e9da33a998e35d3089d182bb0992d0ef88851d12acd7f8b53bd55a9e077729d51306afa3e203d9a05ee9b11008eb381a54bb525c37b1c6f14008a392'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            '2145478015c6a77c8435f9aaafbbd395bb2dfd87d68c850f91bd8ca1f22d4bff207309ca24992d1747cc24ca9d5828434543295327e654dee31c6634d3207363'
            'c2cf431a8c9051469ae70393ff6b672b5d0de6dd4d6247433620e5b1538f07c82dc3638196ff66fab08d06fb2bf670ad1e54b4fa85f043115e0e7955e2e97bb6')
backup=('etc/webapps/onlyoffice/documentserver/local.json')
install="onlyoffice-documentserver.install"
options=('!strip')

prepare() {
  cd ${srcdir}
  chmod -R 770 var
  #cp ${srcdir}/usr/lib64/*.so* ${srcdir}/var/www/onlyoffice/documentserver/server/FileConverter/bin/
  sed -i -e 's|/var/www/onlyoffice|/usr/share/webapps/onlyoffice|g' -e 's|/etc/onlyoffice/documentserver|/etc/webapps/onlyoffice/documentserver|g' etc/onlyoffice/documentserver/production-linux.json
  #enable mobile editor
  sed -i 's/isSupportEditFeature=function(){return!1}/isSupportEditFeature=function(){return 1}/g' ${srcdir}/var/www/onlyoffice/documentserver/web-apps/apps/{documenteditor,presentationeditor,spreadsheeteditor}/mobile/dist/js/app.js
}

build() {
  cd ${srcdir}
  export LD_LIBRARY_PATH="var/www/onlyoffice/documentserver/server/FileConverter/bin/"
  var/www/onlyoffice/documentserver/server/tools/allfontsgen --input="var/www/onlyoffice/documentserver/core-fonts" --allfonts-web="var/www/onlyoffice/documentserver/sdkjs/common/AllFonts.js" --allfonts="var/www/onlyoffice/documentserver/server/FileConverter/bin/AllFonts.js" --images="var/www/onlyoffice/documentserver/sdkjs/common/Images" --selection="var/www/onlyoffice/documentserver/server/FileConverter/bin/font_selection.bin" --output-web="var/www/onlyoffice/documentserver/fonts" --use-system="true" --use-system-user-fonts="false"
  var/www/onlyoffice/documentserver/server/tools/allthemesgen --converter-dir="var/www/onlyoffice/documentserver/server/FileConverter/bin" --src="var/www/onlyoffice/documentserver/sdkjs/slide/themes" --output="var/www/onlyoffice/documentserver/sdkjs/common/Images"
  var/www/onlyoffice/documentserver/server/tools/allthemesgen --converter-dir="var/www/onlyoffice/documentserver/server/FileConverter/bin" --src="var/www/onlyoffice/documentserver/sdkjs/slide/themes" --output="var/www/onlyoffice/documentserver/sdkjs/common/Images" --postfix="ios" --params="280,224"
  var/www/onlyoffice/documentserver/server/tools/allthemesgen --converter-dir="var/www/onlyoffice/documentserver/server/FileConverter/bin" --src="var/www/onlyoffice/documentserver/sdkjs/slide/themes" --output="var/www/onlyoffice/documentserver/sdkjs/common/Images" --postfix="android" --params="280,224"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/onlyoffice"
  cp -r "${srcdir}/var/www/onlyoffice/documentserver/" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/"
  chmod -R 755 "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/"
  install -Dm 644 ${srcdir}/etc/onlyoffice/documentserver/log4js/production.json "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js/production.json"
  install -Dm 644 ${srcdir}/{local.json,etc/onlyoffice/documentserver/{default.json,production-linux.json}} "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  install -d "${pkgdir}/usr/lib/"
#  install -Dm 644 ${srcdir}/usr/lib64/* "${pkgdir}/usr/lib/"
  ln -sf /usr/share/webapps/onlyoffice/documentserver/server/FileConverter/bin/{libDjVuFile.so,libDocxRenderer.so,libEpubFile.so,libFb2File.so,libHWPFile.so,libHtmlFile2.so,libIWorkFile.so,libOFDFile.so,libPdfFile.so,libStarMathConverter.so,libUnicodeConverter.so,libXpsFile.so,libdoctrenderer.so,libgraphics.so,libicudata.so.74,libicuuc.so.74,libkernel.so,libkernel_network.so,libooxmlsignature.so} ${pkgdir}/usr/lib/
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/web-apps/apps/api/documents/api.js.tpl" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/web-apps/apps/api/documents/api.js"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
