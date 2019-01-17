# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.2.7
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'python2' 'java-runtime' 'svn' 'ncurses5-compat-libs')
# ncurses-5compat-libs required to build v8
depends=('nodejs<10')
# required due to bug: https://github.com/ONLYOFFICE/DocumentServer/issues/304
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/a2d085a191132107031534e13fde30c7f6d6dc52.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/5a32b538a63f1fa97b2f2f37ecab1c3311b985c7.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/7813f0e788c7e5ec341bdeec78cfea17f7b278e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/8619e75ca503ad8365fbcb25b3ecc2ac4e13597e.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/129e9517056e345900a4dfd1932cb9c5b21049d0.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/2a1d74d30a5a8a032f49fce25c3fef07d222f95f.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/4eaf81145f3b66c5f44f4a6c2f03d80c0b64eed9.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver_amd64-${pkgver}.deb::https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('635b75c713c680427a15a3f9a315c400fec38c6f52cb6b0fc2c38b2b731a5817cff3b33b7f5b7e50126ffbb09d747962984887770d9a01ec58613073dc1875a4'
            '3d41ab7606612f61ce474631a84cd438b82af8cb1a22b8f9f9d973e7dce23ab59de8a885b139758942da5e79e8979ad968fb6ee3e52b27e5b750ad4f3f1ed068'
            '17e887ff81855c1cd41117c8d98bf2dc33d7de5792a15094ec825e9f35ed0f61038988bee7346fb74f3362bef72471e4f280eb5a9aba6585b208025fa8ffddb6'
            '71909c2cab614b568084450cc2c6e2eed11a995afde428a53a2a6dc74ec18b4cad17e54b65a5d5f9aa2b0b3554f90d83338dffeda931b899844f8720d82d5e78'
            '1f940d31f2e0573fdb9a9ea8b795ffa1deef6282e72d5691cd2bf969a3d47ac90b248d60ec1dbe52810e92f992cc1cf47bad99b7b2bb017384a4ca54239f4e47'
            'ce1c5fc2002b1af0697427f8bf74fbc66ac80191d1827f95e103da8ff9434bdf6d4bf8c5402f0bd9175327f1cf329fd6d8e57d403a89c7d6654047fb341f3750'
            'ccc96ad19d0acabd7d5af24c73bf95273db6a8b8917182ff1f4c07e3f186b962b364a10f6f0da1157bfd488873ae26c36bcb8c34ff9996ab44f6886e5634c2c0'
            '7525f8a13ad177258b13fb5dc782223e9a90eaacbc1113b63f664be64681c50025237d0a023eb0597c1f7f71f18bbfdae01ffa2ca3178f11d35a8ed9164d0991'
            '3ae4fbfdb4b639ce51a25af8a754f081c3f7c1041207199e4d450ccf0301dcdcebaf072a9b1efb3be5f0c45959c88bfeea447e032f313c9c291c15fce3979ac6'
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9'
            '7caec3420592f268b1aca608e2955dd945e1dff80abcb7b6f14e946c5e8896276e9749f33717a94d64cbd34cf8d86daad93b31ea5899a2a07df5a72b9930e015')
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
  mkdir -p "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/tools"
  cp "${srcdir}/var/www/onlyoffice/documentserver/server/tools/AllFontsGen" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/tools/AllFontsGen"
}
