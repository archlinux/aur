# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.13.3
_jslibcommit='abb54f007305eabd77996623dd20cbe45345e82a'
_nodeversion='10.20.1'
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('nodejs' 'nvm' 'npm' 'git')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('95cf8783035420510a2ce4ed8d0b5066f2fd400e763498a3f4449341c99571bd4f8715248f73b53a0669e19f6742a61d223fe17e61638a85a8c5000a3a9c472f'
            '3d27f44477a5da81bbd217b1c13a756b9174852b3b2f1bb45601a1374ae9c548bde996766608246403dc8aba73422972a0b5655c7c18aeddd869b3992feaf07e')

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

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
