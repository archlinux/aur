# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=shrinko8
pkgver=1.2.2d
pkgrel=3
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
  'github-pr-53.patch'
  'pyproject.toml.template'
  'test_cart.p8'
)

sha512sums=('9861e6922f690aa6a110c380d50a063ca3f6d93e08d53951f9fcd492b627633de95828e78cf09c18084c318d29740c2777042ebe97488e7ce22284e8ac3e4429'
            'dcc8fa017109c70a96f6356d786f343de2ad3c478bec90a44d714688039eb6b26ceb552d464588a80d73b27961521bd6a4bd9ba79f113ab2e28438e9d1000e39'
            '5bb73e52f7474b65d59f41f2b4ee6c152d31d9fa5c40cdc58ce4a09ec0bb63780a63bc0b7d403d09192ab0f51ed2b75e183c9722e3b0d9e0b3e851ca1cae978d'
            '4e741fd1a70c234878f32364ba5f418b5210a3d8d676565194109efd0f9f3f593b534b1870328a2e0c463d20d626e6979ca4a1f20261acc2c57db0b1edb7c0ba'
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

  # Remove this patch once the upstream maintainer has merged PR #53
  # and included it in a stable release.
  # See also: https://github.com/thisismypassport/shrinko8/pull/53
  echo >&2 'Adding support for generated main executable'
  patch -p1 < ../github-pr-53.patch

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
