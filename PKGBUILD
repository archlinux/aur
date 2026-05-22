# Maintainer: Andron <andron@andron-thinkpad>
# AUR: https://aur.archlinux.org/packages/xmm7360-dkms-git

pkgname=xmm7360-dkms-git
pkgver=r315.gec4c27b   # updated by pkgver() below
pkgrel=1
pkgdesc="Intel XMM7360 / Fibocom L850 LTE modem driver (DKMS) with RPC init tool"
arch=('x86_64')
url="https://github.com/Andron338/xmm7360-pci"
license=('GPL2')

depends=(
    'dkms'
    'openssl'
    'util-linux-libs'
    'networkmanager'
    'modemmanager'
    'psmisc'         # fuser, for recovery service
)
makedepends=('linux-headers' 'git')
optdepends=('linux-headers: required by DKMS on kernel update')

provides=('xmm7360-dkms')
conflicts=('xmm7360' 'xmm7360-dkms' 'xmm7360-git' 'xmm7360-pci-dkms')
install="${pkgname%-git}.install"

source=("xmm7360-pci::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/xmm7360-pci"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmm7360-pci/tool"
    make clean 2>/dev/null || true
}

build() {
    cd "$srcdir/xmm7360-pci/tool"
    make
}

package() {
    local _src="$srcdir/xmm7360-pci"
    local _module="xmm7360"
    local _dkms_src="/usr/src/${_module}-${pkgver}"

    # ── Kernel module source for DKMS ────────────────────────────────────
    install -dm755                  "${pkgdir}${_dkms_src}"
    install -m644 "$_src/kernel/xmm7360.c"     "${pkgdir}${_dkms_src}/"
    install -m644 "$_src/kernel/Makefile.dkms" "${pkgdir}${_dkms_src}/Makefile"
    install -m644 "$_src/kernel/dkms.conf"     "${pkgdir}${_dkms_src}/"
    sed -i "s/@VERSION@/${pkgver}/" "${pkgdir}${_dkms_src}/dkms.conf"

    # ── RPC userspace tool ───────────────────────────────────────────────
    install -Dm755 "$_src/tool/open_xdatachannel" \
        "${pkgdir}/usr/bin/open_xdatachannel"

    # Manual recovery tool (escape hatch for total wedge)
    install -Dm755 "$_src/scripts/xmm7360-reset" \
        "${pkgdir}/usr/bin/xmm7360-reset"

    # ── Man page ─────────────────────────────────────────────────────────
    install -Dm644 "$_src/tool/open_xdatachannel.8" \
        "${pkgdir}/usr/share/man/man8/open_xdatachannel.8"

    # ── udev rules (also catches kernel-emitted XMM7360_STATE uevents) ───
    install -Dm644 "$_src/udev/80-xmm7360.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/80-xmm7360.rules"


    # ── Boot-time RPC init (triggered by udev when ttyXMM1 appears) ──────
    install -Dm644 "$_src/systemd/xmm7360-init.service" \
        "${pkgdir}/usr/lib/systemd/system/xmm7360-init.service"
    install -Dm644 "$_src/systemd/xmm7360-signal.service" \
        "${pkgdir}/usr/lib/systemd/system/xmm7360-signal.service"
    install -Dm644 "$_src/systemd/xmm7360-rescan.service" \
        "${pkgdir}/usr/lib/systemd/system/xmm7360-rescan.service"

    # ── Last-resort module reload (triggered by kernel uevent) ───────────
    install -Dm644 "$_src/systemd/xmm7360-recovery.service" \
        "${pkgdir}/usr/lib/systemd/system/xmm7360-recovery.service"

    # ── modprobe config (blacklist iosm) ─────────────────────────────────
    install -Dm644 "$_src/conf/xmm7360-modprobe.conf" \
        "${pkgdir}/usr/lib/modprobe.d/xmm7360.conf"

    # ── Default config ───────────────────────────────────────────────────
    install -Dm644 /dev/null "${pkgdir}/etc/xmm7360.conf"
    printf '%s\n' \
        "# XMM7360 / Fibocom L850 configuration" \
        "XMM_APN=internet" \
        "XMM_METRIC=1000" \
        > "${pkgdir}/etc/xmm7360.conf"
}
