# Maintainer : Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Alex Combas <alex.combas@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=luxrays-hg
pkgver=3755+.ceb10f796325+
pkgrel=5
pkgdesc="Accelerate the ray intersection process by using GPUs"
arch=('x86_64')
url="http://www.luxrender.net/"
license=('GPL')
depends=('embree-bvh_build-git' 'opencl-icd-loader' 'libgl' 'openimageio')
makedepends=('boost' 'python' 'cmake' 'freetype2' 'gtk3' 'libpng' 'mesa' 'opencl-headers' 'glew' 'freeglut'
             'mercurial')
optdepends=('opencl-driver: OpenCL support' \
            'glew: demos (SmallLuxGPU etc.)' \
            'gtk3: luxcoreui' \
            'freeglut: demos (SmallLuxGPU etc.)' \
            'boost-libs: demos (SmallLuxGPU etc.)')
options=('staticlibs')
provides=('luxrays')
conflicts=('luxrays')
source=('luxrays::hg+https://bitbucket.org/luxrender/luxrays#branch=default' \
        'force_python3.diff'
        'serialize_undef_call.patch')
md5sums=('SKIP'
         'ba9a42dbe073009189c6d21845bff767'
         '44f46506e1bfd1bddbceaed40c87b056')

pkgver() {
  cd "$srcdir/luxrays"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/luxrays"

  # fix missing lpython link
  for file in `grep  Boost_LIBRARIES -l -R ` ;do sed -i 's/\${Boost_LIBRARIES}/\${Boost_LIBRARIES} \${PYTHON_LIBRARIES}/' $file; msg2 "Fix missing -lpython in $file" ; done
  # fix dependency cycle in linker
  sed -i 's/slg-core/slg-film slg-core/' CMakeLists.txt #tests/luxcoreimplserializationdemo/CMakeLists.txt
  # supress tests/luxcoreimplserializationdemo
  sed -i '/luxcoreimplserializationdemo/d' CMakeLists.txt
 
  # force python3 for boost
  patch -Np1 -i "$srcdir/force_python3.diff" || true

  # fix missing symbols in slg-core(tilerepository.o)
  patch -Np1 -i ${srcdir}/serialize_undef_call.patch
}

build() {
  mkdir -p build && cd build

 cmake ${srcdir}/luxrays \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DEMBREE_INCLUDE_PATH=/usr/include/embree-bvh_build \
    -DEMBREE_LIBRARY=/usr/lib/embree-bvh_build/libembree.so.2 \
    -DCMAKE_SKIP_RPATH=ON \
    -DLUXRAYS_DISABLE_OPENCL=OFF
  make
}

package() {
  cd "$srcdir/build"

  install -d -m755 "$pkgdir"/usr/{bin,include,lib}
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 lib/* "$pkgdir"/usr/lib
  cp -a ${srcdir}/luxrays/include "$pkgdir"/usr

  # install pyluxcore to the Python search path
  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  install -d -m755 "$pkgdir/$_pypath"
  mv "$pkgdir"/usr/lib/pyluxcore.so "$pkgdir/$_pypath"
}

# vim:set ts=2 sw=2 et:
