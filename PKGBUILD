# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-taipan
_gitpkgname=taipan
pkgver=0.0.3
pkgrel=2
pkgdesc='General purpose toolkit for Python'
arch=('any')
url='https://github.com/Xion/taipan'
license=('BSD-2-Clause')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/Xion/taipan/archive/${pkgver}.tar.gz"
  'github-pr-2.patch'
  'replace-abc-internal-api.patch'
  'skip-failing-test.patch'
)

sha512sums=(
  'f28f7a79b5e82f3a04b8b640bde710a29e4db43802a07ba2fdbe7179a9dad406af7630df32a5348c651acbb2329bb2ee745312e0ac4ba50e68f91dc8985798da'
  '24e6f6c25a077ac662fddf91f810c5cfd734cdd5967f44a052e41cfac5e97317e20d0fc7e7820aabfb1d482126c2c912acfd8cb0dd76a4ad2edbdebd0393ab8b'
  'fab80199b1c86577fdbdc801ec18737e3c49fefd27690758fb87432c2b374095505427c6b9a73a8fd87a5e46afefe2c3d218f64b3c6180e75797b91cbdc91014'
  'eac462c302c7f6fd3631c3153ea06a4d7f6cde55af22be4ac7d1960c3570e8fd768e4d0d8729b02c48c62c525245b886a65ef26b9d43aa6392a16ed2a9536bc9'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Applying Python 3.7+ compatibility patch'
  patch -p1 < ../replace-abc-internal-api.patch

  echo >&2 'Applying Python 3.8+ compatibility patch'
  patch -p1 < ../skip-failing-test.patch

  echo >&2 'Applying Python 3.10+ compatibility patch'
  # See also: https://github.com/Xion/taipan/pull/2
  patch -p1 < ../github-pr-2.patch

  echo >&2 'Applying Python 3.11+ compatibility patch'
  sed -i \
    -e 's/\(_, \)*_ = inspect\.getargspec/*_ = inspect.getfullargspec/' \
    'taipan/objective/__init__.py'

  echo >&2 'Applying Python 3.12+ compatibility patch'
  find tests -name 'test_*.py' \
    -exec sed -i -e 's/assertEquals/assertEqual/' '{}' +

  echo >&2 'Exclude tests from wheel'
  sed -i -e "s/exclude=\['tests'/\0, 'tests.*'/" setup.py
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m unittest discover -v
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.rst

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
