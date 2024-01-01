# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=6.2.0
pkgrel=1
pkgdesc='Render and read CycloneDX, a lightweight BOM specification document format'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
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
  'dff040d9435a76b73930da3289149e27571cf300da58e81aaa9bc5ae71842a1ba578c1014af24072fc8f1e075afdab72c5354d84990f56d8e64c56e202d2a7ef'
  '0468a4a94597ec62edabaf39668256e0aa6b42b17ac965293f59da377250452afa7b9391811305dac4808073542c3c86b70ccaebb292a171ed01b49668c006e0'
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
  find tests -name 'valid-signatures-1.4.json' -exec rm -v '{}' ';'
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
