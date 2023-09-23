# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.44.1
_pkgver=4.163.0
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
license=('BSD')
depends=('python-openapi3'
         'python-requests' 
         'python-setuptools'
         'python-rich' 
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-boto: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-*}.com/docs/api/openapi.yaml")
sha512sums=('c63a59d1e1f4a03182d7442cb545727840b4b067e99f0da891f9ea6671b23b297e7b6b5f2709a4a0a71d7124daba51f88aed19056a22b31c8ce2771b11219afa'
            'fdc73e9fa2c3bac86899b1745c9afd51855ab05be844dae2dbf811905c5dccecd96a5f18c67997647fb5f9fc5003b811542e6a9e95503ad3cfa47e3dcf454e9a')

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
