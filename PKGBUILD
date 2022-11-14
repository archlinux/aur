# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.9
pkgrel=1
arch=(any)
url="https://github.com/ismet55555/${pkgname}"
license=('Apache')
depends=(python-fpdf2 python-requests python-pyaml python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz
  https://raw.githubusercontent.com/ismet55555/${pkgname}/master/requirements.txt)
sha512sums=('cb6d53e212f1f5fff289aae3560c7b6f612b3b19f6a081ebd7c03d7848c3fd38e1d453dc27953b35c6e57af1d7728b4b398d9ba758b31034b5e5b10504f91907'
  '5ff9f0127ca598b6f48db00c260a617124deb77831d66d591e2f73bd81760f377385f437c141da2860e62880357781d3d03bb32a687b86984e5066c281c7b5dd')

prepare() {
  mv requirements.txt ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
