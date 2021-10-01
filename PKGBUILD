# Maintainer: Andrew Fischer <andrew at apastron dot co>
pkgname=multichain
pkgver=2.1
pkgrel=1
pkgdesc="MultiChain open source platform for private blockchains"
arch=('x86_64')
url="https://github.com/MultiChain/multichain"
license=('GPLv3')
depends=('db4.8' 'boost' 'openssl')
provides=('multichain')
source=("https://github.com/MultiChain/multichain/archive/${pkgver}.x-release.tar.gz" "multichain-boost-openssl.patch")
sha256sums=('883e496eeb5a47f28f6f389a98d6905c14bbde13575bc3b2b03d1cc75089d454' '3837109b8654bd498ed6ddb9a43032cd8fa6343ac9fa4cb9506a0d8ea4953bc7')

prepare() {
  cd "${srcdir}/multichain-${pkgver}.x-release"
  # Multichain uses an out of date boost and openssl, patch to fix
  patch -p1 < ${srcdir}/multichain-boost-openssl.patch
}

build() {
  cd "${srcdir}/multichain-${pkgver}.x-release"
  # perform the recommended v8build steps
  set MUTICHAIN_HOME=$(pwd)
  mkdir v8build
  pushd v8build
  curl -LO https://github.com/MultiChain/multichain-binaries/raw/master/linux-v8.tar.gz
  tar xzf linux-v8.tar.gz
  popd
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/multichain-${pkgver}.x-release"
  make DESTDIR="${pkgdir}" install
}
