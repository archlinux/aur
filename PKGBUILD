# Maintainer: Martin Peres < martin DOT peres AT free DOT fr>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=envytools-git
pkgver=0.r4044.3b4bd3e
pkgrel=1
epoch=1
pkgdesc="A tool for nouveau debugging"
arch=('i686' 'x86_64')
url='https://github.com/envytools/envytools'
license=('GPL')
makedepends=('git' 'cmake' 'cython')
options=('staticlibs')
depends=('python' 'libpciaccess' 'libxml2' 'libvdpau')
source=("${pkgname}::git+https://github.com/envytools/envytools.git")
sha256sums=('SKIP')

prepare() {
  msg "Cleaning the previous build directory..."
  rm -rf build
  mkdir build
}

pkgver() {
  cd ${pkgname}
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd build
  nvapy_install_path=`python -c "import site; print(site.getsitepackages()[0])"`
  msg "Will install the nvapy lib in ${nvapy_install_path}"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DNVAPY_PATH=${nvapy_install_path} \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    ../${pkgname}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
