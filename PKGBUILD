pkgname=mujoco
pkgver=3.2.2
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libgl' 'glfw' 'tinyxml2' 'qhull')
makedepends=('abseil-cpp' 'benchmark' 'cmake' 'git' 'eigen' 'lodepng')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
    "${pkgname}.patch")
sha256sums=('507da24187cbaf126c5729c0af8afd804235f6ea671280cae0edab0bcd6c119e'
            '3a81ba031f9766e9f55040e404762b35580bb65718814b8e59b643703a6b0ff0')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Use as many system libs as possible.
  # Had to build and statically link some dependencies because the build was
  # failing. Feel free to investigate and fix the build to use shared libraries.
  # Patch to use system qhull comes from
  # https://github.com/conda-forge/staged-recipes/pull/19049
  patch -Np2 -i "${srcdir}/${pkgname}.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mv $pkgdir/usr/local/* $pkgdir/usr/
  rmdir $pkgdir/usr/local
  mkdir $pkgdir/usr/lib/mujoco
  mv $pkgdir/usr/bin/* $pkgdir/usr/lib/mujoco/
  mkdir $pkgdir/usr/lib/mujoco/plugins
  cp lib/libelasticity.so $pkgdir/usr/lib/mujoco/plugins/
  for _file in $pkgdir/usr/lib/mujoco/*; do
      ln -s /usr/lib/mujoco/$(basename $_file) $pkgdir/usr/bin/mujoco-$(basename $_file)
  done
}
