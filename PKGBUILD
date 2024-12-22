# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.2.0
pkgrel=2
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
  'fix-paths.patch'
  'pyproject.toml.template'
)

sha512sums=('5ce2a91eba1617bf94f264ecf7957934b21f2cda869a9a888f8510c09cd38d1a5ea76f562870ebacfe6f8c6116da40af16145772276fb3c5915423a54d9f558e'
            '0a20ffe9a5b7e79f048c278d49ba28578af71a78b3ab8f7a4d0126d8f8372fe03757247eb9a27eb1f405f7b4129dc1b8ed5ae968306cb6e90fb42a38611459ff'
            '8d37cd359870614d0bd8c60e4f4bac867482e8460daad4a2d1974deefc5fffb79da1c880acadb7c8a7d28a733067cbf185cfbf3982090122fd2b934e6b47de83')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Removing unneeded files'
  find . -name .gitignore -exec rm -v '{}' +

  echo >&2 'Configuring build backend'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "pkgver=${pkgver}"

  echo >&2 'Fixing paths'
  patch -p1 < ../fix-paths.patch

  echo >&2 'Disabling non-functional example'
  sed -i 's/.*subrepos.*/#\0/' examples/examples.hancho
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
  cp -vR 'docs' "${pkgdir}/usr/share/doc/${pkgname}/"

  echo >&2 'Packaging examples and tutorial'
  mkdir -pv "${pkgdir}/usr/share/${pkgname}"
  cp -vR 'examples' 'tutorial' "${pkgdir}/usr/share/${pkgname}/"
}
