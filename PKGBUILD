# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.7.4
# commit of bitwarden/jslib
_jslibcommit='e979dd4f12634a72ee50989d7dd6a6852fa149fa'
pkgrel=2
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
sha512sums=('4aeb651b6a3bc00ad41581ed15c35d910b73d1ad6fdd9ddc5a629c6de230b12d7068efa496e9c7ed6d73f9a181ade208e3fe1f135ae07905cda0f5bdbd1fe943'
            '16ace4c248b4282522b127c8aa3c3d4bd41da84a06584a2a38092f43460713e1ddfb57a447aeeb918ae1133ac394ebe1477ce620f0e1cd0ffdfdca2e0be3f25f')

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
