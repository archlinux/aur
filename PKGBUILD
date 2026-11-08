# Maintainer: @ivanquanta
__='

Description/features:
    A wrapper for pacman (such as yay or paru), it transparently handles all cache operations
    within `/tmp` (which is a `tmpfs` residing in RAM).
    This reduces wear on your SSD and increases package installation speeds.
    It automatically cleans up caches, makes no changes to your system,
    and requires no configuration, it is ready to use immediately.
    There are no changes to how you interact with your package manager’s commands.
    If sudo or doas are not present on the system, it uses systemd run0 for privilege escalation.
    When redirecting to stdout (e.g., yay > /tmp/out.txt), it adds no extraneous information to the output.
    Autocompletion work.

Installing:
    yay -S pacman-tmpfs

Usage:
    After installing pacman-tmpfs you can use your favourite package manager as usual
    with tmpfs caches and automatically cleaning. Autocompletion is also working. For example:
        run0 pacman -Syu htop
        yay -Syu faugus-launcher
        paru -Rncus faugus-launcher

    For huge packages or updates that cannot fit into memory tmpfs,
    you can use the --default option. For example:
        yay --default -Syu linux-mainline linux-mainline-headers
        sudo pacman --default -Syu htop
    or using environment variable like:
        run0 env DEFAULT_FLAG=1 pacman -Syu htop
        DEFAULT_FLAG=1 yay -Syu faugus-launcher
    In this case, will be used standard configuration files:
    /etc/{pacman.conf,makepkg.conf} and the standard caches on ssd/hdd (wish a long life!):
    ~/.cache/yay/ ~/.cache/paru/ /var/cache/pacman/pkg/
    They will not be automatically cleared with --default option!
    For cleanup all local caches for all users do:
        yay -Sc
        # or
        sudo pacman -Sc

'
#---------------------------------------------------------------------------------------------

pkgname=pacman-tmpfs
pkgver=2026.11.09
pkgrel=1

pkgdesc='Wrapper for pacman, yay, paru using tmpfs for caches and auto cleaning.'
url='https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=pacman-tmpfs'
arch=('any')
license=('GPL')
depends=('pacman')
optdepends=('yay: Yet another yogurt. Pacman wrapper and AUR helper written in go.'
            'paru: Feature packed AUR helper'
            )
options=('!debug')

source=(
    pacman-tmpfs.sh     # хранится в git aur. в source пересчитывает sha256sums
)
sha256sums=('35334e54a08555760a37b133eea766289d1e41ab2517ba0eb7838dd730d25e54')

#---------------------------------------------------------------------------------------------
package() {
    # create wrapper
    mkdir -p "${pkgdir}/usr/lib/${pkgname}"
    cp -f    "./${pkgname}.sh"           "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh"
    chmod +x                             "${pkgdir}/usr/lib/${pkgname}/${pkgname}.sh"

    # create soft links
    mkdir -p  "${pkgdir}/usr/local/bin/"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/local/bin/pacman"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/local/bin/yay"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/local/bin/paru"
}
