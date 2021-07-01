# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.17.0
_jslibcommit='55a9ea9e18151e33498117d065145272c3d04987'
_nodeversion='14.17.1'
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
sha512sums=('ebf15c0eff6bd838b5eb1ad4c484875d172a04f48e94e72ef014af316706fc2cc672887c01634a173e60410cce352fd505eef0ec8ee0af933c6437f0f19ed43f'
            '6529d6909d4d92d26272f021511552a27ba8fb00b92e18a7efb7142b4b6e1e8473f0609ea1ede570c21e05d323d31613463630da1198878e3e624f0dca5f2320')

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
