#  Maintainer: Blair Bonnett <blair dot bonnett at gmail>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=python-pudb-git
_pkgname=pudb
pkgver=2025.1.r16.g117bd41
pkgrel=1
pkgdesc="A full-screen, console-based Python debugger"
url="https://documen.tician.de/pudb/"
arch=('any')
license=('MIT')
provides=('python-pudb')
conflicts=('python-pudb')

depends=(
  'python-jedi'
  'python-packaging'
  'python-pygments'
  'python-typing_extensions'
  'python-urwid'
  'python-urwid_readline'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)
optdepends=(
  'bpython: bpython shell'
  'ptpython: shell based on prompt_toolkit'
  'ipython: shell embedding IPython'
  'python-shtab: shell completion'
)

source=("git+https://github.com/inducer/pudb.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/$_pkgname"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir"/"$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir/$site_packages/pudb/test"
}

# vim: set ft=sh ts=2 sw=2 et:
