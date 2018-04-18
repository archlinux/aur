# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.1.2
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'libtinfo5' 'python2' 'java-runtime' 'ncurses5-compat-libs')
depends=('nodejs')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/a8bcd38bce62b6a7b74b9c8234d18f584d3f3178.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/aed4b69cbebfb07134aa9e38e062dd83f4717626.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/f62ae70eb6d4fedeb676593e2ba22de29239e7e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/5c0f40a8329dafea7f110d34bd8fdd587466d975.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/71cff31a270316d9b2155f168f1130fa9f8d50fd.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/e7d583b615c75b6faaa569c3b0257940e6ca44f3.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/3c543e210360a4b78643981cf7da54496061b547.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service")
sha512sums=('ddb11e11c48c56f426992bb8073dcb16839ef2dfeecbe34a391a1ce49709b30d501d382a333e4c643324b55e63e3d023ff27f6baab6545740251f41c5963bcd2'
            '88c4b96bfaa2809e5b9c21b64794cdf1e22dea1225306dab6a9dc422bb3fae6cfa30dacb0e3879537a9f89e53e26d0319eead9014cf8d60a7316b6c5436b6bb4'
            '9ecb75a95f29e998b09cff7e98f3fae1408a779f59734fd8f5e1a1ab6e58f191d0c64006a9fa196ba5d932ca4ebcfc80a7fce089adfb5ec639df4646c6411222'
            '187086bf2c768bdbee7331b23838f161461711cb0d96b0b488a7a72e282778b22ecd2c6810e006ee4e8120686656426c5b5288584aece5b2f29b3f5224bd0092'
            'e95b662d7cbddb8bbd822782fdd98fd671d7223909fb957c9af4725c7a70f424d5591102764f1567d17f5c82d61b0f63af432e097b0bca283d4d1992de743cb9'
            '0f5681cba03d8a82d9289c76723250735dd34068fa97c848482d678b074757c85dc54141962b76866f661932a0cade64f17748d565843299cacc2c434606759f'
            '9c05912c939dbddac5867d82204585f782dfa9db32c57c26d97c07061c856158f89aa6cc91ba58a6bd976bd2d43cae911650a3fd8e7f4571097f5386de42f492'
            '0cd1cd511dc8c9eede090bc328513963524ac91f5327799089a06a45d97b6971a30956277ea852e892285e9261c2bf2d669d8d4a29ec914bf24ac1e455c2c224'
            '4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787'
            '0225e8ed66166c663d9359608a824a281fa390ff565e7d5c52337dceee45d584874ef727f66dbcdfb4c922a0d9b8f42e0bce771e96d29c85d5b325c3a92294c2'
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
