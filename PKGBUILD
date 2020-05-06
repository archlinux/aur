# Maintainer:  Jah Way <jahway603 at protonmail dot com>

pkgname=hush3
pkgver=3.3.2
pkgrel=2
pkgdesc='HUSH (fork of KMD) full node that supports zaddrs'
url='http://github.com/MyHush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('unzip' 'wget' 'git' 'python' 'pkgconf' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b1c8e511468a0c74b0237331c70a9edc2c4dfb281ba0fc6e1cc635185628eb1a')

build() {
  tar xzvf $pkgname-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  #./zcutil/build.sh -j$(nproc)
  ./zcutil/build.sh
}

package() {
  cd "$pkgname-$pkgver/src"
  
  # create the necessary directory structure
  install -d "${pkgdir}/opt/${pkgname}"
  
  # install shell scripts
  install -m 755 hush-cli "${pkgdir}/opt/${pkgname}"
  install -m 755 hushd "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-smart-chain "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-tx "${pkgdir}/opt/${pkgname}"
  
  # install shared libraries
  install -m 755 komodo-cli "${pkgdir}/opt/${pkgname}"
  install -m 755 komodod "${pkgdir}/opt/${pkgname}"
  install -m 755 komodo-tx "${pkgdir}/opt/${pkgname}"
 
  # install required sapling files
  cd ..
  install -m 644 sapling-output.params "${pkgdir}/opt/${pkgname}"
  install -m 644 sapling-spend.params "${pkgdir}/opt/${pkgname}"
 
  # create symlink in /usr/bin to hushd and others
  cd /usr/bin
  sudo ln -s /opt/$pkgname/hushd
  sudo ln -s /opt/$pkgname/komodod
  sudo ln -s /opt/$pkgname/komodo-cli
}
