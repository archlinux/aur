# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.7.0
# commit of bitwarden/jslib
_jslibcommit='af4e01c238b88ac296edfbf300a180e956da7d4b'
pkgrel=2
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("bitwarden-cli-${pkgver}.tar.gz::https://github.com/bitwarden/cli/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        'bw.sh')
sha512sums=('0ceec6f5df506f6b93d2ac20551d9722c3c56c66940d14e7b2b7e53254c8a9af204bb67b2e3ed78109e31402d6b79766dd32ed2dba767822953cf3c0b19e5da3'
            '8697662008765e101adba8226a02f245f80aeb7473cc3b915009c7cdba0d365aaffaac4032be6991c145e59b99e8d589baaf8566a6fe91a827ed85539937821f'
            'c1a89a9573326bd42de4c218429209e4b2e3b966f275b4e173c477e1080e0fd107d9791c0de968ed6b9efbf30ff81ffba79f5c32378d685de82b513516385d3a')

prepare() {
  # make a symlink of jslib in cli since the submodule is missing in sourceball
  rmdir "${srcdir}/cli-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/cli-${pkgver}/jslib"
}

build() {
  cd "${srcdir}/cli-${pkgver}"
  npm install
  npm run build:prod
}

package() {
  cd "${srcdir}/cli-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a build/. "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/bw.sh" "${pkgdir}/usr/bin/bw"
}
