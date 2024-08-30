# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="chafapy"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=1.1.2.r49.gcc1c505
pkgrel=2
pkgdesc="Python bindings for Chafa. Visualize images with text in Python."
arch=('any')
url="https://github.com/guardkenzie/chafa.py"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-hatchling')
checkdepends=('python-pytest' 'python-pillow' 'python-numpy' 'python-wand')
depends=('python>=3.8' 'chafa')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="chafa.py"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx

  cd "${srcdir}/${_pkgsrc}"
  cp "/usr/lib/libchafa.so" "libs/linux/libchafa.so"
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

  # install -d "${pkgdir}/${site_packages}/chafa/libs"
  rm -f "${pkgdir}/${site_packages}/chafa/libs/libchafa.so"
  ln -s "/usr/lib/libchafa.so" \
    "${pkgdir}/${site_packages}/chafa/libs/libchafa.so"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/chafa.py-${pkgver%%.r*}.dist-info/licenses/COPYING" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  ln -s "${site_packages}/chafa.py-${pkgver%%.r*}.dist-info/licenses/COPYING.LESSER" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.LESSER"
}
