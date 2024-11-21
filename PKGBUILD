# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="sen"
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal User Interface for containers"
arch=('any')
url="https://github.com/TomasTomecek/${pkgname}"
license=('MIT')
depends=('python' 'python-docker' 'python-urwid'  'python-urwidtrees')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
checkdepends=('python-flexmock' 'python-pytest>=3.4')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4e7dbce3695ba7eb9c800fe8a4c38a811b184caed8d2558c83481ad74c1d09fc')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/LICENSE" "LICENSE"
}
