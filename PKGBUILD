# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-callee
_gitpkgname=callee
pkgver=0.3.1
pkgrel=1
pkgdesc='Argument matchers for unittest.mock'
arch=('any')
url='https://github.com/Xion/callee'
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=('python-taipan')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/Xion/callee/archive/${pkgver}.tar.gz"
  'python-312-compat.patch'
)

sha512sums=(
  'd2c6f2f66f349a7ed884899a0384de371de55d6ac82accf8e2aceee2c54cea377f3db828985358bb3337528766d3d0953c179b9af4ffc0bb8158208258e46424'
  '094691a14531e74c5a6c8e500b6f09f04f23dccaba6c81ebfeac92acd42f28bdda46845f78184590ec58819ec3ee5455638528519b79efd633caaa366a09fbea'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Applying Python 3.12+ compatibility patches'
  find tests -name 'test_*.py' \
    -exec sed -i \
      -e 's/assertEquals/assertEqual/g' \
      -e 's/assertRaisesRegexp/assertRaisesRegex/g' \
      -e 's/\(collections\)\.\(Mapping\|MutableMapping\|Sized\)/\1.abc.\2/g' \
      '{}' +
  patch -p1 < ../python-312-compat.patch

  echo >&2 'Applying documentation fixes'
  sed -i -e '1,+1d' docs/reference/operators.rst
  # See also:
  # https://github.com/sphinx-doc/sphinx/issues/10474#issuecomment-1140389657
  sed -i \
    -e 's/^\(language =\).*/\1 "en"/' \
    -e 's/\(\[author\]\), 1/\1, 3/' \
    docs/conf.py
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man docs docs/build/man

  echo >&2 'Generating HTML documentation'
  sphinx-build -aqEW -b singlehtml docs docs/build/singlehtml
}

check() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Running unit tests'
  python -m unittest discover -v
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.rst
  install -D -m 644 -t "${pkgdir}/usr/share/man/man3" \
    docs/build/man/*.3
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_static}

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
