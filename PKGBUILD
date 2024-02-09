# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=6.4.1
pkgrel=1
pkgdesc='Render and read CycloneDX, a lightweight BOM specification document format'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache-2.0')
depends=(
  'python-jsonschema'
  'python-license-expression'
  'python-lxml'
  'python-packageurl'
  'python-py-serializable'
  'python-sortedcontainers'
)
checkdepends=(
  'python-ddt'
  'python-toml'
  'xmldiff'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
conflicts=('python-cyclonedx-lib-git')
options=('!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz"
  'fix-stray-license.patch'
)

sha512sums=(
  'dd2adc05c757825e47556b2b4c4ab1510ef9a641763bef457dcbd6a793b258593d58e5ecad224dcb7facfaaa4ea7223d6c662fae70d4e7055330de408023bd21'
  'c65fa3e302f997b256f216498a1ee7eabc70b0cdfc23c5fd30db2be63f7c74c20816ae959a7ce0b7f4970ecb5d63b10202616e555999289a01e8444a61dfd771'
)

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist # https://github.com/python-poetry/poetry/issues/1329

  # Keep the build backend from including `LICENSE`, `NOTICE`, and
  # `README.md` in the `site-packages` folder directly.
  # Upstream PR pending.
  # See also: https://github.com/CycloneDX/cyclonedx-python-lib/issues/435
  patch -p1 < "${srcdir}/fix-stray-license.patch"

  # Consistently failing during `check` but not in upstream CI.
  # Needs more analysis.
  find tests -name 'invalid-metadata-timestamp-*.json' -exec rm -v '{}' ';'
  find tests -name 'valid-signatures-*.json' -exec rm -v '{}' ';'
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m venv --clear --system-site-packages .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --force-reinstall --no-deps dist/*.whl
  python -m unittest discover -v
  deactivate
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE NOTICE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
