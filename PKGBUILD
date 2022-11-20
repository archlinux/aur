# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkg=arrow
pkgname=python38-pyarrow
pkgver=9.0.0
pkgrel=1
pkgdesc="Columnar in-memory analytics layer for big data — Python module."
arch=(x86_64)
url="https://arrow.apache.org"
license=(Apache)
depends=(arrow python38-numpy)
makedepends=(git cmake cython python38-setuptools python38-setuptools-scm)
optdepends=(python38-fsspec)
checkdepends=(python38-brotli python38-cffi python38-hypothesis python38-pandas python38-pytest python38-pytest-lazy-fixture python38-pytz)
source=(https://archive.apache.org/dist/${_pkg}/${_pkg}-${pkgver}/apache-${_pkg}-${pkgver}.tar.gz{,.asc}
        git+https://github.com/apache/arrow-testing.git
        tensorflow-abi.patch)
sha256sums=('a9a033f0a3490289998f458680d19579cf07911717ba65afde6cb80070f7a9b5'
            'SKIP'
            'SKIP'
            'd20e9cef6b18d3801a1ac1db50808631bec8097be58c194d6b036a5773e14958')
validpgpkeys=(265F80AB84FE03127E14F01125BCCA5220D84079  # Krisztian Szucs (apache) <szucs.krisztian@gmail.com>
              08D3564B7C6A9CAFBFF6A66791D18FCF079F8007) # Kouhei Sutou <kou@cozmixng.org>


prepare(){
  cd apache-${_pkg}-${pkgver}
  patch -p1 < ../tensorflow-abi.patch
}

build(){
  cd apache-${_pkg}-${pkgver}/python
  ARROW_HOME=/usr \
  PARQUET_HOME=/usr \
  PYARROW_BUNDLE_ARROW_CPP_HEADERS=0 \
  PYARROW_BUNDLE_PLASMA_EXECUTABLE=0 \
  PYARROW_WITH_HDFS=1 \
  PYARROW_WITH_FLIGHT=1 \
  PYARROW_WITH_DATASET=1 \
  PYARROW_WITH_PARQUET=1 \
  PYARROW_WITH_PLASMA=1 \
  PYARROW_WITH_TENSORFLOW=1 \
  PYARROW_WITH_ORC=1 \
  python3.8 setup.py build_ext --inplace
}

check(){
  cd apache-${_pkg}-${pkgver}/python
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  ARROW_TEST_DATA="${srcdir}"/arrow-testing/data \
  ARROW_HOME=/usr \
  PARQUET_HOME=/usr \
  pytest -vv --color=yes pyarrow/tests \
    --deselect=pyarrow/tests/test_memory.py::test_env_var \
    --deselect=pyarrow/tests/test_misc.py::test_get_include
}

package(){
  cd apache-${_pkg}-${pkgver}/python
  ARROW_HOME=/usr \
  PARQUET_HOME=/usr \
  PYARROW_BUNDLE_ARROW_CPP_HEADERS=0 \
  PYARROW_BUNDLE_PLASMA_EXECUTABLE=0 \
  PYARROW_WITH_HDFS=1 \
  PYARROW_WITH_FLIGHT=1 \
  PYARROW_WITH_DATASET=1 \
  PYARROW_WITH_PARQUET=1 \
  PYARROW_WITH_PLASMA=1 \
  PYARROW_WITH_TENSORFLOW=1 \
  PYARROW_WITH_ORC=1 \
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
