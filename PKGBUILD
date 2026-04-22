# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

_pkgname=sphinxcontrib-bibtex
pkgname="python-${_pkgname}"
pkgver=2.6.5
pkgrel=2
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="https://sphinxcontrib-bibtex.readthedocs.org"
license=('BSD-2-Clause')
depends=('python-sphinx' 'python-pybtex' 'python-pybtex-docutils' 'python-docutils')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest' 'python-numpydoc' 'python-sphinx-autoapi')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcmtroffaes/${_pkgname}/archive/${pkgver}.tar.gz"
         https://github.com/mcmtroffaes/sphinxcontrib-bibtex/commit/20781600.patch)
b2sums=('84f169a573532294d9ee3e5fb0362d8bd9b0ed0093fb0e5df2fa7486f36d8df6693659046f4b303972ea98a60eb0588e04b47369e169e517ab3c3822dc33f013'
        '7bbae7b618eebc8b18a5314bf87a88164b3f63c1c36746f8e502997d36a6ae365d8d72049f050e5d093163498fa5a1ba32c16081b9775ac9a1115f7794f336af')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"  
  patch -p1 -i ../20781600.patch # Fix tests with docutils 0.22
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib:${PWD}/src:${PYTHONPATH}" pytest -k 'not test_citation_rinoh'
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
