pkgname=hp-wmi-dkms
pkgver=1.0
pkgrel=2
pkgdesc="Patched hp-wmi kernel module with fan control fixes for HP Victus/Omen (pre-7.1 kernels)"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('dkms')
source=(
    "hp-wmi.c::https://raw.githubusercontent.com/emomaxd/linux/hp-wmi-victus-fan-v4/drivers/platform/x86/hp/hp-wmi.c"
    "dkms.conf"
    "Makefile"
)
sha256sums=('b78469d1ebe5ce82f64a8998f80b1b0480918412c4bf80171e6b7ff78653eb0f'
            '73adb7825484ada78d4631e4faaef035104c0d458e31743b507207e14022479b'
            '27590eeaeace6a376fbf25690752b9e8a775843218126ffaf236ba6d669eef69')

pre_install() {
    for kver in $(ls /usr/lib/modules/ 2>/dev/null); do
        rm -f "/usr/lib/modules/$kver/updates/dkms/hp-wmi.ko.zst" \
              "/usr/lib/modules/$kver/updates/dkms/hp-wmi.ko" \
              "/usr/lib/modules/$kver/updates/hp-wmi.ko.zst" \
              "/usr/lib/modules/$kver/updates/hp-wmi.ko"
    done
}

pre_upgrade() {
    pre_install
}

package() {
    local srcdir_dkms="$pkgdir/usr/src/$pkgname-$pkgver"
    install -dm755 "$srcdir_dkms"

    install -m644 hp-wmi.c  "$srcdir_dkms/"
    install -m644 Makefile   "$srcdir_dkms/"
    install -m644 dkms.conf  "$srcdir_dkms/"
    sed -i "s/@PKGVER@/$pkgver/" "$srcdir_dkms/dkms.conf"
}
