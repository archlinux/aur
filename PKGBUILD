# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.59.0
_pkgver=4.200.0
pkgrel=1
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
sha512sums=('fa3cb1fd9035e788415d74f5802dbe1e58bcf799cbb2a1e6f28bbca284e140aa1fe77162b59a4c675e648f41ccb7baacab1cc11a16d4ea867e0a5b595d92eeb7'
            'e2f4ca5d6fe9cb6af66d196a6addc1d9f6eef031a66fdeb945934fb820228b79d5f44b66d85a3288f2dc5e255d58478884b6bab87bfa2953bf3728208ed50977')

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
