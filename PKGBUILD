# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3
pkgver=3.10.5
pkgrel=2
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('libsodium' 'lib32-zlib')
makedepends=('unzip' 'wget' 'git' 'python' 'rust' 'curl' 'autoconf')
provides=('hush3')
conflicts=('hush3-bin')
source=(git+$url.git?#tag=v$pkgver)
sha512sums=(SKIP)

build() {
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

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/asmap.dat "${pkgdir}/usr/share/hush"
}
