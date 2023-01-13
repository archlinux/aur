# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.28.1
_pkgver=4.142.3-patch1
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
license=('BSD')
depends=('python-requests' 
         'python-setuptools'
         'python-terminaltables' 
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-boto: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-*}.com/docs/api/openapi.yaml")
sha512sums=('92071c809b353454d18fdd8dd3c2ca00526f04b3732ee4c90a6e953dffc67bb56177fe4450e74bee67ca24e0b3e201353114fc2fd59abe078a78a9d2455f17b6'
            'e96f0d85598bcc411b9f984e67d763ee79d4e101a837dd2b5f625e20829199307b45ad5b44f5d78819cb05b6c09ab33be8f0a3e4115377f899635d3770cfeb36')

prepare() {
  cd "${pkgname}-${pkgver}"
  
  # Manually set version number - thanks @the-k
  sed -i "s/\(version=\)get_version()/\1\"${pkgver}\"/" setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m linodecli bake "../${pkgname}-${_pkgver}-openapi.yaml" --skip-config 
  cp data-3 linodecli/
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
