# Contributor: Darko82 <darko 82 (hat) gmail dotcom>
# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=photoflow-git
pkgver=r2808.a0d2421d
pkgrel=1
pkgdesc="Non-destructive, layer-based photo retouching including RAW image development"
arch=('i686' 'x86_64')
url="http://aferrero2707.github.io/PhotoFlow"
license=('GPL3')
depends=('exiv2' 'libvips' 'gtkmm' 'pugixml' 'libjpeg-turbo')
makedepends=('git' 'gobject-introspection' 'cmake')
provides=('photoflow')
conflicts=('photoflow')

source=("${pkgname%-*}"::"git://github.com/aferrero2707/PhotoFlow.git#branch=stable")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname%-*}
    sed -i 's/-Wno-deprecated-declarations/-Wno-deprecated-declarations -Wno-stringop-overflow/' src/CMakeLists.txt
    sed -i 's/-Wno-deprecated-register //' src/CMakeLists.txt
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_PREFIX=/usr -DBUNDLED_GEXIV2=OFF ..
    make
}

package() {
    cd "${srcdir}/${pkgname%-*}/build"
    make DESTDIR="$pkgdir/" install
}
