# Maintainer: Daniel J. B. Clarke <u8sand at gmail dot com>

pkgname=jupyter-nodejs-git
_pkgname=jupyter-nodejs
_install="/usr/share/jupyter/kernels/nodejs/"
pkgver=1.1.0
pkgrel=1
license=("MIT")
pkgdesc="A node.js kernel for jupyter/ipython"
options=(debug !strip)
makedepends=('npm' 'nodejs')
depends=('jupyter' 'nodejs')
arch=('x86_64')
url='https://github.com/notablemind/jupyter-nodejs'
source=("install.patch"
        "${pkgname%-*}::git+https://github.com/notablemind/jupyter-nodejs.git")
sha256sums=('2e62a325d4abd0a54c979f5592a9bb3debd966abaea85531946cbdccdd87283c'
            'SKIP')
provides=("jupyter-nodejs")
conflicts=("jupyter-nodejs")

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "${srcdir}/install.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install
  npm run build
  npm run build-ext
}

package() {
  cd "${srcdir}/${_pkgname}"

  INSTALL_PATH="${pkgdir}/${_install}" \
  RUNTIME_PATH="${_install}" \
    node install.js

  install -dm755 "${pkgdir}/${_install}"
  cp -R node_modules build "${pkgdir}/${_install}"
  install -Dm644 config.js LICENSE package.json "${pkgdir}/${_install}"
}
