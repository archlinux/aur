# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pyimg4
_pkgname=PyIMG4
pkgver=0.8.8
pkgrel=1
pkgdesc="A Python library/CLI tool for parsing Apple's Image4 format"
arch=('any')
url='https://github.com/m1stadev/PyIMG4'
license=('MIT')
depends=(
  'python' 'python-asn1' 'python-click' 'python-pycryptodome' 'python-pylzss'
  'python-lzfse' 'python-apple-compress'
)
makedepends=(
  'python-build' 'python-wheel' 'python-installer' 'python-hatchling'
)
checkdepends=('python-pytest' 'python-remotezip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9172b198f8defb6c5e6ebf6ca9f16b58485833c9407723c480e414cfa7ec4daf')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Remove uv-dynamic-versioning dependency as it is not needed
  sed -i -e "s/^dynamic.*/version = \"${pkgver}\"/" \
    -e 's/requires = \["hatchling", "uv-dynamic-versioning"\]/requires = ["hatchling"]/' \
    pyproject.toml
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${PWD}/tmp_install/usr/lib/python${python_version}/site-packages"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
