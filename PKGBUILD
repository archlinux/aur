# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.15.0
_jslibcommit='f80e89465ffc004705d2941301c0ffb6bfd71d1a'
_nodeversion='10.24.0'
pkgrel=2
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64' 'aarch64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('git' 'npm' 'nvm')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('f579f619f5b18fe439b1e88d01a7be081616f954661c64d6273023573439e2bb8c6e504496e17b1071189a476c7b07a5d2c4778657912933014deea9ade9f438'
            'e0a80a2088af56b68494356856101574b9c9aef3cad9ef384cd61ee45eb3cb398346604c72cf8ea6522f6747a08ab25d0590d9d17e4116bcdc6726864f95b506')

prepare() {
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"

  # XXX: Fix cannot find module sendAccessResponse
  # Remove this hack when PR is merged: https://github.com/bitwarden/cli/pull/253
  mv ${srcdir}/cli-${pkgver}/src/models/response/SendAccessResponse.ts \
     ${srcdir}/cli-${pkgver}/src/models/response/sendAccessResponse.ts
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
  else
    npm run package:lin
  fi

  # create zsh completions
  ./dist/linux/bw completion --shell zsh > _bw

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
