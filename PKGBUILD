# Maintainer: giver <giverc139@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.197
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD')
arch=('any')
depends=(
  'python'
  'python-cxxheaderparser'
  'python-gitpython'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-claripy'
  'python-cle>=9.2.197'
  'python-lmdb'
  'python-msgspec'
  'python-mulpyplexer'
  'python-networkx'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pydemumble'
  'python-pyformlang'
  'python-pypcode'
  'python-pyvex'
  'python-rich'
  'python-sortedcontainers'
  'python-sympy'
  'python-typing_extensions'
  'python-unicorn'
)
makedepends=(
  'gcc'
  'make'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-rust'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a197ee6c39fa1672230f5c463902411848d92cae7e7caa964a0c4f7ca1888d10f26e94d40037e09684178998fd210be3891292c1d9f854150b5691289cf1826f')
b2sums=('ccb9bc09726ac540fc99ace649250bb8dab10346fc61b98d596a4d7852e6cc5bfd21d77677b8f725a4522d3b9503292dbb4dbb304a47f47a2848c1f8631b22d9')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/g' -i "${_pyname}-${pkgver}/pyproject.toml"
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//g' -i "${_pyname}-${pkgver}/pyproject.toml"
}

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

check() {
  # curl -LO "https://github.com/angr/binaries/archive/v${pkgver}/binaries-${pkgver}.tar.gz"
  # tar -xf "binaries-${pkgver}.tar.gz"
  # ln -sf "binaries-${pkgver}" binaries
  cd "${_pyname}-${pkgver}"
  python -m venv --clear --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Ic 'import angr'
  # Full pytest might take a long time
  # test-env/bin/python -Pm pytest -o addopts=''
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
