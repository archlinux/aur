# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.23.0
_pkgver=4.136.0
pkgrel=4
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-*}.com/docs/api/openapi.yaml")
sha512sums=('1db1bba6bb256a7f75b7117113e14cad1838a8fa20585d78d799d1717530842553f74ffab1a97bd7e2fde1bfa847172e0f3459a07c7dfd59d420e9b46d1cafdd'
            '50bcfb434bb8ecf57c5afc09de6d93e2ab083807c0c6fca71105c6a14089dda571f6aaae04b7c540efc1aec3a9e751a4def931fb7963c98d758a00ba76a2847a')

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
  install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
