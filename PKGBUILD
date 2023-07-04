# Maintainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=canonical-multipass-git
_pkgname=multipass
pkgver=1.12.0.r226.g50ed575c
pkgrel=1
pkgdesc="Multipass orchestrates virtual Ubuntu instances"
arch=('x86_64')
url='https://multipass.run'
license=('GPL3')
depends=('qt5-x11extras'
         'apparmor'
         'hicolor-icon-theme'
         'libvirt')
makedepends=('cmake' 'git')
conflicts=('poco'
           'libssh')
source=("git+https://github.com/canonical/multipass.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  rm -rf build
  mkdir -p build
  cd build
  export CXXFLAGS='-Wno-error'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="${pkgdir}" install
}
