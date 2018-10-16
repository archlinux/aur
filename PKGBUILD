# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.4.0
# commit of bitwarden/jslib
_jslibcommit='2f6426deb470b71838b51c52587929ac64d428bf'
pkgrel=1
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
sha512sums=('7571fda97f891576d812bbf5a985a6c03438ac2fd758df30eeecc7fff79500b88e5b37af804d397f176790f7b7eed0a88ec0ebaa2d4b94e5491f5761c82c91e8'
            'd502a4cd3858a076275290369d0cce492ff0af5a1bc476002edb4b65523df605f2ce4e88411c09eb016b339f0a653aa2043783bd77b6be9082cc611eb8104f21'
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
