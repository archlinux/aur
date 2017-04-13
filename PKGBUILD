# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=('anbox-git' 'anbox-modules-dkms-git')
_pkgname=anbox
pkgver=466
pkgrel=1
arch=('x86_64')
url="http://anbox.io/"
license=('GPL3')
makedepends=('cmake' 'git' 'glm' 'dbus-cpp' 'lxc' 'sdl2' 'protobuf')
source=("git+https://github.com/anbox/anbox.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Don't build tests
  truncate -s 0 tests/CMakeLists.txt
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"

  cmake .. -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package_anbox-git() {
  depends=('dbus-cpp' 'lxc' 'sdl2' 'protobuf')
  optdepends=('anbox-modules-dkms-git: Required Android kernel modules')
  pkgdesc="Running Android in a container"

  cd "$srcdir/${_pkgname}"
  make -C build DESTDIR="$pkgdir/" install
}

package_anbox-modules-dkms-git() {
  pkgdesc="Required kernel module sources for Android"
  depends=('dkms')

  cd "$srcdir/${_pkgname}"
  modules=(ashmem binder)
  for mod in "${modules[@]}"; do
    cp -a kernel/$mod $pkgdir/usr/src/anbox-modules-$mod-$pkgver
  done;
}
