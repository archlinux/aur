# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=4.4.3
pkgrel=15
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'gcc6' 'python2' 'java-runtime')
depends=('nodejs' 'icu55')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/89ce79dafc29b17fb0155076b23dcf794bf20377.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/a02b830a17af89bba8a3bb5694f4c5bd56a43585.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/5fcb16b7cdb0d07decb532145d96d2be7467aa43.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/5408aee50a101bce6910af64136f5affaf858e9d.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/a9b6455d7dbd61b0e756adc519d0e507e5a72429.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/2fea60996d7a924f3ef6859f07c768133d590427.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service")
sha512sums=("11bb99fd287ef961e6f57e97224d46b5d4d80f21b13f0a0f61c095f4fcf3df9f45a13fc41646e04c4cbb3b83ff985a9e9dd820754a7c6cf4a8e5661ecb8a5c42"
	    "554bd86590a850cda0b0725e3864265d3d5ce408e8e84e48937ee7fd752aee68926fc9fbe8bbc647fc3f3396d2849ab8e361629b5407f5e88b63c9b14c6d7a24"
	    "15c3581d517ff3b4bd80b008b661fd9cfe1d46da5935d6544f691188a8dab193c1b93712f29f351ca26ff22dc44166019b7d09b262a7072feb673844cf7969c1"
	    "36983612b43bf3e0c71c742f17fb85e8d9c5b4e813a259670a4da0599efc7f2e1082214ac025d9cd9672e5f802e7290bca3555da9a8360fc600b729ddb7a57f2"
	    "10af74017ac5e19aa6162f5d34cb3d3fb0b23cfb9c863cb2007efed5869041b496ec8cd1e5886880f125e91c63f496791fa1fec3b4b54672cb015824bdc37549"
	    "21a71b80ecb597c1e50df7b79d05383c26ab3b6c98a7d582e9f1cde78a5724856f3312b690184e7191918004d2a7d2524d16f28694dc1cac4f22b9a258a6be8c"
	    "c39af73262ff36b688d31f12d7ab26a64f3d1dd677a9e142d994a01d931bbfb575e0f6dc47651a3e68d3728c74a65958979c904675868e2953f34b971afbec4b"
	    "4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787"
	    "b3e399258eeabb870c8735d28ab92095d7b5f3b58b45ee001efcce013027d29ba4cf18b06256453dd9f2c73ea0c156efb011a381865647c2573e825cefc039ea"
	    "5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417"
	    "428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a"
	    "6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9")
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
