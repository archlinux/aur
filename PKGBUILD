# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="chafapy"
pkgname="python-${_name}"
pkgver=1.1.2
pkgrel=2
pkgdesc="Python bindings for Chafa. Visualize images with text in Python."
arch=('any')
url="https://github.com/guardkenzie/chafa.py"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-hatchling')
checkdepends=('python-pytest' 'python-pillow' 'python-numpy' 'python-wand')
depends=('python>=3.8' 'chafa')
_pkgsrc="chafa.py-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('547068d301274262ea1e6cb4f8cddc5b714a142c684fcd27f3aefa70ad95aea1')

prepare() {
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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/chafa.py-${pkgver}.dist-info/licenses/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -s "${pkgdir}${site_packages}/chafa.py-${pkgver}.dist-info/licenses/COPYING.LESSER" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER"
}
