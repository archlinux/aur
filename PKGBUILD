# Maintainer: giver <giverc139@gmail.com>

_pyname=pyside6_qtads
pkgname="${_pyname//_/-}"
pkgver=4.5.0.4
pkgrel=1
pkgdesc='PySide6 bindings to Qt Advanced Docking System'
url='https://github.com/mborgerson/pyside6_qtads'
license=('LGPL-2.1-or-later')
arch=('any')
depends=(
  'pyside6'
  'python'
  'shiboken6'
)
makedepends=(
  'cmake'
  'gcc'
  'ninja'
  'python-build'
  'python-cmake-build-extension'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System/archive/4.5.0/Qt-Advanced-Docking-System-4.5.0.tar.gz"
        'fix-path-for-arch-build.patch')
sha512sums=('0533d833cb35d07cc7d97772384d2c8aceb27978cb325b31a17ac40202f0c1eb5cddb3568994d66edbf48794ac24cb08866c4ac1541a5297fde0da5cc362d220'
            'ae9345e0876a80e2f2dfa393d12176215cdcf17ed1985d2e46527d12a3abf4ea2b7796217871b562aaab9c7c876bef226de661d5e9cbdc862c8f49d57e9e8173'
            '511bd56201800113dfc94dacf70491799082b3aa2ce61d2e5a97b3f441055a6db5d81b5437b394cd2ace126addcb02b3f9f67d1fe1ae21b96b6fc3e2857e801d')
b2sums=('670589f5718d9bfffc249f5678fcf38a7a52f8f7fe39de6e4dd125a4ff919275a896ddb7cfb5772f6a659e4a5228900296c9c4222303a2ac6d9164ca6f270e09'
        'fdd691ab3cd6c541bae9f23bae35e327375d3571bb2d58d4943930e371986dabe9d5e0c78dd17bc180689c71f52410ddc53d643f5c99b446aa67850c271a61e6'
        'bc2b5504a6c48e0c00d37ad7bea7feb57b2c35adcd7a3cce26ebc6c8fe4adc063ba858df5b79cf27759e9979eab6805da718949c462e45b048b75eeffcd29218')

prepare() {
  cd "${_pyname}-${pkgver}"
  [[ -d 'Qt-Advanced-Docking-System' ]] && rmdir Qt-Advanced-Docking-System
  ln -snf "${srcdir}/Qt-Advanced-Docking-System-4.5.0" Qt-Advanced-Docking-System
  patch -p1 -i ../fix-path-for-arch-build.patch
}

build() {
  cd "${_pyname}-${pkgver}"
  PYSIDE6_QTADS_NO_HARD_PYSIDE_REQUIREMENT=1 python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local site_packages
  cd "${_pyname}-${pkgver}"
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="${PWD}/tmp_install${site_packages}" pytest -o addopts=''
  rm -rf tmp_install
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
