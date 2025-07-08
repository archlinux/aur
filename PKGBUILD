# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.10.4
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('libsodium')
makedepends=('wget' 'git' 'curl')
provides=('hush3')
conflicts=('hush3')
source=("hush-$pkgver-amd64.deb::https://git.hush.is/attachments/1123a055-a8e7-420a-8624-6f1e4adfe38e"
        "$url/raw/branch/master/LICENSE"
        "hushd.service")
sha512sums=('cf7833b3172787bb4a4c5af388ee65e0253763c6866ad8b2fca43a8076aa7dfc221c75e6f8bc2c6e70f407832fcf4c3d2c8abb5b06c8ed56f33e1b1c90655fcb'
            '7b0af5cf16f2def174a5cf63dc536e07f8a0cd3bcd48f9edccc414d406b1cb11e0a82af157ea1c43449cbabad845a1f52b084dc9232b45935880d0d82fb356ca'
            'f8ab447fc4d91a86090326427fbbe8eda019fcfddf0ba1654f599903b25f4084eacc510f262ce03f176e7fd22316c55e5d8cf43dd9a4ccea375643e8fa8270c6')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/usr/bin/hush-arrakis-chain" "$pkgdir/opt/$_pkgname/hush-arrakis-chain"
  install -Dm755 "${srcdir}/usr/bin/hush-cli" "${pkgdir}/opt/$_pkgname/hush-cli"
  install -Dm755 "${srcdir}/usr/bin/hushd" "${pkgdir}/opt/$_pkgname/hushd"
  install -Dm755 "${srcdir}/usr/bin/hush-tx" "${pkgdir}/opt/$_pkgname/hush-tx"
  install -Dm755 "${srcdir}/usr/bin/dragonx-cli" "${pkgdir}/opt/$_pkgname/dragonx-cli"
  install -Dm755 "${srcdir}/usr/bin/dragonxd" "${pkgdir}/opt/$_pkgname/dragonxd"

  # install required sapling files and asmap.dat
  install -Dm644 "${srcdir}/usr/share/hush/sapling-output.params" "${pkgdir}/opt/$_pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/usr/share/hush/sapling-spend.params" "${pkgdir}/opt/$_pkgname/sapling-spend.params"
  install -Dm644 "${srcdir}/usr/share/hush/asmap.dat" "${pkgdir}/opt/$_pkgname/asmap.dat"

  # install man pages
  install -Dm644 "${srcdir}/usr/share/man/man1/hush-cli.1.gz" "${pkgdir}/usr/share/man/man1/hush-cli.1.gz"
  install -Dm644 "${srcdir}/usr/share/man/man1/hushd.1.gz" "${pkgdir}/usr/share/man/man1/hushd.1.gz"
  install -Dm644 "${srcdir}/usr/share/man/man1/hush-tx.1.gz" "${pkgdir}/usr/share/man/man1/hush-tx.1.gz"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-arrakis-chain "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/dragonx-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/dragonxd "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/asmap.dat "${pkgdir}/usr/share/hush"

  # install systemd service
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user "${srcdir}"/hushd.service
}
