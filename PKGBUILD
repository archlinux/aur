# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="stransi"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.3.0.r71.gdee78ed
pkgrel=2
pkgdesc="A lightweight Python parser library for ANSI escape code sequences"
arch=('any')
url="https://github.com/getcuia/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core>=1')
checkdepends=('python-pytest>=7.1' 'python-hypothesis>=6.49.1')
depends=('python>=3.8' 'python-ochre>=0.4')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH="${PWD}/src" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "FEATURES.md" "${pkgdir}/usr/share/doc/${_pkgname}/FEATURES.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
