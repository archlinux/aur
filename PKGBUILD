# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

_name="arabic-reshaper"
pkgname="python-${_name}"
pkgver=3.0.0
pkgrel=2
pkgdesc="Reconstruct Arabic sentences to be used in applications that do not support Arabic"
arch=('any')
url="https://github.com/mpcabd/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-fonttools>=4: TTF support')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('cff356dd4001851c464cda3f840ed4713c6b53ee1c0a19b79bad12b508e06cda')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_name//-/_}-${pkgver}.dist-info/LICENSE" "LICENSE"
}

# vim:set ts=2 sw=2 et:
