# Maintainer : Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=luxrender-hg
pkgver=4918+.f56582df55f4+
pkgrel=6
pkgdesc="Rendering system for physically correct, unbiased image synthesis"
arch=('x86_64')
url="http://www.luxrender.net/"
license=('GPL')
depends=('boost-libs' 'freeimage' 'openexr' 'openimageio' 'libpng' 'opencl-icd-loader' 'libgl' 'fftw'
         'embree-bvh_build-git')
optdepends=('luxblend25: Blender exporter' \
            'qt4: Qt GUI' \
            'python: pylux Python interface' \
            'opencl-driver: OpenCL support')
makedepends=('cmake' 'boost' 'mesa' 'qt4' "luxrays-hg" 'python' 'opencl-headers'
             'eos_portable_archive' 'mercurial')
provides=('luxrender')
conflicts=('luxrender')
source=('lux::hg+https://bitbucket.org/luxrender/lux#branch=default'
        'boost-15500.patch'
        'luxrender-gcc7.patch'
        'gcc-8.patch'
        'rpath.patch'
        'force_python3.diff')
md5sums=('SKIP'
         'b9e5c442093e69485752e6395c931b27'
         'fa680b0d621b42c8e7440056bf26ec1c'
         '6b71588b2c3e05c8f5ddbac824a39530'
         '53a4c379728906abb0d56ddf7152955e'
         '42692e65eabc5828693e2682e94b7c64')

pkgver() {
  cd "$srcdir/lux"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/lux"

  # force use of python 3 with boost_python
  patch -Np1 < "$srcdir/force_python3.diff"

  # patch for gcc 7 missing argument error
  patch -Np1 -i ${srcdir}/luxrender-gcc7.patch
  
  # remove reference to export_defs.h from liblux.cmake as it was removed from tree
  sed -i '/export_defs/d' cmake/liblux.cmake
  
  # fix deprecated function in boost,asio,basic_stream_socket::native() replace with native_handle()
  patch -Np1 -i ${srcdir}/boost-15500.patch

  # fix unambiguous 'distance' function in boost/gcc8-stl
  patch -Np1 -i ${srcdir}/gcc-8.patch
  
  # fix unambiguous 'PyContext' both in python3.7 and lux::
  sed -i 's/\&PyContext/\&lux::PyContext/g' python/pycontext.h
  sed -i 's/class_<PyContext/class_<lux::PyContext/' python/pycontext.h

  # fix embree2.so(embree-bvh_build-git) rpath
  patch -Np1 -i ${srcdir}/rpath.patch
}

build() {
  cd "$srcdir/lux"
  mkdir -p build
  cd build

  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLUX_DOCUMENTATION=OFF \
    -DLUXRAYS_DISABLE_OPENCL=OFF \
    -DPYTHON_CUSTOM=ON \
    -DPYTHON_LIBRARIES=/usr/lib/libpython${_pyver}m.so \
    -DPYTHON_INCLUDE_PATH=/usr/include/python${_pyver}m/ \
    -DEMBREE_INCLUDE_PATH=/usr/include/embree-bvh_build \
    -DEMBREE_LIBRARY=/usr/lib/embree-bvh_build/libembree.so.2 \
    -DCMAKE_EXE_LINKER_FLAGS=-lpthread
  make
}

package() {
  cd "$srcdir/lux/build"
  make DESTDIR="$pkgdir" install

  # fix library path on x86_64
  [ "$CARCH" = "x86_64" ] && mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib

  # install pylux
  install -D -m644 pylux.so "$pkgdir"/usr/lib/python${_pyver}/pylux.so
}

# vim:set ts=2 sw=2 et:
