# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.47.1
_pkgver=4.169.1
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
sha512sums=('325021cfb9f70c2f26fb15e41ce41fa5cc1d25840f64bb6755b809c5e1734b13d0f64665df95548d05dd9121d8abc5df5140b4512dfa5745317d9ac938ac719d'
            '17a3885fd853bce0e544b4af084fb41b8ccabb4dda33624386a8d2fcef70f356d7d693a8264e02793d5f52f0b8d14d1f835207ad0cc6cadce34b72e1db120a82')

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
