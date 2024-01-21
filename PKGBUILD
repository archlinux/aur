#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
_name=${pkgname#python-}
pkgver=9.1.1
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/copier-org/copier'
license=('MIT')

depends=(
  'python-colorama'
  'python-decorator'
  'python-dunamai'
  'python-funcy'
  'python-jinja'
  'python-jinja2-ansible-filters'
  'python-packaging'
  'python-pathspec'
  'python-plumbum'
  'python-prompt_toolkit'
  'python-pydantic'
  'python-pygments'
  'python-pyyaml-include'
  'python-questionary'
  'python-yaml'
)
makedepends=(
  'git' 'python-build' 'python-installer' 'python-wheel'
  'python-poetry-dynamic-versioning'
)
checkdepends=(
  'python-poethepoet' 'python-pytest' 'python-pytest-cov'
  'python-pytest-gitconfig' 'python-pytest-xdist'
)
optdepends=(
  'git: VCS support'
)

# PyPI tarball does not include tests; GitHub tarball fails to build
# as poetry-dynamic-versioning fails to find metadata.
source=(
  "git+https://github.com/copier-org/copier.git#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd copier
  python -m build --wheel --no-isolation
}

check() {
  cd copier
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_name-$pkgver-"*.whl
  test-env/bin/python -m pytest -k 'not test_types and not test_commit_hooks_respected'
}

package() {
  cd copier
  python -m installer --destdir="$pkgdir" "dist/$_name-$pkgver-"*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
