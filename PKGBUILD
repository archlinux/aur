# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.23.0
_pkgver=4.136.0
pkgrel=3
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-cli}/${pkgname}"
license=('BSD')
depends=('python-requests' 
         'python-terminaltables' 
         'python-yaml')
optdepends=('python-boto: Object Storage plugin')
makedepends=('python-setuptools')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-cli}/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-cli}.com/docs/api/openapi.yaml")
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
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
