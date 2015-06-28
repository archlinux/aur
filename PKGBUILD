# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Alex Combas <alex.combas@gmail.com>
pkgname=luxrays-hg
pkgver=2448.3cf5d87f54f4
pkgrel=1
pkgdesc="Accelerate the ray intersection process by using GPUs"
arch=('i686' 'x86_64')
url="http://www.luxrender.net/"
license=('GPL')
depends=('freetype2' 'libcl' 'libgl' 'libpng' 'openimageio' 'embree')
makedepends=('mercurial' 'cmake' 'boost' 'mesa' 'opencl-headers' 'glew' 'freeglut')
optdepends=('opencl-nvidia: OpenCL support for nVidia GPUs' \
            'amdapp-sdk: OpenCL support for AMD GPUs' \
            'intel-opencl-runtime: OpenCL support for Intel CPUs' \
            'glew: demos (SmallLuxGPU etc.)' \
            'freeglut: demos (SmallLuxGPU etc.)' \
            'boost-libs: demos (SmallLuxGPU etc.)')
options=('staticlibs')
provides=('luxrays')
conflicts=('luxrays')
source=('luxrays::hg+https://bitbucket.org/luxrender/luxrays' \
        force_python3.diff)
md5sums=('SKIP'
         '3bfb5594a709d1ea772866d66904b8fd')

pkgver() {
  cd "$srcdir/luxrays"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/luxrays"

  patch -Np1 < "$srcdir/force_python3.diff" || true
}

build() {
  cd "$srcdir/luxrays"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLUXRAYS_DISABLE_OPENCL=OFF \
    .
  make
}

package() {
  cd "$srcdir/luxrays"

  install -d -m755 "$pkgdir"/usr/{bin,include,lib}
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 lib/* "$pkgdir"/usr/lib
  cp -a include "$pkgdir"/usr

  # install pyluxcore to the Python search path
  install -d -m755 "$pkgdir"/usr/lib/python3.4/
  mv "$pkgdir"/usr/lib/pyluxcore.so "$pkgdir"/usr/lib/python3.4/
}

# vim:set ts=2 sw=2 et:
