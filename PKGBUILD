# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.48.1
_pkgver=4.170.2
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
license=('BSD')
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
sha512sums=('8c2cc3ef94eedf6ffc83aaabde815f0805543cd5a490420d0cf62e18bc42455f9f62175c9982affc22624efab52637c114511fc9d8dbdcdf13d5304e05cf3979'
            '633b259a0e7a919d7958142bdeda2f897f1952ddbe86ec957e3a798d803b31aafa908176bf1b467fe541b1348bbc454d0d2bc4991c562082031deddca9cca692')

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
