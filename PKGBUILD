# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=onlyoffice-documentserver-bin
pkgver=9.2.0
pkgrel=2
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('x86_64')
url="https://github.com/ONLYOFFICE/DocumentServer"
depends=('rabbitmq')
optdepends=(
'postgresql: PostgreSQL database'
'mariadb: MariaDB database'
'nginx: reverse-proxy'
)
conflicts=('onlyoffice-documentserver')
license=('AGPL')
source=("$pkgname-$pkgver.rpm::https://github.com/ONLYOFFICE/DocumentServer/releases/download/v${pkgver}/onlyoffice-documentserver.x86_64.rpm"
        "onlyoffice-fileconverter.service"
        "onlyoffice-docservice.service"
        "onlyoffice-documentserver.sysusers"
        "onlyoffice-documentserver.tmpfiles"
        "local.json")
sha512sums=('a8f61c1e42b2df750a5cea6223d3dae0c5fd398cad3924d0f4112fcdbad2d9a63cefeec9607ae233d3f72b6cb359eb0a471a307e2466ff9ea5888daf2a57b7c3'
            '329adb3a5191e8982b4131dab7ddba7ef700f8bdfd4a39f7021ad9a983105dcb97e46ab798b015e0586a15a1f3454d89000a251e1b0bac4dd2d8a682cce82b4f'
            '3df1f5339b394eef1b27317f5d0e7786d2cb8dbbd13cddb22047567c3703f384d95f092fc34ce3031aeb895f013d7c0686ce968e1fae7f1f24473c1a6615f7ad'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            '2145478015c6a77c8435f9aaafbbd395bb2dfd87d68c850f91bd8ca1f22d4bff207309ca24992d1747cc24ca9d5828434543295327e654dee31c6634d3207363'
            '60e2e68f6aa71f8ac474ba7640008a6b41052a78e9d9a7f289c9aaa04fb1d2b3de30294a9f761a5834fbc0e42db4823ec0cc73504024425d8efe6bf430b71dc7')
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
  ln -sf /usr/share/webapps/onlyoffice/documentserver/server/FileConverter/bin/{libDjVuFile.so,libDocxRenderer.so,libFb2File.so,libHtmlFile2.so,libicudata.so.58,libkernel_network.so,libPdfFile.so,libXpsFile.so,libdoctrenderer.so,libEpubFile.so,libgraphics.so,libHtmlRenderer.so,libicuuc.so.58,libkernel.so,libUnicodeConverter.so} ${pkgdir}/usr/lib/
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/web-apps/apps/api/documents/api.js.tpl" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/web-apps/apps/api/documents/api.js"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
