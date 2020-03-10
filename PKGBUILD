# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.9.0
# commit of bitwarden/jslib
_jslibcommit='44b86f5dd028271059b70a00d7878fbb1a06023f'
_nodeversion='10.19.0'
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
sha512sums=('304ebe05a035848251cfc339b36eb9152f7d72628f4d7898e95525b351653e784f2f60bdb4659bca84162b098703ce1e701d5d6b6da6e90ad0eb560fb93d2694'
            '3b0f10311a2032fedf6c36a7271180abe6578f945dccfde476c06ec311d235cf5a9d2bfed4b07b3bb2637ddd980961ef4d588e06b20f29d8a4489ae8f6758000')

prepare() {
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
  sed -i 's/"postinstall": "npm run sub:init",//' "${srcdir}/cli-${pkgver}/package.json"
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
  # Due to some jsdom dependency complications we'll have to use bundled nodejs in the final 
  # build for now.
  npm run dist:lin

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
}
