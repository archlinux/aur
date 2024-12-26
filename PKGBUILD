# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kaskade"
pkgname="${_pkgname}-git"
pkgver=4.0.0.r0.g6a691d5
pkgrel=1
pkgdesc="A text user interface for Kafka. Interact and consume topics from your terminal in style!"
arch=('any')
url="https://github.com/sauljabin/${_pkgname}"
license=('MIT')
depends=('python>=3.10' 'python-click' 'python-cloup' 'python-confluent-kafka'
         'python-fastavro' 'python-protobuf' 'python-rich' 'python-textual')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core>=1')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -f "${pkgdir}${site_packages}/LICENSE"

  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"

  install -vd "${pkgdir}/usr/share/licenses/${_pkgname}"
  cd "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -vs "${site_packages}/${_pkgname}-${pkgver%%.r*}.dist-info/LICENSE" "LICENSE"
}
