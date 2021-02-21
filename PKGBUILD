# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3
pkgver=3.6.1
pkgrel=2
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('unzip' 'wget' 'git' 'python' 'rust' 'curl' 'autoconf=2.69')
conflicts=('hush3-bin')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('09c889e11f7e831cb316879a38cb58c4ea047680cb0f1c7956d3847670299b3e')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "$pkgname"
  ./zcutil/build.sh -j$(nproc)
}

package() {
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required scripts for hushd to function
  install -Dm755 "${srcdir}/$pkgname/src/hush-cli" "${pkgdir}/opt/$pkgname/hush-cli"
  install -Dm755 "${srcdir}/$pkgname/src/hushd" "${pkgdir}/opt/$pkgname/hushd"
  install -Dm755 "${srcdir}/$pkgname/src/hush-smart-chain" "${pkgdir}/opt/$pkgname/hush-smart-chain"
  install -Dm755 "${srcdir}/$pkgname/src/hush-tx" "${pkgdir}/opt/$pkgname/hush-tx"
  install -Dm755 "${srcdir}/$pkgname/src/hushd" "${pkgdir}/opt/$pkgname/hushd"

  # rename KMD binaries used as to not overwrite any installed
  install -Dm755 "${srcdir}/$pkgname/src/komodo-cli" "${pkgdir}/opt/$pkgname/hush-komodo-cli"
  install -Dm755 "${srcdir}/$pkgname/src/komodod" "${pkgdir}/opt/$pkgname/hush-komodod"
  install -Dm755 "${srcdir}/$pkgname/src/komodo-tx" "${pkgdir}/opt/$pkgname/hush-komodo-tx"

  # install required sapling files
  install -Dm644 "${srcdir}/$pkgname/sapling-output.params" "${pkgdir}/opt/$pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/$pkgname/sapling-spend.params" "${pkgdir}/opt/$pkgname/sapling-spend.params"

  # install man pages
  install -Dm644 "${srcdir}/$pkgname/doc/man/hush-cli.1" "${pkgdir}/usr/share/man/man1/hush-cli.1"
  install -Dm644 "${srcdir}/$pkgname/doc/man/hushd.1" "${pkgdir}/usr/share/man/man1/hushd.1"
  install -Dm644 "${srcdir}/$pkgname/doc/man/hush-tx.1" "${pkgdir}/usr/share/man/man1/hush-tx.1"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodo-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodod "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodo-tx "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
}
