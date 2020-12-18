# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=art-rawconverter-git
pkgver=1.6.1_39_gf4af8f006
pkgrel=1
pkgdesc="Rawconverter ART including blackfoxx-Theme built from latest sources"
arch=('i686' 'x86_64')
url="https://bitbucket.org/agriggio/art/wiki/Home"
license=('GPL3')
depends=('lensfun' 'exiv2' 'fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'libcanberra' 'libiptcdata' 'desktop-file-utils' 'lcms2') 
options=(!strip)
makedepends=('pkgconf' 'make' 'cmake' 'git' 'gcc' 'hicolor-icon-theme' 'fakeroot' 'lcms2')
conflicts=('art-rawconverter')
source=("${pkgname}_src::git+https://bitbucket.org/agriggio/art.git#branch=master" "bft_20.zip::https://discuss.pixls.us/uploads/short-url/fG7iCaIWBWBem30O67V15EfO521.zip")
sha256sums=('SKIP' '7381c57e48b1437bec6b775029370f99f6fc14eced53678972e9f0b7e02a4346')

pkgver() {
  cd "$srcdir/${pkgname}_src"
  printf "%s" "$(git describe | sed -r 's/\-/_/g' )" 
}

build() {
  cp "$srcdir/blackfoxx-GTK3-20_.css" "$srcdir/${pkgname}_src/rtdata/themes"

  mkdir -p "$srcdir/${pkgname}_build"
  cd "$srcdir/${pkgname}_build"

  cmake "../${pkgname}_src" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCACHE_NAME_SUFFIX="-git" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DPROC_TARGET_NUMBER=2 

  NPROC=$(getconf _NPROCESSORS_ONLN)
  make -j${NPROC} 
}

package() {
  cd "$srcdir/${pkgname}_build"
  make DESTDIR="$pkgdir/" install
}
