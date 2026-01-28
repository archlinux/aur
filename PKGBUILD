# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="minilzo"
pkgname="python-${_pypiname}"
pkgver=1.2
pkgrel=1
pkgdesc="A python module to handle lzo file compression"
arch=(
  'x86_64'
)
url="https://github.com/Myldero/${pkgname}"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-setuptools'
  'python-installer'
)
_pkgsrc="${_pypiname}-${pkgver}"
source=(
  "https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pkgsrc}.tar.gz"
)
sha256sums=('4cdcc0dc3e8558a29d8a6fed5c66a1ae3c8014e12d0a27554890c4248f76b141')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
