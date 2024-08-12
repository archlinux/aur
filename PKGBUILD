# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ochre"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.4.0.r84.gcf2808f
pkgrel=1
pkgdesc="A down-to-earth approach to colors"
arch=('any')
url="https://github.com/getcuia/${_name}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core>=1.0.0')
checkdepends=('python-pytest>=7.1' 'python-hypothesis>=6.49.1')
depends=('python>=3.8')
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

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH=src pytest
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-0.5.0.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
