# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.16.0
_jslibcommit='f6d91e2d923a15c30eecf7aea8c477732ea18b0b'
_nodeversion='10.24.0'
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64' 'aarch64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('git' 'npm' 'nvm')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('37b747ca8cdc293819d74399e94b8f86c4a2e87bf4a8ddf1ce94f6953d6b7030177b8cccbdaf14707ace56d9f5d8bebe0ab09c5250f6d7d579395f8b05fa68a3'
            'ad62d40d224b2529479e6a7d5f04ab9284255517615eb732bf076195f7354ecc7c795d50733658d3040586efdeb295306fd7ddd6f97184798b2173adb1dd2cdf')

prepare() {
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  local npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  cd "${srcdir}/cli-${pkgver}/jslib"
  npm install
  cd "${srcdir}/cli-${pkgver}"
  npm install
  npm run build:prod
  npm run clean 
  if [ $CARCH == "aarch64" ]; then
    # TODO(libertylocked): pkg will compile nodejs from src and it takes 
    # ages because it can't find a prebuilt arm64 target
    npx pkg . --targets linux-arm64 --output ./dist/linux-arm64/bw --build
    ./dist/linux-arm64/bw completion --shell zsh > _bw
  else
    npm run package:lin
    ./dist/linux/bw completion --shell zsh > _bw
  fi


  # Restore node config from nvm
  npm config set prefix ${npm_prefix}
  nvm unalias default
}

package() {
  cd "${srcdir}/cli-${pkgver}"

  # install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  # cp -a build/. "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  if [ $CARCH == "aarch64" ]; then
    install -Dm755 ./dist/linux-arm64/bw "${pkgdir}/usr/bin/bw"
  else
    install -Dm755 ./dist/linux/bw "${pkgdir}/usr/bin/bw"
  fi

  # package zsh completions
  install -Dm644 -t "${pkgdir}/usr/share/zsh/site-functions" "${srcdir}/cli-${pkgver}/_bw"
}
