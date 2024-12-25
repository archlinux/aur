# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=rutoken
pkgver=2.16.1.0
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
sha256sums=('fb434d6d68147f4f8719167f345a2accee46a83df76e24a87ce1072a50bf9521'
            '07698a5b94aa227f0c63aae6b88d18e87e3fe28b076286d11cf29d8bc29f4e01'
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
