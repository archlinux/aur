# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.56.3
_pkgver=4.197.1
pkgrel=2
pkgdesc="Linode API wrapper"
arch=('any')
url="https://techdocs.akamai.com/cloud-computing/docs/cli"
license=('BSD-3-Clause')
depends=('python-openapi3'
         'python-requests' 
         'python-rich'
         'python-setuptools'
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-boto: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname%%-*}-api-docs-${_pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname%%-*}-api-docs/archive/refs/tags/v${_pkgver}.tar.gz")
noextract=("${pkgname%%-*}-api-docs-${_pkgver}.tar.gz")
sha512sums=('f2d173671405dbbbaac1abf82dfe7ffaace5c49c7992dfb2177a2b32fca0350f85133ce091d3234db2e3793bb13090c76a0c6a6ac698c2fa24eccc87eb00242f'
            'ebe971def6727a0a23adb9d958f5fd298b09a774d33c0c85ab76018e58c4d80676464cbc2d864948b610598c0acf2f77ca4357312108d788bdc1b854d5da0382')

prepare() {
  # Extract API spec
  bsdtar -zvxf "${pkgname%%-*}-api-docs-${_pkgver}.tar.gz" "${pkgname%%-*}-api-docs-${_pkgver}/openapi.json"
  mv "${pkgname%%-*}-api-docs-${_pkgver}/openapi.json" "${pkgname}-${pkgver}/openapi.json"

  # Fix version number
  cd "${pkgname}-${pkgver}"
  sed -i "s/\(__version__ = \)\".*\"/\1\"${pkgver}\"/" linodecli/version.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m linodecli bake openapi.json --skip-config
  cp data-3 linodecli/
  python -m linodecli completion bash > "${pkgname}.sh"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
