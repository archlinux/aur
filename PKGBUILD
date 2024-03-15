# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=hancho
pkgver=0.0.4
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
  'python-setuptools'
  'python-wheel'
)
checkdepends=('gtk3')
optdepends=(
  'gtk3: to build the included meson example'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aappleby/hancho/archive/${pkgver}.tar.gz"
  'pyproject.toml.template'
)

sha512sums=(
  '19678595e4dc5551764cbd2c5f96016ad38d955319aaff798bb15cfac4dffd5cc5cea23fc776924583bbe7f58e375febcc2b0db6c677b1e260c0acf4045ad942'
  'd16109bc0f50852749a0c75c38b4e00c1facf97ce1e458ebde711a448d10c8047e8e9daef10d4ad16313ba521dea024c8794a055cb9a6a3ac91979669d403d3a'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Removing unneeded files'
  find . -name .gitignore -exec rm -v '{}' +

  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "pkgver=${pkgver}"

  echo >&2 'Preparing Python package'
  mkdir -pv hancho
  mv -v hancho.py hancho/__init__.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

_site_packages() {
  python -c 'import site; print(site.getsitepackages()[0])'
}

check() {
  local _tmpbase
  cd "${srcdir}/${pkgname}-${pkgver}"
  _tmpbase="$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary directory'
  python -m installer --destdir="${_tmpbase}" \
    "${srcdir}/${pkgname}-${pkgver}/dist"/*.whl

  echo >&2 'Running tests'
  PYTHONPATH="${_tmpbase}/$(_site_packages)"
  export PYTHONPATH
  ln -s "${_tmpbase}/usr/bin/hancho" hancho.py
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
