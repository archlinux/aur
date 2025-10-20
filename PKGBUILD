# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="samloader"
_commit="0e53d8032699a4039ea6f5310ebec05f8f417f07" # 0.4.1
pkgver=0.4.1
pkgrel=1
pkgdesc="Download Samsung firmware from official servers"
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.6'
  'python-pycryptodomex'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('6eeb3d2e73c2bd91bdb05a41457e022964cbfc6b1921cd9b20d9aa4d8e560f762beea9a824f85ce1f17f81404f50c90e0eea7b0bde4d2c9cb7ad87146a44c0de')

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
  ln -vsf "${site_packages}/${pkgname}-${pkgver}.dist-info/licenses/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
