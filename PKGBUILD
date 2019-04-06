# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pytype
pkgver=2019.04.05
pkgrel=1
pkgdesc="Python type inferencer"
arch=('any')
url="https://google.github.io/pytype"
license=('APACHE')
provides=('pytype')
depends=(
  'ninja'
  'python>=3.3'
  'python-importlab>=0.5'
  'python-six'
  'python-typed-ast'
  'python-yaml>=3.11'
)
makedepends=(
  'python' 'python-setuptools' 'python-wheel'
  'make' 'gcc' 'cmake'
  'bison>=3.0.2' 'flex>=2.5.35'
  'fakeroot'
)
optdepends=(
  'python2: for target code of Python 2.7 support'
  'python36: for target code of Python 3.6 support'
)
options=(!emptydirs)
source=(
  "https://github.com/google/pytype/archive/${pkgver}.tar.gz"
  "cpython-9734024.zip::https://github.com/python/cpython/archive/9734024ec65311e33936faa83fb1cb249ef0de9d.zip"
  "googletest-e82d320.zip::https://github.com/google/googletest/archive/e82d320567a45db1a999f9109f2b9a733bc59bb1.zip"
  "typeshed-9b9ff64.zip::https://github.com/python/typeshed/archive/9b9ff64fc59f95e3595cfdfd821675d81ad56aa3.zip"
  'without-ninja-python-distributions.patch'
)
sha256sums=(
  '70d60cb3cabab9372640619d2256a93b2981902ebb8a3518a8fc918a2e1939dd'
  'ebc3b63747875586f17b967ad2dae6d2a404adb5814612200217f39074377f9a'
  '891d732c77eec9fb57727cd99990a25455d6d5859b1fde107a332c5e238cc9e7'
  '2f659586d17c30e4e5765bdade331de98b4b4a9151a55c5216f3f23355b05372'
  '3c6c812ffa7412634552ed32a71b326ac38387dd2d6c319fa9ae21a88dd55eaf'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../without-ninja-python-distributions.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf googletest/
  ln -s "${srcdir}/googletest-e82d320567a45db1a999f9109f2b9a733bc59bb1" googletest

  rm -rf cpython/
  ln -s "${srcdir}/cpython-9734024ec65311e33936faa83fb1cb249ef0de9d" cpython

  rm -rf typeshed/
  ln -s "${srcdir}/typeshed-9b9ff64fc59f95e3595cfdfd821675d81ad56aa3" typeshed

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 DESCRIPTION.rst "${pkgdir}/usr/share/doc/${pkgname}/DESCRIPTION.rst"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
