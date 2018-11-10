# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.2.3
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'python2' 'java-runtime' 'svn' 'ncurses5-compat-libs')
depends=('nodejs<10')
# required due to bug: https://github.com/ONLYOFFICE/DocumentServer/issues/304
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/626eb872030b8fb58fc57cc2e4778b0ed7963728.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/0d246d12a5cefb9e40f18b9bf4e7f44c75534989.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/7813f0e788c7e5ec341bdeec78cfea17f7b278e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/aa459b7d980385fa57adb9dd11b05c1970e5c8c8.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/979cdb6379936b54819ebc282713e62c88ad4c5f.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/4494ce9f107884bee03b64ca71df6896ca39355a.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/b7a396449328fbbc9610664bdb02a34cfe384b9b.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('adf4ca2422141a10cab745d3098cc9e6d631270183d37129b59b697a8b73189102eb1130e3d28e151b41231d5fd0481db40dd5b7e94bc584d10d5c8444cd6400'                                                              
            '0f2bf466bdb09ad52dd7890a2ba4adbde3b33df7340ea66774a8c024d33f7ae02c8ce7451f1cb0723a522f31df807926f20615a7861a888fe88cb022a8b84cfa'                                                              
            '33e6611cda7ac6616c5cebc5ce35bf1d0c29e2d39a31248e8483bb67ba4f1febb480ccd9d3c617626c85151a5f68584a3e58a7d478f9227d8fcea68cc287ea34'                                                              
            '71909c2cab614b568084450cc2c6e2eed11a995afde428a53a2a6dc74ec18b4cad17e54b65a5d5f9aa2b0b3554f90d83338dffeda931b899844f8720d82d5e78'                                                              
            '5a1f26dbf1090c564b571a45e297bca0f922186de696f232f4d8a6f5a5284090f73ccae6809c9e0aa0ee474bbb2c6efccc272bc456ab4bb54e692b8fc7776bc9'                                                              
            'd1e7d7e1dc60e29fcc62b8557ba1685a65d7513500f792101e6efd3883443cb1cea0810d8cbae65535228e351d02a6bf06a86e409eb33c683d1644c2606fc0d4'                                                              
            'ca6576c56a0e592fce6a6bf9965aee7181defd618606703a72fe410f76dc233397cd9a0dd6fa57a03b4cc45215f598d7d5056998b437d8bc83de48d54e87b570'                                                              
            '59ca961fc2bba846bcb11f3cbc1f92eb1e99af08ac83dbd9c931b722f3386aa703ecc5729a59600981d0c3d20373c02bc85a9bbd188943c2d575eb6072f448a3'                                                              
            '3ae4fbfdb4b639ce51a25af8a754f081c3f7c1041207199e4d450ccf0301dcdcebaf072a9b1efb3be5f0c45959c88bfeea447e032f313c9c291c15fce3979ac6'                                                              
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'                                                              
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'                                                              
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9'                                                              
            '8524895730c315a673921f4b95b21cf7a045330fc5b99826a2009bc4174f582eeefca701be7a884bc50ca4ac94f9bfdd4003c90de5c8b4e5cc26c62ad884deea')
install="onlyoffice-documentserver.install"
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')

prepare() {
  # Unfortunately, v8 depot_tools still requires python2
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd "${srcdir}"
  rm *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  rm -r core core-fonts dictionaries sdkjs sdkjs-plugins server web-apps
  mv ../core-fonts* core-fonts
  mv ../core-* core
  mv ../dictionaries-* dictionaries
  mv ../sdkjs-plugins-* sdkjs-plugins
  mv ../sdkjs-* sdkjs
  mv ../server-* server
  mv ../web-apps-* web-apps

  # Use clang instead of gcc because of compile errors
  sed -i 's/is_clang=false/is_clang=true/g' core/Common/3dParty/v8/build.sh

  # python2 dependency for gclient
  sed -i '13iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/fetch.sh
  sed -i '29iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/build.sh

  # Patching Makefile to include DESTDIR variable
  patch -p0 -i ../server_makefile.patch

  # Patching configuration file
  sed -i 's/\/var\/www\/onlyoffice/\/usr\/share\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
  sed -i 's/\/etc\/onlyoffice/\/etc\/webapps\/onlyoffice/g' server/Common/config/production-linux.json

  # allfontsgen segfaults, some error in icu lib. copy compiled version from deb package
  cd "${srcdir}"
  tar xf "${srcdir}/data.tar.xz"
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
  make DOCUMENT_ROOT="/usr/share/webapps/onlyoffice/documentserver" DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  # fix allfontsgen binary
  cp "${srcdir}/var/www/onlyoffice/documentserver/server/tools/AllFontsGen" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/tools/AllFontsGen"
}
