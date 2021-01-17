# Maintainer: Marco44 <cousinmarc at gmail dot com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika  <hanatos at gmail dot com>
# Contributor: Kevin Brubeck Unhammer <unhammer at member dot fsf dot org>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
pkgname=darktable-git
_gitname=darktable
pkgver=3.3.0.r1655.gecd7e2cbf
pkgrel=1
pkgdesc="A virtual lighttable and darkroom for photographers"
arch=('i686' 'x86_64')
url=http://www.darktable.org/
license=('GPL3')
depends=('exiv2>=0.18' 'intltool>=0.40' 'lcms2' 'lensfun>=0.2.3' 'libglade' 'dbus-glib'
	 'curl' 'libgnome-keyring' 'libgphoto2' 'libusb-compat' 'openexr' 'sqlite' 'libxslt'
	 'libsoup' 'osm-gps-map' 'pugixml' 'colord' 'lua52' 'libsecret' 'colord-gtk'
	 'sdl' 'openjpeg2' 'graphicsmagick' 'glu' )
makedepends=(git 'intltool>=0.40' 'cmake' 'librsvg' 'flickcurl' 'perl-pod-parser')
optdepends=('librsvg' 'flickcurl: flickr upload' 'libavif')
conflicts=(darktable)
provides=(darktable)
install=darktable.install
options=(!emptydirs !libtool)
source=('git://github.com/darktable-org/darktable.git'
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
#  git clean -dfx > /dev/null 2>&1
#  git reset --hard > /dev/null 2>&1
#  if you want a specific commit or branch... just put it here
#  git checkout 441a3b44df770578240c1774b29d373aa4a08bb8 > /dev/null 2>&1
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git config submodule.src/external/rawspeed.url "$srcdir/rawspeed.git"
  git config submodule.src/external/OpenCL.url "$srcdir/OpenCL-Headers.git"
  git config submodule.src/external/libxcf.url "$srcdir/libxcf.git"
  git config submodule.src/external/whereami.url "$srcdir/whereami"
  git config submodule.src/tests/integration.url "$srcdir/darktable-tests.git"
  git submodule update --init --remote --recursive
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  [[ ! -d build ]] && mkdir -p build
  cd build
    cmake \
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
        -DRAWSPEED_ENABLE_LTO=ON \
      ..
  make

  cd ../tools/basecurve
  cmake .
  make
}

package() {
  cd $srcdir/$_gitname/build
  make DESTDIR=$pkgdir install
  ln -s darktable/libdarktable.so "${pkgdir}"/usr/lib/libdarktable.so
  mv "${pkgdir}/usr/share/doc/darktable" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
}
