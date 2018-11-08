# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.5.0
# commit of bitwarden/jslib
_jslibcommit='f355840f3cf4af0279c9a078e0c14729a701f37a'
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
sha512sums=('5de42d0798de3236f339f54cdffd91779c9d1fa53460a35c787a4c05f007963540822d2fdaf871d8a14e29083d9ea24350f9dad1af8ab2a5a4ec2997befcb529'
            '0049147b8e0209f0b6b5268f7118efa894020613218c6165f550a796194b76aaa78fc10f869f3d008d15d30316ed5c968e48b624f854649d9dc378cb72a97284'
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
