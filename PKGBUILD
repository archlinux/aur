# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="posting"
pkgver=1.10.1
pkgrel=1
pkgdesc="The modern API client that lives in your terminal"
arch=('any')
url="https://github.com/darrenburns/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-hatchling')
# checkdepends=('python-pytest')
depends=('python' 'python-click' 'python-xdg-base-dirs' 'python-httpx'
         'python-click-default-group' 'python-pyperclip' 'python-pydantic'
         'python-yaml' 'python-pydantic-settings' 'python-dotenv' 'python-rich'
         'python-textual' 'python-typing_extensions' 'python-textual-autocomplete')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('24a42658d374bcb68fe274a7a073ff85609312fe10b9f3deb6b1937f6bacd463')

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
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
