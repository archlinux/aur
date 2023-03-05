# Maintainer: Matt Maguire <matthew.maguire at gmail dot com>
# Contributor: Marco44 <cousinmarc at gmail dot com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika  <hanatos at gmail dot com>
# Contributor: Kevin Brubeck Unhammer <unhammer at member dot fsf dot org>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
pkgname=rdarktable-git
_gitname=ansel
pkgver=v0.0.0.r187.g70c875b2d
pkgrel=2
pkgdesc="Ansel camera raw editor and asset manager from Aurélien Pierre, forked deom darktable."
pkgdesc="Aurélien Pierre's Ansel fork of the darktable camera raw editor/asset manager"
arch=('i686' 'x86_64')
url=https://github.com/aurelienpierreeng/ansel/blob/master/README.md
license=('GPL3')
depends=(pugixml libjpeg-turbo colord-gtk libgphoto2 openexr lensfun iso-codes zlib
         exiv2 flickcurl openjpeg2 graphicsmagick lua53 osm-gps-map libsecret openmp
         gmic libavif)
optdepends=('dcraw: base curve script'
            'perl-image-exiftool: base curve script'
            'imagemagick: base curve and noise profile scripts'
            'ghostscript: noise profile script'
            'gnuplot: noise profile script')
makedepends=(git cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp)
conflicts=()
provides=(ansel)
install=ansel.install
options=(!emptydirs !libtool)
source=('git+https://github.com/aurelienpierreeng/ansel.git'
)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  git config submodule.src/tests/integration.update none
  git submodule update --init --recursive
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
  make -j`grep -c '^processor' /proc/cpuinfo` -C build

}

package() {
  cd $_gitname
  make -C build DESTDIR=$pkgdir install
  ln -s ansel/libansel.so "${pkgdir}"/usr/lib/libansel.so
}
