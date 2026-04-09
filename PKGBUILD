# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=2.4.5
pkgrel=1
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD-2-Clause')
depends=('python' 'python-edalize' 'python-pyparsing' 'python-yaml' 'python-simplesat' 'python-fastjsonschema' 'python-argcomplete')
makedepends=('python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pytest' 'git')
optdepends=('python-nanoid: needed by filter spdxgen'
            'iverilog: run simulation/testbenchs'
            'svn: opencores provider')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('db7467ee870b94b7acd5f6a91a0f0ab58b1928b0e80360c7dba3814a305dc6f06c9559cc8dcbd036fcbc0023a1791c35c5b321e0e6977ba00a42b1a6db737e0a')

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
