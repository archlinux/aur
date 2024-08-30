# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="n2"
_pkgname="n2-docs"
pkgname="${_pkgname}-git"
pkgver=0.1.7.r27.g20b02de
pkgrel=2
pkgdesc="HTML documentation for N2"
arch=('any')
url="https://github.com/kakao/${_name}"
license=('Apache-2.0')
makedepends=('git' 'doxygen' 'python-sphinx' 'python-breathe' 'python-exhale'
             'python-sphinx_rtd_theme' 'python-sphinxcontrib-napoleon'
             'python-n2')
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
  cd "${srcdir}/${_pkgsrc}"
  sed -i "s|image:: docs|image:: /${PWD}/docs|g" README.rst
}

build() {
  cd "${srcdir}/${_pkgsrc}/docs"
  make html
}

package () {
  cd "${srcdir}/${_pkgsrc}/docs/_build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
}
