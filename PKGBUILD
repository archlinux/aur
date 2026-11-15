# RFC66 attempt at a bootchain for Raspberry Pi devices

# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=bootchain-rpi
pkgver=1
pkgrel=1
pkgdesc='kernel-install based boot chain for Raspberry Pi devices'
arch=(any)
url='https://gitlab.archlinux.org/archlinux/rfcs/-/merge_requests/66'
license=('GPL-2.0-only')
provides=(bootchain)
conflicts=(bootchain)
options=('!debug')
depends=(
    bash
    coreutils
    initramfs
    # Read when this virtual package is provided
    # kernel
    mkinitcpio
    pacman
    # Eventually kernel-install
    systemd
)

source=(
    # Generic RFC66
    90-kernel-install-add.hook
    60-kernel-install-remove.hook
    85-mkinitcpio-rebuild.hook
    kernel-install-dispatch
    # Raspberry Pi
    10-raspberrypi.conf
    52-rpi-initrd.install
    60-rpi-boot.install
    cmdline.txt
)
sha256sums=('59355880b449b7a8090760b636dbb0956eb735e837c2f434a602779a771f590c'
            '346325adacce3b484233906425d17d3d84e85f13887e639ae2c92fbd1bc69208'
            'fb097f9495eec27d0eacb796c7bf6e6f00008e094b0b4037dfb0531c81ee82ee'
            '0ef0da311651f836e6132312ae0b32ce068ece1324415da5eea153ff6bdfe93a'
            '11f40f4a98d4205076c6c5d0d486774c778eb8c73d93447be808980990f501fd'
            'dd8dedd85788ec39ef5c55a0e276fdc8eb5f84f00ed0a094fe40f5c8cc2bd618'
            '8d283ab45fe9a1ab4797d6868bbe681802be6c11aed534fd4247a7ca88e8f780'
            '15177c34a76adf8c51ae7a3199ce005288628a04c0306820e146361431b72b21')

package() {
    cd "$srcdir"

    # RFC66 hooks and scripts, hopefully provided by `bootchain` in the future
    LIBALPM_HOOKS=(
        90-kernel-install-add.hook
        60-kernel-install-remove.hook
        # Intended to be kept in sync with mkinitcpio sources (GPLv2)
        # https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/blob/master/libalpm/hooks/90-mkinitcpio-install.hook
        85-mkinitcpio-rebuild.hook
    )
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" "${LIBALPM_HOOKS[@]}"
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" kernel-install-dispatch
    # Mask mkinitcpio hooks that would leave stray initramfs' in /boot
    install -d "$pkgdir/etc/pacman.d/hooks"
    ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    ln -s /dev/null "$pkgdir/etc/pacman.d/hooks/60-mkinitcpio-remove.hook"

    # Raspberry Pi specifics
    install -Dm644 -t "$pkgdir/usr/lib/kernel/install.conf.d" 10-raspberrypi.conf
    install -Dm755 -t "$pkgdir/usr/lib/kernel/install.d" \
        60-rpi-boot.install \
        52-rpi-initrd.install

    # Default kernel cmdline (fallback)
    install -Dm644 cmdline.txt "$pkgdir/usr/lib/kernel/cmdline"
}
