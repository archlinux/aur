# Maintainer: czyt <czytcn@gmail.com>
pkgname=uu-remote-bin
pkgver=0.2.65
pkgrel=1
pkgdesc="非官方 UU 远程 Linux 被控端，纯 Rust 实现，可用官方客户端远程控制 Linux 桌面"
arch=('x86_64')
url="https://github.com/VallierDev/uu-remote-linux"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=('gtk3' 'ffmpeg' 'libpulse' 'pam' 'systemd')
optdepends=(
    'wl-clipboard: Wayland clipboard sync'
    'libpipewire: Wayland portal screen capture'
    'libei: GNOME/KDE Wayland portal input injection'
    'sdl2: experimental native remote viewer (uuremote-viewer)'
    'xorg-server-xvfb: virtual desktop for monitorless servers (uu-virtual-desktop)'
    'xfce4: default desktop session for the virtual desktop'
    'nvidia-utils: NVENC hardware encoding on NVIDIA GPUs'
)
provides=('uu-remote')
conflicts=('uu-remote')
options=('!strip' '!debug')
source=(
    "uu-remote-native.service"
    "uu-virtual-desktop.service"
    "60-uu-remote-linux-uinput.rules"
)
source_x86_64=("uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz::https://github.com/VallierDev/uu-remote-linux/releases/download/v${pkgver}/uu-remote-linux-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('910d0627d7b1b7edc2408d9def0dacecf92db01e43c094f10f250a22e7efbdc6'
            'ee8a778fe9367f1dffe2482940b70ec627e414dcaa409731560cd37481ed4feb'
            '822b332b88276aba6b91997a17c543e2d77656cbbfbda65dab0b1f827efe8b03')
sha256sums_x86_64=('7c7ecb6e1a1e52c474287b7ecaf40906ef1bf84576df22dbaef023711d96769d')

package() {
    local _dir="uu-remote-linux-v${pkgver}-x86_64-linux"

    install -Dm755 "${srcdir}/${_dir}/uuremote-server" "${pkgdir}/usr/bin/uuremote-server"
    install -Dm755 "${srcdir}/${_dir}/uuremote-viewer" "${pkgdir}/usr/bin/uuremote-viewer"
    install -Dm644 "${srcdir}/${_dir}/libuu-wayland.so" "${pkgdir}/usr/lib/uu-remote-linux/libuu-wayland.so"
    install -Dm644 "${srcdir}/${_dir}/libuu-portal.so" "${pkgdir}/usr/lib/uu-remote-linux/libuu-portal.so"
    install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Desktop entries and icon: upstream moved them from contrib/desktop/ to
    # packaging/common/desktop/ around v0.2.62; try the new location first and
    # fall back to the old one so both release layouts work.
    if [ -d "${srcdir}/${_dir}/packaging/common/desktop" ]; then
        _desktop_dir="${_dir}/packaging/common/desktop"
    else
        _desktop_dir="${_dir}/contrib/desktop"
    fi
    install -Dm644 "${srcdir}/${_desktop_dir}/uu-remote-linux.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uu-remote-linux.svg"
    install -Dm644 "${srcdir}/${_desktop_dir}/uu-remote-linux.desktop" \
        "${pkgdir}/usr/share/applications/uu-remote-linux.desktop"
    install -Dm644 "${srcdir}/${_desktop_dir}/uu-remote-linux-viewer.desktop" \
        "${pkgdir}/usr/share/applications/uu-remote-linux-viewer.desktop"

    # systemd user services: main host + optional virtual desktop (Xvfb)
    install -Dm644 "${srcdir}/uu-remote-native.service" \
        "${pkgdir}/usr/lib/systemd/user/uu-remote-native.service"
    install -Dm644 "${srcdir}/uu-virtual-desktop.service" \
        "${pkgdir}/usr/lib/systemd/user/uu-virtual-desktop.service"

    # uinput udev rule for Wayland virtual keyboard/mouse (uaccess)
    install -Dm644 "${srcdir}/60-uu-remote-linux-uinput.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/60-uu-remote-linux-uinput.rules"

    # Virtual desktop helper (contrib): Xvfb + session, for monitorless hosts
    install -Dm755 "${srcdir}/${_dir}/contrib/virtual-desktop/uu-virtual-desktop" \
        "${pkgdir}/usr/bin/uu-virtual-desktop"

    # Opt-in drop-in to serve the virtual desktop from the main service;
    # shipped as documentation so it never changes behavior by default.
    install -Dm644 "${srcdir}/${_dir}/contrib/virtual-desktop/virtual-display.conf" \
        "${pkgdir}/usr/share/doc/${pkgname}/virtual-display.conf.example"
}
