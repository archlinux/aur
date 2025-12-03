# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=rutoken
pkgver=2.18.1.0
pkgrel=1
pkgdesc="Support for cryptographic tokens from Aktiv-Soft JSC"
url="https://www.rutoken.ru/support/download/"
arch=('x86_64')
license=("custom")
depends=("glibc" "pcsclite" "ccid")
makedepends=("patchelf")
optdepends=("libp11-kit: for sd-rutoken")
options=('!strip')
source=("https://download.rutoken.ru/Rutoken/Utilites/rtAdmin/3.1/Linux/rtadmin.zip"
        "https://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp-${pkgver}-1.x86_64.rpm"
        "sd-rutoken")
b2sums=('74a32be7b93d839e4afc31eb1733020826114c06f1b787bb6e9d8121de6662262822e15bf439a292e6199114df42fb76a44d4bd60772184c243b8a41dc61008a'
        '200024a1435a89520b76ebee92b1bb63e0f56241d336d1180f2aebec810c955b08302d9e632daf4d7f68e97305c805b9d794c06a699e6c383ec51a924cf9d604'
        'SKIP')

package() {
  install -Dm755 "glibc-x86_64/rtadmin" "$pkgdir/usr/bin/rtadmin"
  patchelf --add-rpath "/usr/lib/pkcs11" "$pkgdir/usr/bin/rtadmin"

  install -Dm755 "opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so" "$pkgdir/usr/lib/pkcs11/librtpkcs11ecp.so"
  install -Dm644 "usr/share/doc/librtpkcs11ecp/LICENSE" "$pkgdir/usr/share/doc/librtpkcs11ecp/LICENSE"
  install -Dm644 "usr/share/doc/librtpkcs11ecp/NOTICE.txt" "$pkgdir/usr/share/doc/librtpkcs11ecp/NOTICE"

  mkdir -p "$pkgdir/usr/share/p11-kit/modules"
  echo "module: librtpkcs11ecp.so" > "$pkgdir/usr/share/p11-kit/modules/rutoken.module"

  install -Dm644 "sd-rutoken" "$pkgdir/usr/lib/initcpio/install/sd-rutoken"
}
