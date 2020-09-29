# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.12.1
_jslibcommit='f30d6f8027055507abfdefd1eeb5d9aab25cc601'
_nodeversion='10.20.1'
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('nvm' 'npm' 'git')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('51788d5c2ac3184cf203df2404e6447bc4a1141a330a4fd908278a159e29817c66902a4b8119aaada83e87de4d456478840ef0f61961609eb51e79c882b5dd3a'
            '1801f91af9a52f0d1364137c40bc2382cc4b683206b73c6effc26ad81c547341b156713617f7c692402b77b8861cfb60ef6b2c3385d5f31a006ac4d53e6e0389')

prepare() {
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  cd "${srcdir}/cli-${pkgver}/jslib"
  npm install
  cd "${srcdir}/cli-${pkgver}"
  npm install
  # Due to some jsdom dependency complications we'll have to use bundled nodejs
  # in the final build for now.
  npm run dist:lin

  # create zsh completions
  ./dist/linux/bw completion --shell zsh > _bw

  # Restore node config from nvm
  npm config set prefix ${_npm_prefix}
  nvm unalias default
}

package() {
  cd "${srcdir}/cli-${pkgver}"

  # install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  # cp -a build/. "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 ./dist/linux/bw "${pkgdir}/usr/bin/bw"

  # package zsh completions
  install -Dm644 -t "${pkgdir}/usr/share/zsh/site-functions" "${srcdir}/cli-${pkgver}/_bw"
}
