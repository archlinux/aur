# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=shrinko8
pkgver=1.1.2
pkgrel=2
pkgdesc='Shrink (minify) Pico-8 carts, as well as other tools (e.g. linting, format conversion)'
arch=('any')
url='https://github.com/thisismypassport/shrinko8'
license=('MIT')
depends=('python-pillow' 'python-qualify')
makedepends=(
  'python-build'
  'python-installer'
  'python-j2cli'
  'python-setuptools'
  'python-wheel'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/thisismypassport/shrinko8/archive/v${pkgver}.tar.gz"
  '__init__.py.template'
  'pyproject.toml.template'
  'shrinko8.py.template'
  'test_cart.p8'
)

sha512sums=(
  '79dfea0a1322a81073cfbd51785f78eafcb62b070154eb8b4878a1482b80257317ae47e39f6b51c4a14f046588bd59307278dfdc1a93983e671e598e0594baa5'
  'e484cb3881923665ff3bf7cb7522f897227896b81d8c8b094f7be8c49d79f1ed6d069bb82d878be36210df80ddf75cb009eb92ea03a2bc9cd3988f651e0bee57'
  'f10fb1b15dfe370ae85eb8d80065929591d06f3626e5ff69930b491bc3c781cb4b8485af130bbb892b70fb54f0eee70e3aadce28cdc1a40993c7620ad449fc9e'
  'c00dc0e42044d30c5b99888ac4d6f1a563decfbc357b0f6057c6417b0c0c2d225a64ad3e5bd3f7017b97c92384cca8e48e240778654e0bb516d89776c1ca24a7'
  'b51c0ed94ffec9f0aa93d09bd6e4fcb155c69dd5dcfc5e155156227e5574f872bd61d541bfe6b98150c78bd8d4142f964c9bbd3c304c8daf58c9f8f21b59f2e6'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # pyinstaller bundles dependencies and the Python runtime, so we
  # use setuptools instead
  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "pkgver=${pkgver}"

  echo >&2 'Preparing Python namespace compatibility fix'
  mkdir -pv shrinko8
  j2 -f env -o 'shrinko8/__init__.py' '../__init__.py.template' - \
    <<< "pkgver=${pkgver}"

  echo >&2 'Preparing Python packages'
  xargs < 'files.lst' bash -c 'mv -v $@ shrinko8/' _
  mkdir -pv tests
  mv -v run_tests.py test_utils.py test_input test_compare \
    tests/
}

_site_packages() {
  python -c 'import site; print(site.getsitepackages()[0])'
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Building the wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Building the executable'
  mkdir -pv bin
  j2 -f env -o bin/shrinko8 '../shrinko8.py.template' - <<< \
    "site_packages=$(_site_packages)"
}

check() {
  cd "$(mktemp -d)"
  echo >&2 'Installing wheel into a temporary directory'
  python -m installer --destdir=. \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl

  PYTHONPATH="${PWD}/$(_site_packages)"
  export PYTHONPATH

  echo >&2 'Running minification test'
  python "${srcdir}/${pkgname}-${pkgver}/bin/shrinko8" \
    -m "${srcdir}/test_cart.p8" test_cart_minified.p8
  if [[ "$(wc -c < 'test_cart_minified.p8')" -gt 116 ]]; then
    printf >&2 '%s\n' 'Unexpected minification output:' '==='
    cat >&2 'test_cart_minified.p8'
    printf >&2 '\n%s\n' '==='
    exit 1
  fi

  echo >&2 'Running PNG generation test'
  python "${srcdir}/${pkgname}-${pkgver}/bin/shrinko8" \
    -m "${srcdir}/test_cart.p8" test_cart.p8.png
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" "bin/${pkgname}"

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
