# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.10.1
pkgrel=2
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("hush-$pkgver-amd64.deb::https://git.hush.is/attachments/11ef7d14-e1d0-4c2e-96e3-72f025eb6de8"
        "$url/raw/branch/master/LICENSE"
        "hushd.service")
sha512sums=('38d0a323dbfedcdcebbcda6053c9f6bee9cdf19bbee71be549029f68d0d2afa0921d37a9b7cdf55a60f5ca22b05eb373bfb2593dd332c5ebd6c67cf656d45195'
            '7b0af5cf16f2def174a5cf63dc536e07f8a0cd3bcd48f9edccc414d406b1cb11e0a82af157ea1c43449cbabad845a1f52b084dc9232b45935880d0d82fb356ca'
            'f8ab447fc4d91a86090326427fbbe8eda019fcfddf0ba1654f599903b25f4084eacc510f262ce03f176e7fd22316c55e5d8cf43dd9a4ccea375643e8fa8270c6')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/usr/bin/hush-smart-chain" "$pkgdir/opt/$_pkgname/hush-smart-chain"
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
  ln -s /opt/${_pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
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
