# Maintainer:  Marin Moulinier <https://github.com/p1-mmr>

pkgname="qcsuper"
_pkgname="QCSuper"
pkgver=2.1.0
pkgrel=2
pkgdesc="QCSuper is a tool communicating with Qualcomm-based phones and modems, allowing to capture raw 2G/3G/4G radio frames, among other things"
arch=(
  'any'
)
url="https://github.com/P1sec/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'python>=3.7'
  'wireshark-qt>=3.6.0'
  'python-crcmod>=1.7'
  'python-pycrate>=0.7.0'
  'python-pyserial>=3.5'
  'python-pyusb>=1.2.1'
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
sha256sums=('909aea94fa04542262c82857d7c3a99656ccfc74c080b4ccf7cec47a6bc5e36b')

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
