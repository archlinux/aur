# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=shrinko8
pkgver=1.2.2d
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
  'shrinko8'
  'test_cart.p8'
)

sha512sums=('9861e6922f690aa6a110c380d50a063ca3f6d93e08d53951f9fcd492b627633de95828e78cf09c18084c318d29740c2777042ebe97488e7ce22284e8ac3e4429'
            'dcc8fa017109c70a96f6356d786f343de2ad3c478bec90a44d714688039eb6b26ceb552d464588a80d73b27961521bd6a4bd9ba79f113ab2e28438e9d1000e39'
            '185284f60dad6e7172a588416d770e7129d7bcc0ce86bfae1fb7d09cafeb0f6d19ff14dada0844f1fd557510671ff3631f488f2687b4da631488e0421fc61cdb'
            'c00dc0e42044d30c5b99888ac4d6f1a563decfbc357b0f6057c6417b0c0c2d225a64ad3e5bd3f7017b97c92384cca8e48e240778654e0bb516d89776c1ca24a7'
            'b51c0ed94ffec9f0aa93d09bd6e4fcb155c69dd5dcfc5e155156227e5574f872bd61d541bfe6b98150c78bd8d4142f964c9bbd3c304c8daf58c9f8f21b59f2e6')

prepare() {
  local _pep440_conforming_version="${pkgver%[a-z]}+${pkgver##*[0-9]}"
  cd "${srcdir}/${pkgname}-${pkgver}"

  # pyinstaller bundles dependencies and the Python runtime, so we
  # use setuptools instead
  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python namespace compatibility fix'
  mkdir -pv shrinko8
  j2 -f env -o 'shrinko8/__init__.py' '../__init__.py.template' - \
    <<< "version=${_pep440_conforming_version}"

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
}

check() {
  cd "$(mktemp -d)"
  echo >&2 'Installing wheel into a temporary directory'
  python -m installer --destdir=. \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl

  PYTHONPATH="${PWD}/$(_site_packages)"
  export PYTHONPATH

  echo >&2 'Running minification test'
  python "${srcdir}/shrinko8" \
    -m "${srcdir}/test_cart.p8" test_cart_minified.p8
  if [[ "$(wc -c < 'test_cart_minified.p8')" -gt 117 ]]; then
    printf >&2 '%s\n' 'Unexpected minification output:' '==='
    cat >&2 'test_cart_minified.p8'
    printf >&2 '\n%s\n' '==='
    exit 1
  fi

  echo >&2 'Running PNG generation test'
  python "${srcdir}/shrinko8" \
    -m "${srcdir}/test_cart.p8" test_cart.p8.png
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" "../${pkgname}"

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
