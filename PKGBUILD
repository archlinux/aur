# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=4.4.3
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'gcc6')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.zip::https://github.com/ONLYOFFICE/core/archive/89ce79dafc29b17fb0155076b23dcf794bf20377.zip"
	"dictionaries-${pkgver}.zip::https://github.com/ONLYOFFICE/dictionaries/archive/a02b830a17af89bba8a3bb5694f4c5bd56a43585.zip"
	"sdkjs-${pkgver}.zip::https://github.com/ONLYOFFICE/sdkjs/archive/5fcb16b7cdb0d07decb532145d96d2be7467aa43.zip"
	"sdkjs-plugins-${pkgver}.zip::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/5408aee50a101bce6910af64136f5affaf858e9d.zip"
	"server-${pkgver}.zip::https://github.com/ONLYOFFICE/server/archive/a9b6455d7dbd61b0e756adc519d0e507e5a72429.zip"
	"web-apps-${pkgver}.zip::https://github.com/ONLYOFFICE/web-apps/archive/2fea60996d7a924f3ef6859f07c768133d590427.zip")
sha512sums=("11bb99fd287ef961e6f57e97224d46b5d4d80f21b13f0a0f61c095f4fcf3df9f45a13fc41646e04c4cbb3b83ff985a9e9dd820754a7c6cf4a8e5661ecb8a5c42"
	    "25cbd3e4fb8b9e940d76928cd170f83de1c806a8868537d10edae41db1a44ded41d891a81c39e47b53d9cc0fbf27fe718a51696498a26b7faadc53f7e65e0dc9"
	    "5a1519382a877c8792b660192ad963036cc848f8700e08ff4a74ed78ce35c493e678a2ab589d591dbbd9ac145793a0b7158df275693128e147b2e0cbde103799"
	    "6eeb795156743bb633926633a1c1a6265315976832c39b77d61ce9de8fceed84084a5623d566f73969e969e2a481f0a8a9e7cf142507a9ee226a301bb57717be"
	    "ab290779fe1fece33d6dcbf34ef23107821fed371f1daf840fd2c8ac48b89b5f860ed06f1b4ef1cb3a3f5d55628af9b4eb44d3499c492f2a01b787db7f05e7dd"
	    "9904dd43fd0e9b0be751a1f8ad4fdb8910625d35eae16616e9e8d85c8c87e02fe1d70fdc5fea0e32016b4a103f4690200b80276347b5ab312cbec61b09a353d6"
	    "cb44f7e5fd3a86aab16392e056ecbdfb4cf607d552c6c2e838b3170f1f8258a43f66cda39d22198a21719ac4cd93579fee77102c392375992682b91b85aee231")

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
  rm *.zip *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  rm -r core dictionaries sdkjs sdkjs-plugins server
  mv ../core* core
  mv ../dictionaries* dictionaries
  mv ../sdkjs-plugins* sdkjs-plugins
  mv ../sdkjs* sdkjs
  mv ../server* server
  mv ../web-apps* web-apps

  # patching v8 compile error
  sed -i 's/-fPIC/-Wno-unused-function -Wno-unused-variable -fPIC/g' core/Common/3dParty/v8/build.sh
}

build() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"

  export PATH="$srcdir/path:$PATH"

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
  cd "${srcdir}/DocumentServer"
  cd server
  make install
}
