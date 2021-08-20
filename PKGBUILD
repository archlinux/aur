# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.18.0
_jslibcommit='0a2ff12bedd55f5982fb8fe9102c4f20522f72e1'
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
sha512sums=('333c3c4d6b5311b256e34988a201f317fea6aa2d8c7186d80f7d0a1c68e3b40a957bcad66f97e2ca795420ced030390794d14ea173f9c9372d8886bc45a8dd95'
            '686489c2a5d3847dc6e8c25bd7fb878fc82243cd20b83489ba89f129358c4715b5007d6526cd392383a9ddb84c57910b19fc6a3773fe56694e194c990c05dbd1')

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
