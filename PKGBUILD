# Contributor: Darko82 <darko 82 (hat) gmail dotcom>
# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=photoflow-git
pkgver=r1420.0589759
pkgrel=1
pkgdesc="Non-destructive, layer-based photo retouching including RAW image development"
arch=('i686' 'x86_64')
url="http://aferrero2707.github.io/PhotoFlow"
license=('GPL3')
depends=('libgexiv2' 'vips' 'gtkmm' 'pugixml' 'libjpeg-turbo' 'desktop-file-utils')
makedepends=('git' 'gobject-introspection' 'cmake')
provides=('photoflow')
conflicts=('photoflow')

source=("${pkgname%-*}"::"git://github.com/aferrero2707/PhotoFlow.git#branch=stable")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname%-*}
	sed -i "s/am__api_version='1.14'/am__api_version='1.15'/" src/external/gexiv2/configure
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_PREFIX=/usr -DBUNDLED_GEXIV2=OFF
	make
}

package() {
    cd "${srcdir}/${pkgname%-*}"
    make DESTDIR="$pkgdir/" install
}
