# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="tftui"
pkgname="python-${_name}"
pkgver=0.13.5
pkgrel=1
pkgdesc="A powerful textual UI that empowers users to effortlessly view and interact with their Terraform state"
arch=('any')
url="https://github.com/idoavrah/terraform-tui"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
depends=('python>=3.9' 'python-textual>=0.44.1' 'python-posthog>=3.1.0'
         'python-requests>=2.31.0' 'python-pyperclip>=1.8.2' 'python-rich')
_pkgsrc="terraform-tui-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a9e4121b956f6cebbe7fe9783116b9e5e61c968571abdfdf943243bf41902013')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -exec sed -i 's/0\.13\.4/0\.13\.5/g' {} +
}

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
