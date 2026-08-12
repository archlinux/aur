# Maintainer: czyt <czytcn@gmail.com>
pkgname=tty7-bin
pkgver=26.8.2
pkgrel=2
pkgdesc="A terminal workbench in pure Rust: shells, persistent sessions, SSH, coding agents. GPU-rendered on Zed's gpui, VT core from Alacritty."
arch=('x86_64')
url="https://github.com/l0ng-ai/tty7"
license=('Apache-2.0')
options=('!debug')
depends=(
    'fontconfig'
    'freetype2'
    'glibc'
    'krb5'
    'libgcc'
    'libglvnd'
    'libx11'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
    'vulkan-icd-loader'
    'xdg-utils'
)
optdepends=(
    'gnome-keyring: secure storage for SSH credentials'
    'vulkan-driver: hardware-accelerated Vulkan rendering'
    'xdg-desktop-portal: native file chooser and URI integration'
)
provides=('tty7')
conflicts=('tty7')
source=("tty7-${pkgver}.svg::https://raw.githubusercontent.com/l0ng-ai/tty7/v${pkgver}/assets/app-icon.svg")
source_x86_64=("tty7-${pkgver}-linux-x86_64.tar.gz::https://github.com/l0ng-ai/tty7/releases/download/v${pkgver}/tty7-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('50719dc40114a54a8d91ad7afef6851b7c03fc60e6188d5719536c751dfc3ad3')
sha256sums_x86_64=('92cb92d44bf23e624fac223fbcbeff4bf4d0123a0f8e2ba13fe279d1b6c40ff0')

package() {
    local _release_dir="${srcdir}/tty7-${pkgver}-linux-x86_64"

    # Keep runtime-loaded completion specifications beside the real executable.
    install -Dm755 "${_release_dir}/tty7" "${pkgdir}/usr/lib/tty7/tty7"
    install -dm755 "${pkgdir}/usr/lib/tty7/completions"
    install -Dm644 "${_release_dir}"/completions/*.json -t "${pkgdir}/usr/lib/tty7/completions"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/tty7/tty7 "${pkgdir}/usr/bin/tty7"

    install -Dm644 "${_release_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_release_dir}/README.md" "${pkgdir}/usr/share/doc/tty7/README.md"
    install -Dm644 "${srcdir}/tty7-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tty7.svg"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tty7.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=tty7
GenericName=Terminal Emulator
Comment=A terminal workbench for shells, persistent sessions, SSH, and coding agents
TryExec=tty7
Exec=tty7
Icon=tty7
Terminal=false
Categories=System;TerminalEmulator;
Keywords=terminal;shell;session;SSH;coding;agent;
StartupNotify=true
StartupWMClass=tty7
EOF
}
