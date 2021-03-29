# Maintainer: Andrew Fischer <andrew at apastron dot co>
pkgname=multichain-alpha
pkgver=2.0
pkgrel=5
pkgdesc="MultiChain open source platform for private blockchains - version 2.0 alpha"
arch=('x86_64')
url="https://github.com/MultiChain/multichain"
license=('GPLv3')
depends=('db4.8' 'boost' 'openssl')
provides=('multichain-alpha')
source=("https://github.com/MultiChain/multichain/archive/${pkgver}-release.tar.gz" "multichain-boost-openssl.patch")
md5sums=('1c7f36172ffc0a48cf4c4f8740c2efa9' 'f3655179f4b1778afb367801aca87ae0')

prepare() {
  cd "${srcdir}/multichain-${pkgver}-release"
  # Multichain uses an out of date boost and openssl, patch to fix
  patch -p1 < ${srcdir}/multichain-boost-openssl.patch
}

build() {
  cd "${srcdir}/multichain-${pkgver}-release"
  # perform the recommended v8build steps
  set MUTICHAIN_HOME=$(pwd)
  mkdir v8build
  pushd v8build
  curl -LO https://github.com/MultiChain/multichain-binaries/raw/master/linux-v8.tar.gz
  tar xzvj linux-v8.tar.gz
  popd
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/multichain-${pkgver}-release"
  make DESTDIR="${pkgdir}" install
}
