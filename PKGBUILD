# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgbase='apache-arrow'
pkgname=('apache-arrow' 'python-apache-arrow')
pkgver=5.0.0
pkgrel=1
pkgdesc="Language-independent columnar memory format for flat and hierarchical data"
arch=('x86_64')
url='https://arrow.apache.org/'
license=('Apache')
depends=(
# General
    'boost-libs'
    'jemalloc'
    'libutf8proc'
# Data Serialisation
    'thrift'
    'rapidjson'
# Compression Codecs
    'brotli'
    'bzip2'
    'lz4'
    'snappy'
    'zlib'
    'zstd'
)
makedepends=(
    'boost'
    'cython'
    'gcc'
    'gcc-libs'
    'ninja'
    'python-numpy'
    'python-setuptools-scm'
)
provides=('apache-arrow' 'apache-parquet')
source=("https://github.com/apache/arrow/archive/$pkgbase-$pkgver.tar.gz")
md5sums=('9caf5dbd36ef4972c3a591bcfeaf59c8')

build(){
    ARROW_HOME="$srcdir/arrow-$pkgbase-$pkgver/dist"
    LD_LIBRARY_PATH="$ARROW_HOME/lib:$LD_LIBRARY_PATH"

    cd "$srcdir/arrow-$pkgbase-$pkgver"
    mkdir -p cpp/build
    pushd cpp/build

    # Setting -DARROW_PATHON=ON implies
    # -DARROW_{COMPUTE,CSV,DATASET,FILESYSTEM,HDFS,JSON}=ON.
    cmake -DCMAKE_INSTALL_PREFIX=$ARROW_HOME \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_BUILD_TYPE=Release \
          -DARROW_SIMD_LEVEL=AVX2 \
          -DARROW_BUILD_STATIC=OFF \
          -DARROW_DEPENDENCY_SOURCE=SYSTEM \
          -DARROW_BUILD_UTILITIES=ON \
          -DARROW_COMPUTE=ON \
          -DARROW_CSV=ON \
          -DARROW_CUDA=OFF \
          -DARROW_DATASET=ON \
          -DARROW_FILESYSTEM=ON \
          -DARROW_FLIGHT=OFF \
          -DARROW_GANDIVA=OFF \
          -DARROW_GANDIVA_JAVA=OFF \
          -DARROW_HDFS=OFF \
          -DARROW_HIVESERVER2=OFF \
          -DARROW_IPC=ON \
          -DARROW_JSON=ON \
          -DARROW_ORC=OFF \
          -DARROW_PARQUET=ON \
          -DARROW_PLASMA=OFF \
          -DARROW_PLASMA_JAVA_CLIENT=OFF \
          -DARROW_PYTHON=ON \
          -DARROW_S3=OFF \
          -DARROW_WITH_BZ2=ON \
          -DARROW_WITH_ZLIB=ON \
          -DARROW_WITH_LZ4=ON \
          -DARROW_WITH_SNAPPY=ON \
          -DARROW_WITH_ZSTD=ON \
          -DARROW_WITH_BROTLI=ON \
          -DPython3_EXECUTABLE=/usr/bin/python3 \
          -G Ninja \
          ..
    ninja
    ninja install

    cd "$srcdir/arrow-$pkgbase-$pkgver"
    pushd python
    python setup.py build_ext --with-parquet bdist_wheel
}

package_apache-arrow(){
    cd "$srcdir/arrow-$pkgbase-$pkgver/cpp/build"
    mkdir -p "$pkgdir"
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
    ninja install
    find "${pkgdir}/usr/lib/" -name "*testing*" -delete
}

package_python-apache-arrow() {
    cd "$srcdir/arrow-$pkgbase-$pkgver/python"
    pip install --prefix "$pkgdir/usr" dist/*.whl
}
