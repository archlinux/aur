# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3
pkgver=3.10.2
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('unzip' 'wget' 'git' 'python' 'rust' 'curl' 'autoconf')
provides=('hush3')
conflicts=('hush3-bin')
source=("$url/archive/v$pkgver.tar.gz"
        "hushd.service")
sha512sums=('ec0201511f51ff9ec0c929febd1af3a591378520b8778e5fbacbc24061d4638729ee1e1d3e1d6e8db8b3294b5cbe72b7e4dcaff9515a0c5c37e8c00d6181337c'
            'f8ab447fc4d91a86090326427fbbe8eda019fcfddf0ba1654f599903b25f4084eacc510f262ce03f176e7fd22316c55e5d8cf43dd9a4ccea375643e8fa8270c6')

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
  install -Dm755 "${srcdir}/$pkgname/src/hush-smart-chain" "${pkgdir}/opt/$pkgname/hush-smart-chain"
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

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/dragonx-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/dragonxd "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/asmap.dat "${pkgdir}/usr/share/hush"

  # install systemd service
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user "${srcdir}"/hushd.service
}
