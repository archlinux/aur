# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Alex Combas <alex.combas@gmail.com>
pkgname=luxrays-hg
pkgver=3677+.a68fdb616d0a+
pkgrel=1
pkgdesc="Accelerate the ray intersection process by using GPUs"
arch=('x86_64')
url="http://www.luxrender.net/"
license=('GPL')
depends=('embree-bvh_build-git' 'libcl' 'libgl' 'openimageio')
makedepends=('boost' 'cmake' 'freetype2' 'gtk3' 'libpng' 'mesa' 'opencl-headers' 'glew' 'freeglut'
             'mercurial')
optdepends=('opencl-nvidia: OpenCL support for nVidia GPUs' \
            'amdapp-sdk: OpenCL support for AMD GPUs' \
            'intel-opencl-runtime: OpenCL support for Intel CPUs' \
            'glew: demos (SmallLuxGPU etc.)' \
            'gtk3: luxcoreui'
            'freeglut: demos (SmallLuxGPU etc.)' \
            'boost-libs: demos (SmallLuxGPU etc.)')
options=('staticlibs')
provides=('luxrays')
conflicts=('luxrays')
source=('luxrays::hg+https://bitbucket.org/luxrender/luxrays#branch=default' \
        force_python3.diff)
md5sums=('SKIP'
         '36c9823246c2b575415c1709e065727c')

pkgver() {
  cd "$srcdir/luxrays"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/luxrays"

  # force python3 for boost
  patch -Np1 < "$srcdir/force_python3.diff" || true
}

build() {
  cd "$srcdir/luxrays"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLUXRAYS_DISABLE_OPENCL=OFF
  # this sucks, but luxrays doesn't seem to honor  CMAKE_*_LINKER_FLAGS
  # thanks bartus from AUR for the fix
  for file in `grep lboost_python -l -R ` ;do sed -i 's/$/ -lpython3/' $file ; done
  make
}

package() {
  cd "$srcdir/luxrays"

  install -d -m755 "$pkgdir"/usr/{bin,include,lib}
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 lib/* "$pkgdir"/usr/lib
  cp -a include "$pkgdir"/usr

  # install pyluxcore to the Python search path
  install -d -m755 "$pkgdir"/usr/lib/python3.5/
  mv "$pkgdir"/usr/lib/pyluxcore.so "$pkgdir"/usr/lib/python3.5/
}

# vim:set ts=2 sw=2 et:
