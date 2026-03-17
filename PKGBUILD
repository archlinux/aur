# Maintainer:  Marin Moulinier <https://github.com/p1-mmr>

pkgname="hermes-dec"
pkgver=0.1.1
pkgrel=1
pkgdesc="A reverse engineering tool for decompiling and disassembling the React Native Hermes bytecode"
arch=(
  'any'
)
url="https://github.com/P1sec/${pkgname}"
license=(
  'AGPL-3.0-or-later'
)
depends=(
  'python>=3.10'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=69'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
options=(
  '!strip'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('1b2904a8c78d9d754efdcc1b816d3689aeb8975f5795c7f5bd5d6b84dd8cb986')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
