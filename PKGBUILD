# Contributor: a821
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=3.2.0
pkgrel=4
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache-2.0')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme'
             'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/${pkgver}.tar.gz"
        "update-docs-to-use-importlib.patch"
        "fix-deprecations-warnings.patch")
sha512sums=('a1f924c2fa63a915581c48a14512388e949d39ff3420b79a323b50949d2bf8fadcf6d92951480e0926d07dc18d82d1f46a35e80e812e5f0daa8f7cc0622c39de'
            '0ceb24d00e94cab8f218ed3fed8ae2264b1e5b6a5384425543ba522c155d27e444931dedc5f1aca9f81226cfe14eb6d444f146359fe4ae9e50007f44991ac0dc'
            'b4003d4f492ff5b7ffe2b1247ce3cf09f56ef8e94234b437656d9a517fc8d406d3e0219b4a023bdd17bb5a7cd679714fbf454f5c3cfd6e347d646eb140bd4cb4')

prepare() {
  cd ${pkgname#python-}-${pkgver}
  patch -p1 < ../fix-deprecations-warnings.patch
  patch -p1 < ../update-docs-to-use-importlib.patch
}

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --no-isolation
  cd docs
  PYTHONPATH=.. make man
}

check() {
  cd ${pkgname#python-}-${pkgver}
  pytest
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "${pkgdir}"/usr/requirements_for_tests

  install -D -m644 "docs/_build/man/pypuppetdb.1" "${pkgdir}/usr/share/man/man1/pypuppetdb.1"
}

# vim:set ts=2 sw=2 et:
