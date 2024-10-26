# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3
pkgver=3.10.3
pkgrel=2
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('libsodium' 'lib32-zlib')
makedepends=('unzip' 'wget' 'git' 'python' 'rust' 'curl' 'autoconf')
provides=('hush3')
conflicts=('hush3-bin')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('03bc50f02b4a1cafbf553cdb69b57da320225264ec586af0190d8deda0d3e91cf004f9a9ce88ffa9d601273465c890448f3c1e618c249c3704aad46aba8b02f5')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "$pkgname"
  ./build.sh -j$(nproc)
}

package() {
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install required scripts for hushd to function
  install -Dm755 "${srcdir}/$pkgname/src/hush-cli" "${pkgdir}/opt/$pkgname/hush-cli"
  install -Dm755 "${srcdir}/$pkgname/src/hushd" "${pkgdir}/opt/$pkgname/hushd"
  install -Dm755 "${srcdir}/$pkgname/src/hush-arrakis-chain" "${pkgdir}/opt/$pkgname/hush-arrakis-chain"
  install -Dm755 "${srcdir}/$pkgname/src/hush-tx" "${pkgdir}/opt/$pkgname/hush-tx"
  install -Dm755 "${srcdir}/$pkgname/src/dragonxd" "${pkgdir}/opt/$pkgname/dragonxd"
  install -Dm755 "${srcdir}/$pkgname/src/dragonx-cli" "${pkgdir}/opt/$pkgname/dragonx-cli"

  # install required sapling files and asmap.dat
  install -Dm644 "${srcdir}/$pkgname/sapling-output.params" "${pkgdir}/opt/$pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/$pkgname/sapling-spend.params" "${pkgdir}/opt/$pkgname/sapling-spend.params"
  install -Dm644 "${srcdir}/$pkgname/contrib/asmap/asmap.dat" "${pkgdir}/opt/$pkgname/asmap.dat"

  # install man pages
  install -Dm644 "${srcdir}/$pkgname/doc/man/hush-cli.1" "${pkgdir}/usr/share/man/man1/hush-cli.1"
  install -Dm644 "${srcdir}/$pkgname/doc/man/hushd.1" "${pkgdir}/usr/share/man/man1/hushd.1"
  install -Dm644 "${srcdir}/$pkgname/doc/man/hush-tx.1" "${pkgdir}/usr/share/man/man1/hush-tx.1"

  # install systemd service
  install -Dm644 "${srcdir}/$pkgname/doc/hushd.service" "${pkgdir}/usr/lib/systemd/user/hushd.service"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-arrakis-chain "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/dragonx-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/dragonxd "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/asmap.dat "${pkgdir}/usr/share/hush"
}
