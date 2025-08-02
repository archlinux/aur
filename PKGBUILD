# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-git
pkgver=5.12.0.r69.gf3d839f4d
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation - Git version"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxwidgets-gtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk-4.1' 'wxsvg' 'rapidjson' 'sqlite')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'git' 'lsb-release')
conflicts=('opencpn')
provides=('opencpn')

url="http://opencpn.org"
source=("$pkgname::git+https://github.com/OpenCPN/OpenCPN.git")
sha1sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^Release.//;s/\_/\./;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOCPN_BUILD_TEST=OFF -DOCPN_VERBOSE=OFF -DOCPN_USE_EXTERN_CURL=ON ..
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"
  rm -rf usr/include/
  rm -rf usr/lib/pkgconfig/
  rm -rf usr/share/shapelib/
  rm usr/lib/libshp.a
}
