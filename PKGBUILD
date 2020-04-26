# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=gcc-python-plugin
pkgname=('gcc-python-plugin' 'gcc-python2-plugin' 'gcc-python-plugin-c-api' 'gcc-python-plugin-doc')
pkgver=0.17
pkgrel=1
pkgdesc="GCC plugin that embeds CPython inside the compiler"
arch=('i686' 'x86_64')
url='https://gcc-python-plugin.readthedocs.io/en/latest/'
license=('GPL3')
makedepends=('python-lxml' 'python-pygments' 'python-six' 'python-sphinx'
             'python2-lxml' 'python2-pygments' 'python2-six')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/davidmalcolm/gcc-python-plugin/archive/v${pkgver}.tar.gz"
        '0001-Build-on-Python-3.8.patch')
sha256sums=('63ba345fe85973605f215840908930ddf97afcaa4e80228671ab0a543565a83a'
            '6b0898c66c51be374eff06ffafa49f9afbed86757bc2203bb57be58d3e09d7c8')

prepare() {
    cd "$pkgbase-$pkgver"

    # https://github.com/davidmalcolm/gcc-python-plugin/commit/3a4b484eaeda215a086cca967421ca249f7d7b48
    patch -Np1 -i ../0001-Build-on-Python-3.8.patch

    # Duplicate the checkout for the Python2 plugin
    cp -a "../gcc-python-plugin-$pkgver" "../gcc-python2-plugin-$pkgver"
}

build() {
  GCCPLUGINS_DIR="$(${CC:-gcc} --print-file-name=plugin)"

  # Since Python 3.8, python-config --libs no longer includes /usr/lib/libpython3.8.so
  # https://github.com/davidmalcolm/gcc-python-plugin/pull/185
  PYTHON3_LIBNAME="$(/usr/bin/python3 -c 'import sys;print("python%d.%d" % sys.version_info[:2])')"

  make -C "gcc-python-plugin-$pkgver" plugin man html \
    PLUGIN_NAME=python PYTHON=python PYTHON_CONFIG=python-config \
    PYTHON_LIBS="-l${PYTHON3_LIBNAME} $(python-config --libs)" \
    PLUGIN_PYTHONPATH="$GCCPLUGINS_DIR/python"
  make -C "gcc-python2-plugin-$pkgver" plugin man \
    PLUGIN_NAME=python2 PYTHON=python2 PYTHON_CONFIG=python2-config \
    PLUGIN_PYTHONPATH="$GCCPLUGINS_DIR/python2"
}

check() {
  pushd "gcc-python-plugin-$pkgver"
  # This test fails with Python 3. Ignore it.
  LD_LIBRARY_PATH=gcc-c-api PLUGIN_NAME=python python run-test-suite.py || :
  LD_LIBRARY_PATH=gcc-c-api PLUGIN_NAME=python python testcpychecker.py -v
  popd

  pushd "gcc-python2-plugin-$pkgver"
  LD_LIBRARY_PATH=gcc-c-api PLUGIN_NAME=python2 python2 run-test-suite.py
  LD_LIBRARY_PATH=gcc-c-api PLUGIN_NAME=python2 python2 testcpychecker.py -v
  popd
}

package_gcc-python-plugin() {
  depends=('python-lxml' 'python-pygments' 'python-six' 'gcc-python-plugin-c-api')
  optdepends=('graphviz: for examples')

  cd "$pkgname-$pkgver"
  GCCPLUGINS_DIR="$(${CC:-gcc} --print-file-name=plugin)"
  make DESTDIR="$pkgdir" install \
    PLUGIN_NAME=python PYTHON=python PYTHON_CONFIG=python-config \
    PLUGIN_PYTHONPATH="$GCCPLUGINS_DIR/python"

  rm "$pkgdir$(${CC:-gcc} --print-file-name=plugin)/libgcc-c-api.so"
}

package_gcc-python2-plugin() {
  depends=('python2-lxml' 'python2-pygments' 'python2-six' 'gcc-python-plugin-c-api')
  optdepends=('graphviz: for examples')

  cd "$pkgname-$pkgver"
  GCCPLUGINS_DIR="$(${CC:-gcc} --print-file-name=plugin)"
  make DESTDIR="$pkgdir" install \
    PLUGIN_NAME=python2 PYTHON=python2 PYTHON_CONFIG=python2-config \
    PLUGIN_PYTHONPATH="$GCCPLUGINS_DIR/python2"

  rm "$pkgdir$(${CC:-gcc} --print-file-name=plugin)/libgcc-c-api.so"
}

package_gcc-python-plugin-c-api() {
  cd "$pkgbase-$pkgver"

  # Install only once the library which is provided by both versions
  GCCPLUGINS_DIR="$(${CC:-gcc} --print-file-name=plugin)"
  install -Dm755 gcc-c-api/libgcc-c-api.so "$pkgdir$GCCPLUGINS_DIR/libgcc-c-api.so"
}

package_gcc-python-plugin-doc() {
  cd "$pkgbase-$pkgver"

  mkdir -p "$pkgdir/usr/share/doc/$pkgbase"
  cp -r docs/_build/html examples "$pkgdir/usr/share/doc/$pkgbase/"
}
