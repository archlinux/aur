# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.69.0
_pkgver=release-20260917
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://techdocs.akamai.com/cloud-computing/docs/cli"
license=('BSD-3-Clause'
         'Apache-2.0')
depends=('python-openapi3'
         'python-requests' 
         'python-rich'
         'python-setuptools'
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-boto3: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname%%-*}-api-openapi/archive/refs/tags/${_pkgver}.tar.gz")
noextract=("${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz")
sha512sums=('3adae2e3f195476b39e717935b3c59c3264e72bc384bec6fc281f8e037a59f35c4869fef59f22b55550c24a467b392f3b857f44c43078f728e517d71bf3ad2b7'
            'b95507d04fdf292091180ec0b053a4b9a0d9a5defc651e2540760f58ad76978825eb3b00915a7b2765de28f3e490bf3651d5bf5d34821f3a01d59763f869b83b')

prepare() {
  # Extract API spec
  bsdtar -zvxf "${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz" "${pkgname%%-*}-api-openapi-${_pkgver}/openapi.json"
  mv "${pkgname%%-*}-api-openapi-${_pkgver}/openapi.json" "${pkgname}-${pkgver}/openapi.json"

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
