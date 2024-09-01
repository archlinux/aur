# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pyimg4
pkgver=0.8.6
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
  'git' 'python-build' 'python-wheel' 'python-installer' 'python-poetry-core'
  'python-poetry-dynamic-versioning'
)
checkdepends=('python-pytest' 'python-remotezip')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('80176e7af3df19d8fe9814ed0fc2a02849a24adfbb89a522962cba86efdee9a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${PWD}/tmp_install/usr/lib/python${python_version}/site-packages"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
