#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
pkgver=9.11.3
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

_commit=376a41e
source=(
  "git+https://github.com/copier-org/copier.git#commit=$_commit"
)
sha256sums=(
  '7207860d9210b01f5aef92b94966d8cf52b10a6c3f81acbe57e5ba2e642b27cd'
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
