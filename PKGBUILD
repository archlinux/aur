# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.27.2
_pkgver=4.141.0
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
sha512sums=('0df6f34a9bc0fac2a71013192156db035e98709caab53fb107bbc75473930f66ce428fc8755231153f19cc801f7bb93da27338c43205adb412e615e6297e8f41'
            'b8d10eb1934074367649524d29b1f54b2e817199bfdeac3dc02cefb8941f4c0299c1c1fb30e350666d3c541a32eafd75d7e9108e9d9a28b6baa7cb4efc5ca16b')

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
