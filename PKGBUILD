# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.2.4
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
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/2b8efdd9b1b54211d353865e1f2fd1cf8a73711f.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/0d246d12a5cefb9e40f18b9bf4e7f44c75534989.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/7813f0e788c7e5ec341bdeec78cfea17f7b278e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/326ae8e743afa27224cebf2c9d950e77bd45ae77.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/979cdb6379936b54819ebc282713e62c88ad4c5f.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/bf1751662bf45070e1c8bcc9fb8c20c0923bfdb3.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/a5d2f236a17d21ac0a9cfc91f4c237d685fec542.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver_amd64-${pkgver}.deb::https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('52fade948b4405029663bf2d2f4bfd7a37b03d8ca90f15fa1d34d4878c1d183c2631a754f3142b52690a323e2707f2f357115f3c016f759a40f91b7277ac2803'
            '1c6608fc2ff7c3a98f43df4dc08da35f256a8378dd20b09dc31c543d7f7aa941b88be36b3a8bcb07c5394751c40bd61cdd77697f8bd5efeafac623162b6a8432'
            '33e6611cda7ac6616c5cebc5ce35bf1d0c29e2d39a31248e8483bb67ba4f1febb480ccd9d3c617626c85151a5f68584a3e58a7d478f9227d8fcea68cc287ea34'
            '71909c2cab614b568084450cc2c6e2eed11a995afde428a53a2a6dc74ec18b4cad17e54b65a5d5f9aa2b0b3554f90d83338dffeda931b899844f8720d82d5e78'
            '05cf570376768ba97a4f36c4dc0d2b878c451f5387775a7489a236602b6b2467f3e78e3f092f339a6655c4622bbcbbe2f7838721bc486debd21ab0e7d52cbadd'
            'd1e7d7e1dc60e29fcc62b8557ba1685a65d7513500f792101e6efd3883443cb1cea0810d8cbae65535228e351d02a6bf06a86e409eb33c683d1644c2606fc0d4'
            '9a5e6fcf2aa98430fa1877e929e29772d46c817d072e506cdeaf3587a9b5d6a33c30e6d7e11b44273effce378ba1d3b46b5ca2a636a43c6b7887ca4252f7b221'
            'c8e02b5519b04baf17880d812f02e56a8c9d2eedf641fbea559b3741453e16e3e5e2809f33334fa16ef4963634552fcb83ca494226600fa56f643e43cc0c5edb'
            '3ae4fbfdb4b639ce51a25af8a754f081c3f7c1041207199e4d450ccf0301dcdcebaf072a9b1efb3be5f0c45959c88bfeea447e032f313c9c291c15fce3979ac6'
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9'
            '1586cd60149f105c12b466b7236cc9fbf56303aa47d5c77b0ff9292f91aae6307c4682c7fc581b9851fc6d1dd53d26a1029b7dde99264bbc615504f00df06395')
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
