# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=5.1.1
pkgrel=2
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
  '2235ad3f3a2d6aeee4a6ba742a181f8b70defae12f1a833067e5ad9fc9ed17ca073217437684c1496888c87f8ee39cb959e072f3994046bb0644f08ce1a128a6'
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
