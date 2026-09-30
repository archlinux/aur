# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=2.4.7
pkgrel=1
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD-2-Clause')
depends=(
  'python'
  'python-edalize'
  'python-pyparsing'
  'python-yaml'
  'python-simplesat'
  'python-fastjsonschema'
  'python-argcomplete'
  'python-pydantic'
  'python-okonomiyaki'
  'python-pydantic-core'
  'python-typing_extensions'
)
makedepends=(
  'python-setuptools-scm'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-pytest'
  'git'
)
optdepends=(
  'python-nanoid: needed by filter spdxgen'
  'iverilog: run simulation/testbenchs'
  'svn: opencores provider'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e7a5542d20eccfc5dddaf5da434bac709abbfec74e67147aafb79bf067b4da770b9931e252d87a3c009d8699334e2d6ef0aff4637424236b618f9c212e3cad39')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd $pkgname-$pkgver

  find -type f -name '*.py' -exec sed -i 's|urllib2|urllib.error|' '{}' +
}

build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver

  PYTHONPATH=. pytest -k "not test_provider and not test_deptree and not test_signature_single_standalone"
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
