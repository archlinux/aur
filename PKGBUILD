# Maintainer: @ivanquanta

#---- usage info -----------------------------------------------------------------------------
IFS= read -r -d '' _usage << 'EOF'

    USAGE:
    After installing pacman-tmpfs you can use your favourite package manager as usual
    with tmpfs caches and automatically cleaning. Autocompletion is also working. For example:
        run0 pacman -Syu htop
        yay -Syu faugus-launcher
        sudo paru -Rncus faugus-launcher

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
    For cleanup all caches (tmpfs and local) just update system like:
        sudo pacman -Syu
    #
EOF
#---------------------------------------------------------------------------------------------

pkgname=pacman-tmpfs
pkgver=2026.10.31
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
install=install.sh

source=(
    pacman-tmpfs.sh     # хранится в git aur. в source пересчитывает sha256sums
)
sha256sums=('f5c92d7daeaf29aea97d42ebb26e3db333678bcf74b772f91d3ac10adbe7caf9')

echo -n "${_usage}" > /tmp/pacman-tmpfs_usage.txt

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
