# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="flatlatex"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.15.r2.g03975f3
pkgrel=1
pkgdesc="A LaTeX math converter to unicode text"
arch=('any')
url="https://github.com/jb-leger/${_name}"
license=('BSD-2-Clause')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
checkdepends=('python-pytest')
depends=('python' 'python-regex')
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
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENCE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
