# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fabian Kosmale <0inkane@googlemail.com>
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
# Contributor: alejandronova

pkgname=strigi
pkgver=0.7.8
pkgrel=10
pkgdesc="Fast crawling desktop search engine with Qt4 GUI"
arch=('x86_64')
url="http://www.vandenoever.info/software/strigi/"
license=('GPL2')
depends=('bzip2' 'exiv2' 'libxml2' 'boost-libs' 'ffmpeg')
makedepends=('qt4' 'cmake' 'boost')
source=("http://www.vandenoever.info/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "gcc48.patch"
        "ffmpeg3.patch")
md5sums=('d69443234f4286d71997db9de543331a'
         'd48d65014650644ba61821813101c2f4'
         'dd55602c70e8931af12ec803574789e2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/ffmpeg3.patch"
  cd libstreams
  patch -p1 -i "${srcdir}"/gcc48.patch
}

build() {
  mkdir build; cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_INOTIFY=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_LOG4CXX=OFF \
    -DENABLE_FAM=OFF \
    -DENABLE_CLUCENE=OFF \
    -DENABLE_CLUCENE_NG=OFF \
    -DENABLE_FFMPEG=ON \
    -DFORCE_DEPS=ON
  make
}

package() {
  cd build/
  make DESTDIR="${pkgdir}" install
}
