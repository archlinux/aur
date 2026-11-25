# Maintainer: Irshad Ali <irshadali5@proton.me>
# 🌙 Project Night: 100% Rust-Native Wayland Desktop Environment (Prebuilt Binaries)

pkgname=night-bin
pkgver=0.1.0_preview
pkgrel=1
pkgdesc="A high-performance, minimalist, 100% Rust-native Wayland desktop environment powered by Pinnacle (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/irshadali5/night"
license=('MIT')

depends=(
    'pinnacle-comp-git'
    'alacritty'
    'ironbar-bin'
    'wired-notify-bin'
    'swayosd-git'
    'swww'
    'wayshot'
    'satty-bin'
    'slurp'
    'wl-screenrec'
    'wayidle'
    'veila-bin'
    'favnyr-git'
    'yazi'
)

optdepends=(
    'rio: GPU-accelerated secondary terminal'
    'walker-bin: Wayland application launcher and dmenu replacement'
    'elephant-all: Backend data provider service for Walker'
    'zen-browser-bin: Performance privacy browser'
    'brave-bin: Web3 chromium browser'
)

provides=('night-desktop' 'nightctl' 'night-session' 'night-settings')
conflicts=('night-desktop' 'night-desktop-git')
options=('!strip')

_tag="v0.1.0-preview"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/irshadali5/night/releases/download/${_tag}/night-${_tag}-${arch}.tar.gz")
sha256sums=('d71424e234933be09d403113d61cf28962085bd8b613174acfaab75ed6396121')

package() {
    # 1. Install Binaries
    install -Dm755 bin/night-pinnacle "${pkgdir}/usr/bin/night-pinnacle"
    install -Dm755 bin/nightctl "${pkgdir}/usr/bin/nightctl"
    install -Dm755 bin/night-settings "${pkgdir}/usr/bin/night-settings"
    install -Dm755 bin/night-session "${pkgdir}/usr/bin/night-session"

    # 2. Install Wayland Session Entry
    install -Dm644 assets/night.desktop "${pkgdir}/usr/share/wayland-sessions/night.desktop"

    # 3. Install Helper Scripts
    install -d "${pkgdir}/usr/share/night/scripts"
    for script in assets/*.sh; do
        if [ -f "$script" ]; then
            install -Dm755 "$script" "${pkgdir}/usr/share/night/scripts/$(basename "$script")"
        fi
    done

    # 4. Install Wallpapers
    install -d "${pkgdir}/usr/share/night/wallpapers"
    for wp in assets/wallpapers/*; do
        if [ -f "$wp" ]; then
            install -Dm644 "$wp" "${pkgdir}/usr/share/night/wallpapers/$(basename "$wp")"
        fi
    done

    # 5. Install Default Configuration Templates
    install -d "${pkgdir}/usr/share/night/config"
    for cfg in config/*; do
        if [ -f "$cfg" ]; then
            install -Dm644 "$cfg" "${pkgdir}/usr/share/night/config/$(basename "$cfg")"
        fi
    done
    if [ -f pinnacle.toml ]; then
        install -Dm644 pinnacle.toml "${pkgdir}/usr/share/night/config/pinnacle.toml"
    fi

    # 6. Install Systemd User Units & Portals
    if [ -f assets/night.service ]; then
        install -Dm644 assets/night.service "${pkgdir}/usr/lib/systemd/user/night.service"
    fi
    if [ -f assets/night-session.service ]; then
        install -Dm644 assets/night-session.service "${pkgdir}/usr/lib/systemd/user/night-session.service"
    fi
    if [ -f assets/night-session.target ]; then
        install -Dm644 assets/night-session.target "${pkgdir}/usr/lib/systemd/user/night-session.target"
    fi
    if [ -f assets/night-shutdown.target ]; then
        install -Dm644 assets/night-shutdown.target "${pkgdir}/usr/lib/systemd/user/night-shutdown.target"
    fi
    if [ -f assets/night-portals.conf ]; then
        install -Dm644 assets/night-portals.conf "${pkgdir}/usr/share/xdg-desktop-portal/night-portals.conf"
    fi

    # 7. Install License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
