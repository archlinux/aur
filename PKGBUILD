# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.13.2
_jslibcommit='85faee21eec7602eecc3a5368be4c8fb7bab1e67'
_nodeversion='10.20.1'
pkgrel=2
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://github.com/bitwarden/cli"
license=('GPL3')
makedepends=('nodejs' 'nvm' 'npm' 'git')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz")
sha512sums=('5fa28716c5e10f5df0983a13ccf162c2f035d351e590f6d4580c115ca1c08b9d3f71bfced085521afc6885a78276ef108d5fe185e89674076c3265f21a0e7b58'
            '50d8f222a208252630e47e365325a5c0a9875c9fb52415f380749951773c76159120355f3579a18ccc8582fbe07588f5afcd62eedc20d17ff4247ba28ef8c1cd')

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
