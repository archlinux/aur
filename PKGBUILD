# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Florian Pritz <bluewind at xinu dot at>
# Contributor: Jelle van der Waa <jelle@ at vdwaa dot nl>
# Contributor: Hugo Osvaldo Barrera <hugo at barrera dot io>
# Contributor: Matthias Maennich <arch at maennich dot net>

pkgbase=shiboken
pkgname=(python{2,}-shiboken shiboken)
pkgver=1.2.4
pkgrel=7
arch=('x86_64')
license=('LGPL')
url="http://www.pyside.org"
makedepends=('cmake' 'python2' 'python' 'qt4' 'libxslt')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/PySide/Shiboken/archive/$pkgver.tar.gz"
        support-new-python.diff)
md5sums=('c284197d06ad25d78009ff55f18dd512'
         '19d5032866f4e232f442fe19f12b94de')

prepare(){
    cd "$srcdir/Shiboken-$pkgver"
    patch -p1 -i "$srcdir/support-new-python.diff"
}

build(){
    cd "$srcdir/Shiboken-$pkgver"
    # build python2
    mkdir -p build-py2 && cd build-py2
    _ver2=$(python2 -c "import platform; print(platform.python_version())")
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr  \
              -DBUILD_TESTS=OFF            \
              -DPYTHON_EXECUTABLE=/usr/bin/python2 \
              -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make

    # build python3
    cd "$srcdir/Shiboken-$pkgver"
    mkdir -p build-py3 && cd build-py3

    _ver3=$(python -c "import platform; print(platform.python_version())")
    declare -a _extra_library_opt
    declare -a _extra_include_opt
    if [[ ${_ver3//./} -lt 380 ]]; then
        _includedir=/usr/include/python${_ver3%.*}m
        _library=/usr/lib/libpython${_ver3%.*}m.so
        _extra_library_opt+=("-DPYTHON3_LIBRARIES=${_library}")
        _extra_include_opt+=("-DPYTHON3_INCLUDE_DIRS=${_includedir}")
    else
        _includedir=/usr/include/python${_ver3%.*}
        _library=/usr/lib/libpython${_ver3%.*}.so
        _extra_library_opt+=("-DPYTHON3_LIBRARY=${_library}")
        _extra_include_opt+=("-DPYTHON3_INCLUDE_DIR=${_includedir}")
    fi

    cmake     -DCMAKE_INSTALL_PREFIX=/usr  \
              -DBUILD_TESTS=OFF            \
              -DUSE_PYTHON3=yes            \
              "${_extra_library_opt[@]}"   \
              "${_extra_include_opt[@]}"   \
              -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
              ..
    make
}

package_shiboken() {
  pkgdesc="CPython bindings generator for C++ libraries"
  depends=(python qt4 libxslt)
  optdepends=("python2-shiboken: for compilation against python2"
              "python-shiboken: for compilation against python")

  # Header files, /usr/bin/shiboken, pkgconfig, man page
  cd "$srcdir/Shiboken-$pkgver/build-py3"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/Shiboken-$pkgver/build-py2"
  cd data
  install -Dm 644 ShibokenConfig-python2.7.cmake "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/"
  install -Dm 644 shiboken.pc "$pkgdir/usr/lib/pkgconfig/shiboken-py2.pc"

  rm -rf "$pkgdir/usr/lib/python"*
  rm -rf "$pkgdir/usr/lib/libshiboken"*
  rm -rf "$pkgdir/usr/lib/pkgconfig/"
  rm "$pkgdir"/usr/lib/cmake/Shiboken-$pkgver/ShibokenConfig*python*.cmake
}
package_python2-shiboken() {
  pkgdesc="Support library for Python2 bindings"
  depends=("qt4>=4.8" "libxslt" "python2" "shiboken")

  cd "$srcdir/Shiboken-$pkgver/build-py2"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/Shiboken-$pkgver/build-py2"
  cd data
  install -Dm 644 ShibokenConfig-python2.7.cmake "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/"
  mv "$pkgdir"/usr/lib/pkgconfig/shiboken{,-py2}.pc

  rm -rf "$pkgdir"/usr/{include,bin,share}
  rm "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/ShibokenConfigVersion.cmake"
  rm "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/ShibokenConfig.cmake"
}

package_python-shiboken() {
  pkgdesc="Support library for Python bindings"
  depends=("qt4>=4.8" "libxslt" "python" "shiboken")

  cd "$srcdir/Shiboken-$pkgver/build-py3"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{include,bin,share}
  rm "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/ShibokenConfigVersion.cmake"
  rm "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/ShibokenConfig.cmake"
}
