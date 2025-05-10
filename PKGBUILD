# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.57.1
_pkgver=4.198.0
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
sha512sums=('322ec51fce61bd355837ed0aea990b0b440f7ab9045fee810cd23bdbed2ff1b4126b968c3d260a8a9919795d3bc320fe35b2b1a48288d15d910aa6193d674032'
            '9bf4e6d3cb14cde411548cc370c0828cdc2eb1ecabc6650c1b41d289a5d71ad7e2dc7483a40e05d3b6273efba6be212f8991d1c61fe0717f91e141ff9842128d')

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
