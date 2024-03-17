# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.48.3
_pkgver=4.173.0
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-*}.com/docs/api/openapi.yaml")
sha512sums=('06785bed9cbfc726da8d86b558f90f58a673bf2ed9da573627e4f4dea1b25f9d154d146bef3fee891b8c9ea3727c03547284fb350a430d65984d10a96e7bfcb8'
            'b0b0175f714cbbf9e55a20931c76a427dad762f6a70e5426f691f1d1c5d46e159731696b217034dbc7b57e90ecce63709c968b4c0af8bb161b0279ab2a76c3ca')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Manually set version number - thanks @the-k
  sed -i "s/\(version=\)version/\1\"${pkgver}\"/" setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python \
    -m linodecli bake "../${pkgname}-${_pkgver}-openapi.yaml" \
    --skip-config 
  cp data-3 linodecli/
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
