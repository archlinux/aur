# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

_py="python"
_name="pip"
pkgname="${_py}-${_name}-git"
pkgver=23.0.r34.g852deddb9
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
_pypi="https://github.com/pypa"
url="${_pypi}/${_name}"
arch=('any')
license=('MIT')
depends=(
  python
  python-attrs  # for vendored rich
  python-cryptography  # for vendored requests and urllib3
  python-wheel  # for internal misc utils
)
makedepends=(
  python-build
  python-installer
  python-myst-parser
  python-setuptools
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-inline-tabs
  python-sphinxcontrib-towncrier
)
checkdepends=(
  git
  python-freezegun
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
  python-scripttest
  python-tomli-w
  python-virtualenv
  python-werkzeug
  subversion
)
conflicts=("${_py}-${_name}")
source=("${_name}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation

  cd docs/
  PYTHONPATH="$srcdir/${_name}/src/" python pip_sphinxext.py
  PYTHONPATH="$srcdir/${_name}/src/" sphinx-build -b man -d build/doctrees/man man build/man -c html
}

package() {
  local _site_packages

  cd "${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 docs/build/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  _site_packages="$(python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())")"

  # NOTE: zsh completion does not work: https://bugs.archlinux.org/task/65349#comment187166
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --bash | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --fish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip.fish
}
