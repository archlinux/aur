# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.0.6
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'gcc6' 'python2' 'java-runtime')
depends=('nodejs' 'icu55')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/e7bbbec0de5a18bea3fa579352fb8c482e7e4cbe.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/cb1c784c5489dc2afdf339069a70584b02188abb.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/57662fae243d118b242c297ec6dd55d45afdc5cb.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/248aef0a8af74ad41d82b5ff13f5038665860d20.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/e868cfd7a3f1a42cde9a078ac451c77bb27a77a5.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/2aa82b55c0970aee78fba8cec56a3ad00863aa6b.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service")
sha512sums=('f077b0f749a54a2ee8b23876328cbc2114dd6de374fc8b92da5866f98bf3d6dcdd2ffa321b24e7e5a2e8a27b46c132f7cf2fd20295a0cf21b9839295f579e7f2'
            '1e97ce4db85f73925773e598230e40e71ca32519f22677e2cd70c81366a6ccf317ecf0a1126443316ddac1125a13891f03b718f03d23cf917b46de1fc0999a80'
            '4dde4ca95516f78443d54803ac9f303daec1b3b799358ff68acdef253eee25a9918b07b66da762e4ba05720522dc9f63adb5029972c24e00543f71c29cc02134'
            '0291aa72bbe0b3ccb6c854e55a9f154802e769dd83e621df6a19520e7ae62dd161d84c87bb450b10e88436f434478836ffbd7dc298240a9fce39924f2689c606'
            '00161073ac32a91e40abc442af5090dbc38ecddd1f3ce0d6ddf1c5ce39132ded63e7a829376a6b1ce611007a479ef88d50379676a2ce09f2804eb4cf83073512'
            '9a0418030d165e295f93a3b0a2c89e3cf352201629fda8e7f049dd61271382b3f13dd31da8033350a4c03375569c941295ec00f9dcb28d9421066b2d498747c1'
            '39b4d47bf9365ebcd0bae0dd1cd0d15f6220c20fae9d2445f6e2a08e041d44e8d70c351742d0171d92a391de5a7b3c401a41c7d5a04556265069de9b47ef02fd'
            '4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787'
            'b3e399258eeabb870c8735d28ab92095d7b5f3b58b45ee001efcce013027d29ba4cf18b06256453dd9f2c73ea0c156efb011a381865647c2573e825cefc039ea'
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9')
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
  # force system binutils, see: https://bbs.archlinux.org/viewtopic.php?id=209871
  sed -i 's/-Dclang=0/"-Dclang=0 -Dlinux_use_bundled_gold=0"/g' core/Common/3dParty/v8/build.sh

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
}
