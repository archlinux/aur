# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=shrinko8
pkgver=1.2.5b
pkgrel=1
pkgdesc='Shrink (minify) Pico-8 carts, as well as other tools (e.g. linting, format conversion)'
arch=('any')
url='https://github.com/thisismypassport/shrinko8'
license=('MIT')
depends=('python' 'python-pillow' 'python-qualify')
makedepends=(
  'python-build'
  'python-installer'
  'python-j2cli'
  'python-setuptools'
  'python-wheel'
)
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/thisismypassport/shrinko8/archive/v${pkgver}.tar.gz"
  '__init__.py.template'
  'pyproject.toml.template'
  'test_cart.p8'
)

sha512sums=('f22155f8da3a2974893abcf9b898ed674076e6ad51f4e3527f179ed62aea47171c48ea8371e3ac154bda206361ed14799456cec026e218f79f71f8b50f362c76'
            '0e675da3bf7582976500747a8b9456a97fd868ed8ba6de963ca6eeb6e09e04c9664956b5d9316065ea667a0dd9176541adc7ddfb50d5e2ea62e8312d97e90ee7'
            '9c2165957d91ad5cf60e5d219004a4fac9d97258fddef9b061d2f3f9fa3167c33779b120a5d3673deddaed4875b58885cb425f4e4abfabe9eb393b2a78a3ac9e'
            'b51c0ed94ffec9f0aa93d09bd6e4fcb155c69dd5dcfc5e155156227e5574f872bd61d541bfe6b98150c78bd8d4142f964c9bbd3c304c8daf58c9f8f21b59f2e6')

prepare() {
  local _pep440_conforming_version="${pkgver%[a-z]}+${pkgver##*[0-9]}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf shrinko8 tests

  # pyinstaller bundles dependencies and the Python runtime, so we
  # use setuptools instead
  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python namespace compatibility fix'
  mkdir -v shrinko8
  j2 -f env -o 'shrinko8/__init__.py' '../__init__.py.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python packages'
  xargs < 'files.lst' bash -c 'mv -v $@ shrinko8/' _
  mkdir -v tests
  mv -v run_tests.py test_utils.py test_input test_compare \
    tests/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Building the wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary environment'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl

  echo >&2 'Running minification test'
  test-env/bin/shrinko8 -m "${srcdir}/test_cart.p8" test_cart_minified.p8
  if [[ "$(wc -c < 'test_cart_minified.p8')" -gt 117 ]]; then
    printf >&2 '%s\n' 'Unexpected minification output:' '==='
    cat >&2 'test_cart_minified.p8'
    printf >&2 '\n%s\n' '==='
    exit 1
  fi

  echo >&2 'Running PNG generation test'
  test-env/bin/shrinko8 -m "${srcdir}/test_cart.p8" test_cart.p8.png
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
