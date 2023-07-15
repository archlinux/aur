# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.41.2
_pkgver=4.158.1
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
license=('BSD')
depends=('python-requests' 
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
sha512sums=('18944cd82cd049dda9da9db97dd74a4d4c863e219c333e6ff3c26d51c6b5316541b17dd31d30d6ce76612b4dcf5a925481086eafc16108dbb1b628b68e313a63'
            '1d8ff1c8342977c340d701dc3acbc50685e699b09d7da5d6d710afb7738f9fe63cac72384612f43dbffc0799467f571e5f05ae37b99d905c93359a8edc6a4a5a')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Manually set version number - thanks @the-k
  sed -i "s/\(version=\)version/\1\"${pkgver}\"/" setup.py
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
