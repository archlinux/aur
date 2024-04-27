# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.5
pkgrel=3
pkgdesc='Simple pleasant build system in Python'
arch=('any')
url='https://github.com/aappleby/hancho'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-j2cli'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=('gtk3')
optdepends=(
  'gtk3: to build the included meson example'
)
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aappleby/hancho/archive/${pkgver}.tar.gz"
  'pyproject.toml.template'
)

sha512sums=(
  'eef8e2e22c154efc4f1722d8bc50a4865d4151a467a9408811b888d5a0f20f537e7bc3776c8a7cc59a7a62c181b7bb82039432610a04ee2b5ce5cf9f22ea54e9'
  '8d37cd359870614d0bd8c60e4f4bac867482e8460daad4a2d1974deefc5fffb79da1c880acadb7c8a7d28a733067cbf185cfbf3982090122fd2b934e6b47de83'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Removing unneeded files'
  find . -name .gitignore -exec rm -v '{}' +

  echo >&2 'Configuring build backend'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "pkgver=${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local _tmpbase
  cd "${srcdir}/${pkgname}-${pkgver}"
  _tmpbase="$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary directory'
  python -m installer --destdir="${_tmpbase}" \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl

  echo >&2 'Running tests'
  PYTHONPATH="${_tmpbase}/$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )"
  export PYTHONPATH
  python hancho.py
  rm -rf examples/*/build
  rm -rf tutorial/build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  cp -vR 'docs' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}/"

  echo >&2 'Packaging the examples'
  mkdir -pv "${pkgdir}/usr/share/${pkgname}"
  cp -vR 'examples' "${pkgdir}/usr/share/${pkgname}/"
}
