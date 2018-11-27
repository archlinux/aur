# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.6.0
# commit of bitwarden/jslib
_jslibcommit='64a6015a67a8110cd8a4ef897e1338c71c4b6b49'
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        'bw.sh')
sha512sums=('d29d714a713a5f6367a0c8ab12d1c4e493f6883d242ca404ffaf6a992a861192a75e53910eaac9820a3f85d28657e34384ef602efbef2cca26c140e64a459b33'
            'fc9590e3e62128799231742aa9d6ef5c716e2eeb3db30326f5b7e00a1345e0effc7953fc824599374c7d16d29cd9545789854a33dccb2b7b36f0a735ee6b4e8d'
            '71729c0ee95429ab03fa586de6bbf8ebad29d6d5544775564bb35eaa68cc4a915007db54b5928e99234bfe7828491829a5d32750f641056a0b68e05aa842f9ee')

prepare() {
  # make a symlink of jslib in cli since the submodule is missing in sourceball
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
}

build() {
  cd "${srcdir}/cli-${pkgver}"
  npm install
  npm run build:prod
}

package() {
  cd "${srcdir}/cli-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a build/. "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/bw.sh" "${pkgdir}/usr/bin/bw"
}
