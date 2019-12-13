# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.8.0
# commit of bitwarden/jslib
_jslibcommit='e16cb9b801bec1cf1744d8b48f39421ad37e1644'
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('nvm' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('b16089073e984da5c441b98c93cf733763805df439df49b40d11de9e718d51b9d64cc538a4c6cc29190c895e2b9ab519bc6d68e61efbf83949a37d5c248b1b27'
            '3555499b66968bbc96063f9bec5a4e7d68235360dea2da21c0cc10a55f7a24e1a899c036a7a244a18d4ab0bf16f49e6a7cbb6ce80bd94800b5e3a3fa68ef92b8')

prepare() {
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
  sed -i 's/"postinstall": "npm run sub:init",//' "${srcdir}/cli-${pkgver}/package.json"
}

build() {
  # Use nodejs 10 with NVM
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.16.0 && nvm use 10.16.0

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
