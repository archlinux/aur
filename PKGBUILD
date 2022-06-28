# Maintainer: Christoph Haag <christoph.haag@collabora.com>

pkgname="monado-vulkan-layers-git"
_dirname="vulkan-layers"
pkgver=0.9.0.9.git.cb3f7fe
pkgrel=1
pkgdesc='Optional Vulkan Layers for Monado.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/monado/utilities/vulkan-layers'
depends=('gcc-libs')
makedepends=('vulkan-headers' 'cmake')
optdepends=()
provides=("monado-vulkan-layers")

license=('boost')
source=("$_dirname::git+https://gitlab.freedesktop.org/monado/utilities/vulkan-layers.git#branch=main")
md5sums=('SKIP')

#options=('debug' '!strip')

pkgver() {
  cd "$_dirname"
  # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  sh get-version.sh
}

prepare() {
  cd "$_dirname"
}

build() {
  cd "$_dirname"
  cmake \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -GNinja -B"$srcdir"/"$_dirname"-build
  ninja -C "$srcdir"/"$_dirname"-build
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install
}
