# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="markdown_strings"
pkgname="python-${_name}"
pkgver=3.4.0
pkgrel=2
pkgdesc="Create markdown formatted text"
arch=('any')
url="https://github.com/awesmubarak/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('python')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9845812493103fc72327344f8db8897f7dfd496adf29c8a8bb8a4105e0f89737')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  python test.py
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
