# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=4.0.1
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=(
  'python-packageurl'
  'python-py-serializable'
  'python-sortedcontainers'
)
checkdepends=(
  'python-ddt'
  'python-jsonschema'
  'python-lxml'
  'python-setuptools'
  'python-toml'
  'xmldiff'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('016793c47bcaa8e9ea5ecea54cf4ebcba840489bf72165f60525e0761a694141ac654875b2e1e76fa2d629533286f00a788bce8697dd4335f5aa14fd4ec901ab')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist # https://github.com/python-poetry/poetry/issues/1329

  # Temporary workaround in order to prevent poetry from building an
  # empty wheel. This was fixed upstream in poetry-core with PR #611 [1].
  # Remove the following workaround as soon as the next upstream release
  # (> 1.6.1) lands in the extra/python-poetry-core package [2].
  #
  # [1]: https://github.com/python-poetry/poetry/issues/5547
  # [2]: https://archlinux.org/packages/extra/any/python-poetry-core/
  git -c init.defaultBranch=master init
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m venv --clear --system-site-packages \
    .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --force-reinstall dist/*.whl
  python -m unittest discover -v
  deactivate
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
