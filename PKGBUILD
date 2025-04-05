# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pyth-git
_gitpkgname=pyth
_base_version=1.0  # see docs/conf.py
pkgver=r767.97cdf30
pkgrel=1
pkgdesc='Pyth, an extremely concise language'
arch=('any')
url='https://github.com/isaacg1/pyth'
license=('MIT')
groups=('esolang')
depends=(
  'python'
  'python-pillow'
  'python-qualify'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-j2cli'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=('python-sympy')
optdepends=(
  'python-sympy: to speed up integer factorization'
)
provides=("pyth=${pkgver}")
conflicts=('pyth')

source=(
  "${_gitpkgname}::git+https://github.com/isaacg1/pyth.git"
  '__init__.py.template'
  'pyproject.toml.template'
)

sha512sums=(
  'SKIP'
  '0c3783ae96c6a7bae8a27f4f7aad7ff422c3d37bca610aefd4e613029fa316e1d5a3a411dc9341295de4c9b9cb997faaaf9672ba0f19c107bcd537cc6590e7df'
  '5fe7332182bc4b35498a2298d026e27ac4dd528f9897eac8145f6e949c18fb776dfbf36a89902dfbdb4c4f41dcdbffb33e7ee8693522c25fa96ba85ef4b40bef'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  local _pep440_conforming_version
  _pep440_conforming_version="${_base_version}.dev$(
    git -C "${_gitpkgname}" rev-list --count HEAD
  )"
  cd "${_gitpkgname}"
  rm -rf pyth

  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python namespace compatibility fix'
  mkdir -v pyth
  j2 -f env -o 'pyth/__init__.py' '../__init__.py.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Adding support for generated main executable'
  sed -e "s/if __name__ == '__main__':/def main():/" pyth.py \
    >> pyth/__init__.py
  rm -v pyth.py
  echo >&2 'Restoring support for executing pyth as a module'
  echo 'import sys; from . import main; sys.exit(main())' > pyth/__main__.py

  echo >&2 'Replacing function removed in Python 3.9'
  sed -i -e 's/fractions\.gcd/math.gcd/' macros.py

  echo >&2 'Preparing Python package'
  mv -v {data,extra_parse,lexer,macros}.py pyth/
}

build() {
  cd "${_gitpkgname}"

  echo >&2 'Building the wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  make -C docs man singlehtml
}

check() {
  cd "$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary environment'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer \
    "${srcdir}/${_gitpkgname}/dist"/*.whl

  echo >&2 'Running unit tests'
  test-env/bin/python "${srcdir}/${_gitpkgname}/test.py"

  echo >&2 'Testing the executable'
  echo 2 > expected.txt
  test-env/bin/pyth -c '+1 1' > actual.txt
  if ! diff -q expected.txt actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    diff -u expected.txt actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  install -D -m 644 -T rev-doc.txt \
    "${pkgdir}/usr/share/doc/${pkgname}/ref-doc.txt"  # typo
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/_build/singlehtml/{index.html,_static}
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    docs/_build/man/*.1

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
