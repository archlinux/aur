pkgname=hp-wmi-dkms
pkgver=7.1.rc4
pkgrel=2
pkgdesc="hp-wmi kernel module from Linux mainline (7.1-rc4+) with HP Victus/Omen fan control and platform profile support"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('dkms')
install=hp-wmi-dkms.install
source=(
    "hp-wmi.c::https://raw.githubusercontent.com/torvalds/linux/6916d5703ddf9a38f1f6c2cc793381a24ee914c6/drivers/platform/x86/hp/hp-wmi.c"
    "dkms.conf"
    "Makefile"
    "hp-wmi-dkms.install"
)
sha256sums=('1807f924a118fa4783537eb8511808817f21a7866a96ce23bfdfa12ab25b74fd'
            '73adb7825484ada78d4631e4faaef035104c0d458e31743b507207e14022479b'
            '27590eeaeace6a376fbf25690752b9e8a775843218126ffaf236ba6d669eef69'
            '230126dc83e9bda34caf8b14a380bfe3501948ac796d4d939fc4f00516c0cdd4')

prepare() {
    # ACPI_AC_CLASS was removed from kernel headers; define it locally
    sed -i 's|#include <linux/acpi.h>|#include <linux/acpi.h>\n\n#ifndef ACPI_AC_CLASS\n#define ACPI_AC_CLASS "ac_adapter"\n#endif|' hp-wmi.c
}

package() {
    local srcdir_dkms="$pkgdir/usr/src/$pkgname-$pkgver"
    install -dm755 "$srcdir_dkms"

    install -m644 hp-wmi.c  "$srcdir_dkms/"
    install -m644 Makefile   "$srcdir_dkms/"
    install -m644 dkms.conf  "$srcdir_dkms/"
    sed -i "s/@PKGVER@/$pkgver/" "$srcdir_dkms/dkms.conf"
}
