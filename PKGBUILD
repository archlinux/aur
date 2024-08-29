# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="textual-paint"
pkgver=0.4.0
pkgrel=2
pkgdesc="MS Paint in your terminal"
arch=('any')
url="https://github.com/1j01/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pyfakefs'
#               'python-pytest-textual-snapshot')
depends=('python' 'python-pillow' 'python-pyfiglet' 'python-pyperclip'
         'python-rich' 'python-stransi' 'python-textual' 'python-psutil'
         'python-typing_extensions' 'python-ochre' 'glib2')
optdepends=('python-pyxdg: for wallpaper setting'
            'python-gobject: for wallpaper setting')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}_fix_pillow10.patch")
sha256sums=('64c95a833cd5cebfcfbab6646f7a1018ce63551fbfe2f2b675ad48e82dd4e31e'
            '4f578fc95b0890eb7da0005e94df1f6582b1cf41ea8ce703cbe0cb8f2c76f4e5')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  # sed -i 's/stylize_before/stylize/g' src/textual_paint/enhanced_directory_tree.py
}

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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/textual_paint-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
