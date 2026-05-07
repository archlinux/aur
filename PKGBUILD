# Maintainer: Solara Linux <ash8820@proton.me>
# Repackage CachyOS kernel with Solara branding

pkgname=solara-kernel
pkgver=7.0.1
pkgrel=2
pkgdesc="Solara Linux Kernel - EEVDF + LTO from CachyOS with Solara branding"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: wireless regulatory database'
            'linux-firmware: firmware files'
            'modprobed-db: module tracking'
            'scx-sched: sched-ext schedulers')

source=("https://share.cachyos.org/x86_64_v3/kernel/7.0/linux-cachyos-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    tar -xf "${srcdir}/linux-cachyos-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst" -C "${pkgdir}"
    
    for f in "${pkgdir}"/boot/vmlinuz-*; do
        [ -f "$f" ] && mv "$f" "${f/-cachyos/-solara}"
    done
    
    for d in "${pkgdir}"/usr/lib/modules/*; do
        [ -d "$d" ] && mv "$d" "${d/-cachyos/-solara}"
    done
    
    sed -i 's/linux-cachyos/solara-kernel/g' "${pkgdir}"/usr/lib/modprobe.d/*.conf 2>/dev/null || true
    
    mkdir -p "${pkgdir}/usr/lib"
    cat > "${pkgdir}/usr/lib/os-release" << 'EOF'
NAME="Solara Linux"
PRETTY_NAME="Solara Linux"
ID=solara
ID_LIKE=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://solaralinux.org/"
BUG_REPORT_URL="https://github.com/ravecorelabs/solara/issues"
LOGO=solara
EOF
}