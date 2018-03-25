# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Alex Combas <alex.combas@gmail.com>
# Comaintainer: bartus <aur@bartus.33mail.com>
_pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
pkgname=luxrays-hg
pkgver=3755+.ceb10f796325+
pkgrel=2
pkgdesc="Accelerate the ray intersection process by using GPUs"
arch=('x86_64')
url="http://www.luxrender.net/"
license=('GPL')
depends=('embree-bvh_build-git' 'opencl-icd-loader' 'libgl' 'openimageio')
makedepends=('boost' 'cmake' 'freetype2' 'gtk3' 'libpng' 'mesa' 'opencl-headers' 'glew' 'freeglut'
             'mercurial')
optdepends=('opencl-driver: OpenCL support' \
            'glew: demos (SmallLuxGPU etc.)' \
            'gtk3: luxcoreui' \
            'freeglut: demos (SmallLuxGPU etc.)' \
            'boost-libs: demos (SmallLuxGPU etc.)')
options=('staticlibs')
provides=('luxrays')
conflicts=('luxrays')
source=('luxrays::hg+https://bitbucket.org/luxrender/luxrays#branch=default'
        force_python3.diff
        embree2-bvh.patch
)
md5sums=('SKIP'
         'ba9a42dbe073009189c6d21845bff767'
         'e6be00520ee90bdd24d1d7d0b31f3429')

pkgver() {
  cd "$srcdir/luxrays"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/luxrays"

  # force python3 for boost
  patch -Np1 < "$srcdir/force_python3.diff" || true
  patch -Np1 -i ../embree2-bvh.patch
}

build() {
  cd "$srcdir/luxrays"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLUXRAYS_DISABLE_OPENCL=OFF
  #  -DEMBREE_INCLUDE_PATH=/usr/include/embree-bvh_build \
  #  -DEMBREE_LIBRARY=/usr/lib/embree-bvh_build/libembree.a
  # this sucks, but luxrays doesn't seem to honor  CMAKE_*_LINKER_FLAGS
  # thanks bartus from AUR for the fix
  for file in `grep lboost_python -l -R ` ;do sed -i 's/$/ -lpython3/' $file ; done
  make
}

package() {
  cd "$srcdir/luxrays/build"

  install -d -m755 "$pkgdir"/usr/{bin,include,lib}
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 lib/* "$pkgdir"/usr/lib
  cp -a ../include "$pkgdir"/usr

  # install pyluxcore to the Python search path
  install -d -m755 "$pkgdir"/usr/lib/python${_pyver}/
  mv "$pkgdir"/usr/lib/pyluxcore.so "$pkgdir"/usr/lib/python${_pyver}/
}

# vim:set ts=2 sw=2 et:
