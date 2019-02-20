# Maintainer: Aidan Dang <dang at aidan dot gg>

pkgbase=infnoise
pkgname=(infnoise libinfnoise infnoise-tools)
pkgver=0.3.1
pkgrel=1
pkgdesc="Infinite Noise TRNG"
arch=('x86_64')
url="https://github.com/waywardgeek/infnoise"
license=('custom')
depends=('libftdi-compat')
source=("https://13-37.org/files/${pkgbase}-${pkgver}.tar.gz"
        "https://13-37.org/files/${pkgbase}-${pkgver}.tar.gz.sig"
        "https://github.com/13-37-org/${pkgbase}/raw/${pkgver}/LICENSE")
sha512sums=('794328ef02c98a3d0a1fc1fab49eeef9474f5cfab9d0a760c6d456ffaae91a24ece5157bebdead7b18091d9827e4359be66b473e11fa3259bf91203ab93eac30'
            'SKIP'
            '3e20c74803825a27f7d4208f711d5b5f48bbdcd9487b59e0922fcbfd3b17f3f37440ae3bc024e3183401e4918765e59de8a5896f5a8be8236e4b769c65443cbb')
validpgpkeys=('71AE099B262DC0B493E6EE71975DC25C4E730A3C')

build() {
  make -f Makefile.linux

  # Build infnoise-tools
  cd ${srcdir}/tools
  make all
}

package_libinfnoise() {
  pkgdesc="Infinite Noise TRNG library"

  install -Dm644 "LICENSE"                            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "libinfnoise.h"                      "${pkgdir}/usr/include/libinfnoise.h"
  install -Dm755 "libinfnoise.so"                     "${pkgdir}/usr/lib/libinfnoise.so"
}

package_infnoise() {
  pkgdesc="Infinite Noise TRNG driver"
  backup=("etc/infnoise.conf")

  install -Dm644 "LICENSE"                            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "init_scripts/75-infnoise.rules"     "${pkgdir}/usr/lib/udev/rules.d/75-infnoise.rules"
  install -Dm644 "init_scripts/infnoise.conf.systemd" "${pkgdir}/etc/infnoise.conf"
  install -Dm644 "init_scripts/infnoise.service.bin"  "${pkgdir}/usr/lib/systemd/system/infnoise.service"
  install -Dm755 "infnoise"                           "${pkgdir}/usr/bin/infnoise"
}

package_infnoise-tools() {
  pkgdesc="Infinite Noise TRNG tools"
  depends=('glibc')

  install -Dm644 "LICENSE"                            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "tools/bin2hex"                      "${pkgdir}/usr/bin/infnoise-bin2hex"
  install -Dm755 "tools/dice"                         "${pkgdir}/usr/bin/infnoise-dice"
  install -Dm755 "tools/entcheck"                     "${pkgdir}/usr/bin/infnoise-entcheck"
  install -Dm755 "tools/findlongest"                  "${pkgdir}/usr/bin/infnoise-findlongest"
  install -Dm755 "tools/flipbits"                     "${pkgdir}/usr/bin/infnoise-flipbits"
  install -Dm755 "tools/healthcheck"                  "${pkgdir}/usr/bin/infnoise-healthcheck"
  install -Dm755 "tools/hex2bin"                      "${pkgdir}/usr/bin/infnoise-hex2bin"
  install -Dm755 "tools/passgen"                      "${pkgdir}/usr/bin/infnoise-passgen"
}
