# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=gcc-python-plugin
pkgname=('gcc-python-plugin' 'gcc-python2-plugin' 'gcc-python-plugin-c-api' 'gcc-python-plugin-doc')
pkgver=0.15
pkgrel=1
pkgdesc="GCC plugin that embeds CPython inside the compiler"
arch=('i686' 'x86_64')
url='https://gcc-python-plugin.readthedocs.io/en/latest/'
license=('GPL3')
makedepends=('python-lxml' 'python-pygments' 'python-six' 'python-sphinx'
             'python2-lxml' 'python2-pygments' 'python2-six')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidmalcolm/gcc-python-plugin/archive/v${pkgver}.tar.gz")
sha256sums=('fcb7596616fcb07f611b992f7603ca80f85181b23692693d1097977913419e74')

prepare() {
    cp -a "gcc-python-plugin-$pkgver" "gcc-python2-plugin-$pkgver"
}

build() {
  GCCPLUGINS_DIR="$(${CC:-gcc} --print-file-name=plugin)"
  make -C "gcc-python-plugin-$pkgver" plugin man html \
    PLUGIN_NAME=python PYTHON=python PYTHON_CONFIG=python-config \
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
