# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
pkgname="monado-git"
_dirname="monado"
pkgver=21.0.0.r1135.ga6b4e6a8
pkgrel=1
pkgdesc='The open source OpenXR runtime.'
arch=('i686' 'x86_64')
url='https://monado.dev'
depends=('openxr' 'openhmd' 'vulkan-icd-loader' 'libgl' 'wayland' 'xr-hardware' 'libcap' 'libbsd')
makedepends=('eigen' 'ninja' 'shaderc' 'meson' 'git' 'vulkan-headers')
optdepends=('libuvc: optical tracking support'
            'opencv: optical tracking support'
            'libsurvive-git: lighthouse positional tracking support')
provides=("openxr-runtime")
install=monado.install

#'doxygen' #When building docs
makedepend=('cmake' 'eigen' 'git')

license=('boost')
source=("$_dirname::git+https://gitlab.freedesktop.org/monado/monado.git#branch=main")
md5sums=('SKIP')

#options=('debug' '!strip')

pkgver() {
  cd "$_dirname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_dirname"
}

build() {
  cd "$_dirname"
  meson --prefix=/usr/ --libdir=lib -Dbuildtype=debugoptimized "$srcdir"/"$_dirname"-build
  ninja -C "$srcdir"/"$_dirname"-build
}

package() {
  cd "$_dirname"-build
  DESTDIR="$pkgdir" ninja install
}
