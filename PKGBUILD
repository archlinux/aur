# PKGBUILD for HOOMD-blue. This pulls from git, but uses the "maint" version.
# Maintainer: Asmund Ervik <aaervik@gmail.com>
pkgname=hoomd-blue
pkgver=v1.0.2.r0.g6413a77
pkgrel=1
pkgdesc="A general-purpose particle simulation toolkit using GPUs with CUDA"
arch=('any')
url="http://codeblue.umich.edu/hoomd-blue/index.html"
license=('custom: University of Michigan "MIT-Like"')
depends=(python boost cuda cmake openmpi)
makedepends=(git)
optdepends=('nvidia: running simulations on GPU')
provides=(hoomd-blue)
source=(hoomd-blue::git+https://bitbucket.org/glotzer/hoomd-blue#branch=maint)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build && cd build
  cmake -Wno-dev ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_CUDA=On -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda
}

package() {
  # Install the license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Install the software
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install -j8

	# Patch some lines that reference the source build directory
  sed -i 's/HOOMD_SOURCE_DIR.*/HOOMD_SOURCE_DIR "\/usr\/include\/hoomd"/' "$pkgdir/usr/include/hoomd/HOOMDVersion.h"
  sed -i 's/HOOMD_BINARY_DIR.*/HOOMD_BINARY_DIR "\/usr\/bin"/' "$pkgdir/usr/include/hoomd/HOOMDVersion.h"

  # Uncomment this if you want to test the install (takes quite a long time):
	#make check -j8
}
