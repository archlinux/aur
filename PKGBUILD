# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="textual-paint"
pkgver=0.4.0
pkgrel=1
pkgdesc="MS Paint in your terminal"
arch=('any')
url="https://github.com/1j01/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pyfakefs')
depends=('python' 'python-pillow' 'python-pyxdg' 'python-rich' 'python-stransi'
         'python-textual' 'python-pyperclip' 'python-pyfiglet' 'python-gobject'
         'python-psutil' 'python-typing_extensions' 'python-ochre' 'glib2')
optdepends=('python-watchdog: for --restart-on-changes support')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('64c95a833cd5cebfcfbab6646f7a1018ce63551fbfe2f2b675ad48e82dd4e31e')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check () {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/textual_paint-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
