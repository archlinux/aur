# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.19.0
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-cli}/${pkgname}"
license=('BSD')
depends=('python-requests' 
         'python-terminaltables' 
         'python-yaml')
optdepends=('python-boto: Object Storage plugin')
makedepends=('python-setuptools'
             'python-wheel')
replaces=('linode-cli-dev')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-cli}/${pkgname}/archive/${pkgver}.tar.gz"
        no-python2.patch)
sha512sums=('1ddeedcfdfad816541e16ca7b78410f09c64b92baf8846a164dc788a3cb006ed768c1d55f7458a987c63a8e1ef4a502ac1ce3ec424cc69d918a52c490bc2fea7'
            'ab743f3909aab35012dfe0524ec508da65ee64b54731d55eeb3655c41f6eedac10bd2791507e9754e50962376243708727e069a8b791474ee38f018e40c8b962')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --strip=1 --input="${srcdir}/no-python2.patch"

  # Manually set version number - thanks @the-k
  sed -i "s/\(version=\)get_version()/\1\"${pkgver}\"/" setup.py
}

build() {
  cd "${pkgname}-${pkgver}" 
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
