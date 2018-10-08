# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.2.2
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
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/332348ef5b7f3bfb8c2ae972549b2d699e8e3f9e.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/0d246d12a5cefb9e40f18b9bf4e7f44c75534989.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/7813f0e788c7e5ec341bdeec78cfea17f7b278e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/c4ffe51d068024d8da9f90645d592527900b439b.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/c0223268a6f292709badddb8e7405cc368fc8226.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/b095f3950681898af5f88d5626d6ebce8a37ba80.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/e822b938cb59852179dfd96a10e35e40368d4aec.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('ace6564057f7b7feaef3c6688fb9c8451997a24e0c64d333b785b6c920179dbcb33156aeb08aa5a587403d0aa8428fdafe1b7ed41aed8121540da5ecab1141c2'
            '1a3990ce7a2302c43c79d03342afebeed36f45f8fcb8bb2ff31253b680d475100d05bbedbb3e3078445af466a4d66fc2fec0f0e8d571c18050397ff07a9b7e27'
            '33e6611cda7ac6616c5cebc5ce35bf1d0c29e2d39a31248e8483bb67ba4f1febb480ccd9d3c617626c85151a5f68584a3e58a7d478f9227d8fcea68cc287ea34'
            '71909c2cab614b568084450cc2c6e2eed11a995afde428a53a2a6dc74ec18b4cad17e54b65a5d5f9aa2b0b3554f90d83338dffeda931b899844f8720d82d5e78'
            '9e20754a37748cdcc0984c2cc31b9dd1d349af3f20471fbabf3b6a973a711b573b9e46c42630dfae8f62e583bc01bf6b4b0b15241799e1ca5882ef71a4ac9d1f'
            '732c3731db50e542440932feb4c33e9d65df58d82552e0aa7fb0a3a2391a8538f5b62824a79d319f0690a7f4b603d89d7bc8778972843c7f43dde700b8d48c34'
            'a4aae5851fec64347f489acb73d7bb63561958c16a1111375fbb3b68fa0de2b73f534ae4a18f2500758e1222badd4696ced895b535f830b58f561bde3e7c8856'
            '94664c91b3c2b1c43cbe3fbcaef6c88e070c72201b3d0ee1b9994b962adc4c3eb8cb6e88c63b55a5a23e61ed61789bfde87c3fef81dff55d67f854a101a0eb66'
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
