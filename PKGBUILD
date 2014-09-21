# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=omplapp
pkgver=0.14.2
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost' 'python' 'pyqt' 'python-opengl' 'assimp' 'pqp' 'libccd' 'fcl')
makedepends=('cmake')
provides=(ompl)
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz
        boost_1_56.patch)
md5sums=('c4cd3527630156f284b06d4a33690601'
         '8087bef2cfce7d95edee33ae85d3864f')
sha256sums=('980baf8c8c0ba33d95cc04d7aa33d6a11bf8941dcc78811b51b5466543ca332a'
            '87da05e25991a663a619917b944c6f37623a70e4af700eeb4069a38623ed4558')
sha384sums=('e6b5d5ee11410256e5665a05cd0839a1351e3c37a77b287775fe76c3a2a14e9059a40b161a1cd3a7cc77bc025c979156'
            '080a77a1ee40a9e066ec4d11d53f83d1dce120f601bbb9f4d4324a817e62479a6b8037aa76040ffc6a83ce90fbfa927f')
sha512sums=('9ab893f702f63e876f58c12558bd2c07194c5c627e981b3990063f8500f70a9fe833dd506f405bdb96bc874936cd3022bb865687a3b18eb3f8f0ddf16cc92747'
            'f02e23c6c825577cc8e40eaeab5d9c5420df7923b6d91dbc37244a6e2b149c4e76e4d3b102807e0bcc9777cfd9a6102e7137d46a6b8e131e14c72261b285889a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  patch -p 0 -d ompl < ${srcdir}/boost_1_56.patch

  # pkg-config provides <LIB>_INCLUDEDIR instead of <LIB>_INCLUDE_DIRS
  sed 's/# Check for FCL and CCD installation, otherwise download them./set(CCD_INCLUDE_DIRS ${CCD_INCLUDEDIR})\nset(FCL_INCLUDE_DIRS ${FCL_INCLUDEDIR})/g' -i CMakeModules/UseFCL.cmake

  rm -rf build
  mkdir build
  cd build
	
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOMPL_BUILD_PYBINDINGS=yes \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DOMPL_REGISTRATION=Off ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cd build
  #make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cd build
  make DESTDIR=${pkgdir} install
}

