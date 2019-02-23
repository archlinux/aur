# Maintainer: Daniel J. B. Clarke <u8sand at gmail dot com>

pkgname=jupyter-nodejs-babel-git
_pkgname=jupyter-nodejs-babel
_install="/usr/share/jupyter/kernels/nodejs-babel/"
pkgver=1.1.0
pkgrel=1
license=("MIT")
pkgdesc="A node.js kernel for jupyter/ipython with latest babel"
options=(debug !strip)
makedepends=('npm' 'nodejs')
depends=('jupyter' 'npm')
arch=('x86_64')
url='https://github.com/notablemind/jupyter-nodejs'
source=("install.patch"
        "${pkgname%-*}::git+https://github.com/notablemind/jupyter-nodejs.git")
sha256sums=('1cc912a860d06f40699a7af38034475ff1835b27acb149efbad85840d6d52a12'
            'SKIP')
provides=("jupyter-nodejs-babel")
conflicts=("jupyter-nodejs-babel")

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
