# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.11
pkgrel=1
arch=(any)
url="https://github.com/ismet55555/${pkgname}"
license=('Apache')
depends=(python-fpdf2 python-requests python-pyaml python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz
  https://raw.githubusercontent.com/ismet55555/${pkgname}/master/requirements.txt)
sha512sums=('e2ee7aac7b274b3cfe2cc7d5cc312115c14ad3df01a2f788fc994ccc69b985ef4f252f3f1e1eb5bc0e218a1e716bb49e11ab903b13b4ef9e5cea2016fbcde7c5'
            '94419652fa9ff95fe43bdf2e10fdfc771bce0ef03dde5711f3f7f4cd4ab27444340f7fb26e3d94ad035a3a9a57c83b5d0422221f8ae4c3f290a888d4057cf948')

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
  ln -s "${site_packages}/${pkgname/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
