# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.0.3
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'gcc6' 'python2' 'java-runtime')
depends=('nodejs' 'icu55')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/e69c1677b29b5a97dcba65b093de464fac480a8f.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/cb1c784c5489dc2afdf339069a70584b02188abb.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/83abcebaeb7950f6ef69fdb61fe9e79ce08a10ec.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/dae8b532a7c167aba1d0f7ee16b12ee110850bc3.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/d65f448c1ff51fa72e050bb6c9ab4b451a06910c.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/2696c3c75c017566ffb7ead7c086220888ccba49.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service")
sha512sums=('1be0cce50382fd2a026bbecfa15d3d24a262586d08d09c63fcc13d5e2f03a13629eeabc6e3a0075b441994498bb7420fa4dec849efd22395e7b230b0ef703674'
            '9bbf5c7228d5e5f5202551148c867574062df73eebe7dedd41aac47e0a18fa87ea2164fe4eee4da889f85872eeb5dfd3f80444a43ad0247f4beca4e2127f7a86'
            '4dde4ca95516f78443d54803ac9f303daec1b3b799358ff68acdef253eee25a9918b07b66da762e4ba05720522dc9f63adb5029972c24e00543f71c29cc02134'
            '0ba62ab91714e5dacf455163db2456516a58efacbef67056c89fea6fa8be6fd80a57974e9580d57b01978a24af1d9f3921ad23244cf2c23d18ccd51cd83e21e0'
            'de6ab6270afcbfbd79a1ae5d2a7d5a1eaf3ab08720e797c8e82134e0a35f5ccc5a578157b6c95693709a9e3f74a9919d0aeef37fbb549c624cae9b377eebf584'
            'eaa3067ab1bec2745b472f2e86de95106d922435cb818f5a966afe6d79cf221f6bae697673f3e1c4e5a56dfec11a851250f31a610bf4382f21bbe8ab377ace1c'
            '5e7ea900121725b1b65a297369124b7e9cd099baade1caeef8c708ac1145ee9633a2190652410c8498aa67b1d2a62f931a4ca2d321d90387b7862b2a3fa13d1a'
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
