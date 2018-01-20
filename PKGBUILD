# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.0.7
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'gcc6' 'python2' 'java-runtime')
depends=('nodejs' 'icu55')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/44491bbbb4faf192e86fe1eb61a57d6db5366fa0.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/cb1c784c5489dc2afdf339069a70584b02188abb.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/314e4cbbb9d451f26c9bca2dd6fb3fe2937ed47d.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/76b7a8e8481415d8c6ab62c9fa339ef0a1c8959a.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/4ec2cb1cb3ad313837cd7e10460feefd8d11052e.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/bc07000bdc7d1e97f963baa8ecfe152cd75ac997.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('adee8b4e99317acdf37a8ef92f7d7ec1b1dbfa6b908b64201da725008e456e1aa6b27c34579c7d59ae83cfbf75f689c9f9b872620038541259d902df57ed0f86'
            '21a07e37d17fbd46c15e29945436627f56a854718ec3539af29401eff8a74ce16787463e655e4ca20f96a187cd11f15a97cf8bdb64565a4651b9c2d68d314739'
            '4dde4ca95516f78443d54803ac9f303daec1b3b799358ff68acdef253eee25a9918b07b66da762e4ba05720522dc9f63adb5029972c24e00543f71c29cc02134'
            'b3d320790172f1cba3505960942f80d138533265ef1f03764494d48844c16c9f61d453e45fb9089c6e9bd4bc0fd2cbec3e9bcb67174f3bca067f191318c56b60'
            'edbacbdca5f724b90caaf7f306bbe4d53d30a1997433cbd886c027c65a39b050d4ac78116b2842152cd876b3928dff43a3068d8cf583d662a70f5dc3dd03acfa'
            'cad6f2a49f937064cb7723e413bb298a016f6c828657a55a4639f685925e8c8bef2690d55be0af724cd02d1d6352f5d0bbabd15a2a893bff5ae0a23afe6acce2'
            '8653794436216233e01b65bf9b8c6bf8e17b8a7becb1f5a9b1763f9d24816146e342127a33ec734e413f399d1bdce9c6ec7f3987a6f434926755ce128f283156'
            '4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787'
            'b3e399258eeabb870c8735d28ab92095d7b5f3b58b45ee001efcce013027d29ba4cf18b06256453dd9f2c73ea0c156efb011a381865647c2573e825cefc039ea'
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9'
            'e5754f75f4386c9ac7d4df7aedd61cbb09c8b77de2bd38cdf606cbfa750712626e0d3bd417a10e718736085c80b21201134f4e0f17dbbb18b67e9cc09590fffa')

install="onlyoffice-documentserver.install"
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')

prepare() {
  # Unfortunately, v8 depot_tools still requires python2
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  # v8 compiling has issues with gcc7
  ln -sf /usr/bin/g++-6 path/g++
  ln -sf /usr/bin/cpp-6 path/cpp
  ln -sf /usr/bin/gcc-6 path/gcc
  ln -sf /usr/bin/c++-6 path/c++

  cd "${srcdir}"
  rm *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  rm -r core dictionaries sdkjs sdkjs-plugins server web-apps
  mv ../core-* core
  mv ../dictionaries-* dictionaries
  mv ../sdkjs-plugins-* sdkjs-plugins
  mv ../sdkjs-* sdkjs
  mv ../server-* server
  mv ../web-apps-* web-apps

  # patching v8 compile error
  sed -i 's/-fPIC/-Wno-unused-function -Wno-unused-variable -fPIC/g' core/Common/3dParty/v8/build.sh
  # -Wno-attributes
  # force system binutils, see: https://bbs.archlinux.org/viewtopic.php?id=209871
  sed -i 's/-Dclang=0/"-Dclang=0 -Dlinux_use_bundled_gold=0"/g' core/Common/3dParty/v8/build.sh

  #sed -i 's/4.10.253/6.5.109/g' core/Common/3dParty/v8/fetch.sh

  # python2 dependency for gclient
  sed -i '13iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/fetch.sh
  # gcc6 dependency for v8
  sed -i '3iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/build.sh

  # patching core/desktopeditor/docbuilder file
  patch -p0 -i ../docbuilder_p.patch

  # Patching Makefile to include DESTDIR variable
  patch -p0 -i ../server_makefile.patch

  # Patching configuration file
  sed -i 's/\/var\/www\/onlyoffice/\/usr\/share\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
  sed -i 's/\/etc\/onlyoffice/\/etc\/webapps\/onlyoffice/g' server/Common/config/production-linux.json

  # Unpacking upstream binary release, we'll need some files later because of a bug
  cd "${srcdir}"
  tar xf data.tar.xz
}

build() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"

  # workaround bug https://github.com/ONLYOFFICE/onlyoffice-owncloud/issues/42
  export PRODUCT_VERSION=${pkgver}

  # Download & build third party modules 
  cd core/Common/3dParty
  ./make.sh

  # Building core
  cd ../..
  make

  # Building sdkjs
  cd ../sdkjs
  make

  # Building server
  cd ../server
  make 
}

package() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  cd server
  make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"

  # Overwrite two files with upstream bianry versions because of bug https://github.com/ONLYOFFICE/onlyoffice-owncloud/issues/114
  cp "${srcdir}/var/www/onlyoffice/documentserver/server/FileConverter/bin/x2t" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/FileConverter/bin/"
  cp "${srcdir}/var/www/onlyoffice/documentserver/server/FileConverter/bin/libdoctrenderer.so" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/FileConverter/bin/"
}
