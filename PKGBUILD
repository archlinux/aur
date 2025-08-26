#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
pkgver=9.10.0
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/copier-org/copier'
license=('MIT')

depends=(
  'python-colorama'
  'python-dunamai'
  'python-funcy'
  'python-jinja'
  'python-jinja2-ansible-filters'
  'python-packaging'
  'python-pathspec'
  'python-platformdirs'
  'python-plumbum'
  'python-prompt_toolkit'
  'python-pydantic'
  'python-pygments'
  'python-questionary'
  'python-yaml'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-hatch-vcs'
  'python-installer'
)
checkdepends=(
  'python-pexpect'
  'python-poethepoet'
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-gitconfig'
  'python-pytest-xdist'
)
optdepends=(
  'git: VCS support'
)

_commit=78e6b2f
source=(
  "git+https://github.com/copier-org/copier.git#commit=$_commit"
)
sha256sums=(
  '9752268e7c95f2e53dbe6073e822269d5281795ff56b58e54a1b84b12e24c4e5'
)

build() {
  cd copier
  python -m build --wheel --no-isolation
}

check() {
  cd copier
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/copier-$pkgver-"*.whl
  LC_ALL=C test-env/bin/python -m pytest -k 'not test_types and not test_commit_hooks_respected'
}

package() {
  cd copier
  python -m installer --destdir="$pkgdir" "dist/copier-$pkgver-"*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
