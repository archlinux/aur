# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.9.1
pkgrel=2
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("hush-$pkgver-amd64.deb::https://git.hush.is/attachments/0988a34a-a24f-4ced-8e3d-4b80eb9286d8"
        "$url/raw/branch/master/LICENSE"
        "hushd.service"
        "$url/raw/branch/master/doc/man/hush-cli.1"
        "$url/raw/branch/master/doc/man/hushd.1"
        "$url/raw/branch/master/doc/man/hush-tx.1")
sha512sums=('0cf7330bf07efdd5a85406e197cd6f0396f89cde1942a675f1eec5362e6d577506b7ebedc428916a1f80bcb25e26c1523d3cb24fd2dcc405d4c304b1800548a3'
            '7b0af5cf16f2def174a5cf63dc536e07f8a0cd3bcd48f9edccc414d406b1cb11e0a82af157ea1c43449cbabad845a1f52b084dc9232b45935880d0d82fb356ca'
            'f8ab447fc4d91a86090326427fbbe8eda019fcfddf0ba1654f599903b25f4084eacc510f262ce03f176e7fd22316c55e5d8cf43dd9a4ccea375643e8fa8270c6'
            'e16b6ceff19d20a2ea10759568d1f0ca6e6435e295e63e36e4ac1d76adef954b696cf5b9c0119219b0f8f09f4fe78d3dcf088741f5646cafd00e18ca9d99681f'
            '52c1944263f3f8409e066abd1b61fa8d8e60af1e60b15334783d27a560f9830e6138a0d4dc6668c2e6f163951e592a5d81ca099bb602b87c385481d7c61d396d'
            'fa28ceed11d6bfdade6831a6fb64aa9b5ff1ae1c52099409f18e5ebdf796b01c2746c865f1c099000a606fa6ed5034a20c8c1ff08aa488d89cbf9e017a44e044')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/usr/bin/hush-smart-chain" "$pkgdir/opt/$_pkgname/hush-smart-chain"
  install -Dm755 "${srcdir}/usr/bin/hush-cli" "${pkgdir}/opt/$_pkgname/hush-cli"
  install -Dm755 "${srcdir}/usr/bin/hushd" "${pkgdir}/opt/$_pkgname/hushd"
  install -Dm755 "${srcdir}/usr/bin/hush-tx" "${pkgdir}/opt/$_pkgname/hush-tx"

  # install required sapling files and asmap.dat
  install -Dm644 "${srcdir}/usr/share/hush/sapling-output.params" "${pkgdir}/opt/$_pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/usr/share/hush/sapling-spend.params" "${pkgdir}/opt/$_pkgname/sapling-spend.params"
  install -Dm644 "${srcdir}/usr/share/hush/asmap.dat" "${pkgdir}/opt/$_pkgname/asmap.dat"

  # install man pages
  install -Dm644 "${srcdir}/hush-cli.1" "${pkgdir}/usr/share/man/man1/hush-cli.1"
  install -Dm644 "${srcdir}/hushd.1" "${pkgdir}/usr/share/man/man1/hushd.1"
  install -Dm644 "${srcdir}/hush-tx.1" "${pkgdir}/usr/share/man/man1/hush-tx.1"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-tx "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/asmap.dat "${pkgdir}/usr/share/hush"

  # install systemd service
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user "${srcdir}"/hushd.service
}
