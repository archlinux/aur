# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="textual-autocomplete"
pkgname="python-${_name}"
pkgver=3.0.0a9
pkgrel=2
pkgdesc="Easily add autocomplete dropdowns to your Textual apps"
arch=('any')
url="https://github.com/darrenburns/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
depends=('python>=3.8' 'python-textual>=0.58' 'python-rich'
         'python-typing_extensions>=4.5')
_pkgsrc="${_name//-/_}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('b5f3e3148b793f172afe643a5b2188c5ec14fcb42b639b98b23131c27e52de85')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
