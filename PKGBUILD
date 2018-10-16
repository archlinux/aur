# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.3.0
# commit of bitwarden/jslib
_jslibcommit='1f9fbe43d7a78349e6fe994fa70d9b773af5c0f9'
pkgrel=4
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-source.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-source.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        'bw.sh')
sha512sums=('64767df288256d9d5727d483d6ac546ea4a7443033588eb9b38a5c1a10731545354028a955138984af23c5b377eb8ab751e273b456edb5c0906701a0360e8524'
            '4a31086ec86119ac74415dc0cabdbc2f332e0bf614d24d398fa622e7aa1f9cb3f679afc473b6bc8f783d95ae6ce070137f94320aa82cc7b9caccdb26e82e024d'
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
