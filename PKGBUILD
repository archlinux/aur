# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-requirements-parser
_gitpkgname=pip-requirements-parser
pkgver=32.0.1
pkgrel=3
pkgdesc='Mostly correct pip requirements parsing library'
arch=('any')
url='https://github.com/nexB/pip-requirements-parser'
license=('MIT')

# Upstream also declares `python-pyparsing` as a dependency.
# However, we don’t need it in the PKGBUILD due to Arch Linux’s
# `extra/python-packaging` being recent enough. See also:
# https://github.com/nexB/pip-requirements-parser/commit/52be2f7e7e85c2c492c50fe9429d2d72ab18c3b7
depends=('python' 'python-packaging')

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
conflicts=('python-pip-requirements-parser-git')
options=('!debug' '!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/nexB/pip-requirements-parser/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '4d8ec17f168e5723c5063b7c11232fd777abe25e76f6f80d628512ee165d779806ce6b9ec843c312c1ff3564b814485ad2449967969d10da32dead9e86d6e4e7'
)

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -X pycache_prefix=pycache -m installer \
    --destdir="${pkgdir}" dist/*.whl
  rm -rf pycache
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
