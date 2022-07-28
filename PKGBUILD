# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.22.0
pkgrel=1
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
        "${pkgname}-${pkgver}-openapi.yaml::https://www.${pkgname%%-cli}.com/docs/api/openapi.yaml")
sha512sums=('f24708b657f7f6d0289f190823b34a357f793a2a141aafd9e91de398b494f88b2f72f278e368d5180e97b5176d368d94b4cb75eaaa29ba808a8dd4bad6f8437f'
            'e5ce50a31788f091c30bc05dab03572162f1c3f56171df4d17659d9c5407b7a0429256551a79f686e2eeb2fce11e4d4fb3e244ee024797d687d72dd2092a4e47')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Manually set version number - thanks @the-k
  sed -i "s/\(version=\)get_version()/\1\"${pkgver}\"/" setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m linodecli bake ../"${pkgname}-${pkgver}-openapi.yaml" --skip-config 
  cp data-3 linodecli/
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
