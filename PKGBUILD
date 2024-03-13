# Maintainer:
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Sebastian Reuße <seb@wirrsal.net>

## useful links
# http://www.mypy-lang.org
# https://github.com/JukkaL/mypy

_pkgname="mypy"
pkgname="$_pkgname-git"
pkgver=1.9.0.r40.ga00fcba
pkgrel=1
pkgdesc="Optional static typing for Python 2 and 3 (PEP484)"
url="https://github.com/JukkaL/mypy"
license=('MIT')
arch=("any")

depends=(
  'python-psutil'
  'python-mypy_extensions'
  'python-typing_extensions'
  'python-tomli'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _version=$(git tag | sed -E 's/^[^0-9]+//' | sort -rV | head -1)

  [ git rev-list v${_version} > /dev/null 2>&1 ] && local _version_prefix=v
  local _revision=$(git rev-list --count --cherry-pick "${_version_prefix:-}${_version}"...HEAD)

  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$_pkgsrc"

  # remove unneeded build requirements as we are not compiling mypy: https://github.com/python/mypy/issues/14171
  sed -e '/typing_extensions/d;/mypy_extensions/d;/typed_ast/d;/tomli/d;/types-psutil/d;/types-setuptools/d;/types-typed-ast/d' -i pyproject.toml

  # -Werror, not even once
  sed -e '/Werror/d' -i mypyc/build.py
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove tests
  rm -frv "$pkgdir/$_site_packages"/*/test*
}
