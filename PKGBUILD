# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.8.13
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'libcxml>=0.17.3' 'libsigc++>=2.0' 'boost-libs>=1.72.0' 'libasdcp-cth>=0.1.6')
makedepends=('git' 'cmake' 'python' 'boost>=1.72.0' 'gcc' 'pkg-config')
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}"  
        "openjpeg-carl::git://git.carlh.net/git/openjpeg.git#branch=carl-2")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  ### Ugly fix for custom openjpeg ###
  _openjpeg_builddir=$srcdir/openjpeg-build
  cd $srcdir/openjpeg-carl
  CFLAGS+=" -fPIC"
  cmake -B $_openjpeg_builddir  -DCMAKE_BUILD_TYPE=None -DBUILD_PKGCONFIG_FILES=ON -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=$srcdir/openjpeg-install -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS"
  cmake --build $_openjpeg_builddir
  cd $_openjpeg_builddir
  make install
  cd $srcdir/openjpeg-install
  ### Remove shared libs (why are they built anyway?) ###
  find . -type l -name '*.so*' -exec rm {} \;
  find . -type f -name '*.so*' -exec rm {} \;
  rm -r bin
  ### Rename pkgconf-file to avoid conflict with system openjpeg ###
  mv lib/pkgconfig/libopenjp2.pc lib/pkgconfig/libopenjp2-carl.pc

  ### Configure libdcp ###
  cd "$srcdir/${pkgname}-${pkgver}"
  ### Patch wscript to use static openjpeg-carl ###
  sed -i 's/libopenjp2/libopenjp2-carl/' wscript
  PKG_CONFIG_PATH=$srcdir/openjpeg-install/lib/pkgconfig \
  python waf configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
