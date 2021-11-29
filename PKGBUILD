# Maintainer: tharazgul <tharazgul at gmx dot at>
# Contributor: tharazgul <tharazgul at gmx dot at>
pkgname=darktable-cr3
_gitname=darktable
pkgver=3.6.1
pkgrel=1
pkgdesc="A virtual lighttable and darkroom for photographers with CR3 support"
arch=('i686' 'x86_64')
url=http://www.darktable.org/
license=('GPL3')
depends=(pugixml libjpeg-turbo colord-gtk libgphoto2 openexr lensfun iso-codes zlib sed
         exiv2 flickcurl openjpeg2 graphicsmagick lua53 osm-gps-map libsecret openmp
         gmic libavif)
optdepends=('dcraw: base curve script'
            'perl-image-exiftool: base curve script'
            'imagemagick: base curve and noise profile scripts'
            'ghostscript: noise profile script'
            'gnuplot: noise profile script')
makedepends=(git cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp)
conflicts=(darktable)
provides=(darktable)
install=darktable.install
options=(!emptydirs !libtool)
source=('git+https://github.com/darktable-org/darktable.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname 
  git checkout release-3.6.1
  git submodule init
  git submodule update
  cd src/external/rawspeed
  git config remote.origin.url https://github.com/cytrinox/rawspeed.git
  git fetch
  cd ../../..
  git config submodule.src/external/rawspeed.url "https://github.com/cytrinox/rawspeed.git"
  git config submodule.src/external/rawspeed.branch "canon_cr3"
  git submodule update --remote
  sed '/-Werror/d' -i src/CMakeLists.txt
}

build() {
  cd $_gitname
  [[ ! -d build ]] && mkdir -p build
  cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBINARY_PACKAGE_BUILD=1 \
        -DBUILD_USERMANUAL=False \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_COLORD=ON \
        -DBUILD_CURVE_TOOLS=ON \
        -DBUILD_NOISE_TOOLS=ON \
        -DRAWSPEED_ENABLE_LTO=ON
  make -C build

}

package() {
  cd $_gitname
  make -C build DESTDIR=$pkgdir install
  ln -s darktable/libdarktable.so "${pkgdir}"/usr/lib/libdarktable.so
}
