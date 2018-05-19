# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.1.3
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'libtinfo5' 'python2' 'java-runtime' 'ncurses5-compat-libs')
depends=('nodejs<10')
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/29e3f90ebfc4ff7666363af58b906df582a698a2.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/aed4b69cbebfb07134aa9e38e062dd83f4717626.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/f62ae70eb6d4fedeb676593e2ba22de29239e7e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/4a864db874d52b8e8e1f0386e96e78f7de848aea.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/71cff31a270316d9b2155f168f1130fa9f8d50fd.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/e4efd09e3b0b84e89066814afc7cdc3365d6d643.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/458dc09b26c8d0c9c69c8cbde14495968e0dd44d.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service")
sha512sums=('6b8a69ca55cfd5929fb62e01ab1405d258f2bbafe08e3729b600f1f9f83d4c94df5e9848f6880e0d39e9e3eda7d64f0141271779f9f0d1300c559a4d2ade1921'
            '9b6416b0ca38563a1d298f94ae474b43a9247ec9185c8ece63d277f0c47b13640b5b5eccce3d9ba37befeea421929881458cbab7b6df25c4dc1c1e08389f2095'
            '9ecb75a95f29e998b09cff7e98f3fae1408a779f59734fd8f5e1a1ab6e58f191d0c64006a9fa196ba5d932ca4ebcfc80a7fce089adfb5ec639df4646c6411222'
            '187086bf2c768bdbee7331b23838f161461711cb0d96b0b488a7a72e282778b22ecd2c6810e006ee4e8120686656426c5b5288584aece5b2f29b3f5224bd0092'
            '0945cf11eebd8559ab525d0e9027396c4d464c583796d211cddd81235fd0df673cf638654f4f819436dc06a4ed99d893b632edcf53fce7b654da43b44a76915d'
            '0f5681cba03d8a82d9289c76723250735dd34068fa97c848482d678b074757c85dc54141962b76866f661932a0cade64f17748d565843299cacc2c434606759f'
            '7e51ad10ee733be1f53df80ce6c95b39c5dd59065a8490f24c71c7631c828aecf13f7c8f0d8eeb9cc719d420162bd4bb71c32e1395bdf366f46e66d0061f63a5'
            'bf093d62bb93d0d9547fed738f4ac3e57bbd67f7ac45f727d4df014b0de5ac129bb27ddf55a01369c5bf62776fe1bd1300a64059c5be77c56d44794a097a5602'
            '4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787'
	    'd2378755deb5a4885558c2d800f86da8295637dc0ce056cbb03f16264c5f7219266526e067f9d361e6f910fb5b6436a41ae3fca9aec513922e486c46b745bebe'
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
