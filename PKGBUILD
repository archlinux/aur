# Maintainer: Marco44 <cousinmarc at gmail dot com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika  <hanatos at gmail dot com>
# Contributor: Kevin Brubeck Unhammer <unhammer at member dot fsf dot org>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
pkgname=darktable-git
_gitname=darktable
pkgver=4.1.0.r657.g28547c0d90
pkgrel=1
pkgdesc="A virtual lighttable and darkroom for photographers"
arch=('i686' 'x86_64')
url=http://www.darktable.org/
license=('GPL3')
depends=(pugixml libjpeg-turbo colord-gtk libgphoto2 openexr lensfun iso-codes zlib
         exiv2 flickcurl openjpeg2 graphicsmagick lua53 osm-gps-map libsecret openmp
         gmic libavif)
optdepends=('dcraw: base curve script'
            'perl-image-exiftool: base curve script'
            'imagemagick: base curve and noise profile scripts'
            'ghostscript: noise profile script'
            'gnuplot: noise profile script')
makedepends=(git cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp perl-pod-parser)
conflicts=(darktable)
provides=(darktable)
install=darktable.install
options=(!emptydirs !libtool)
source=('git+https://github.com/darktable-org/darktable.git'
	"rawspeed.git::git+https://github.com/darktable-org/rawspeed.git"
	"OpenCL-Headers.git::git+https://github.com/KhronosGroup/OpenCL-Headers.git"
	"libxcf.git::git+https://github.com/houz/libxcf.git"
	"whereami::git+https://github.com/gpakosz/whereami"
	"darktable-tests.git::git+https://github.com/darktable-org/darktable-tests.git"
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  git config submodule.src/external/rawspeed.url "$srcdir/rawspeed.git"
  git config submodule.src/external/OpenCL.url "$srcdir/OpenCL-Headers.git"
  git config submodule.src/external/libxcf.url "$srcdir/libxcf.git"
  git config submodule.src/external/whereami.url "$srcdir/whereami"
  git config submodule.src/tests/integration.url "$srcdir/darktable-tests.git"
  git -c protocol.file.allow=always submodule update --init --recursive
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
