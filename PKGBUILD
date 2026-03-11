# Maintainer: LucasionGS <ion@ionnet.dev>
pkgname=ionix-shell
pkgver=1.0.5
pkgrel=1
pkgdesc="GTK overlay shell for Hyprland — SSH, VPN, Docker, command palette, and automation panels"
arch=('x86_64')
url="https://github.com/LucasionGS/ionix-shell-ags"
license=('MIT')
depends=(
    'aylurs-gtk-shell-git'
    'hyprland'
    'kitty'
    'socat'
    'networkmanager'
    'wl-clipboard'
)
optdepends=(
    'docker: Docker container management panel'
    'hyprlock: Screen lock support'
    'hyprshot: Screenshot capture support'
    'copyq: Clipboard manager integration'
    'zoxide: Frecency-based directory navigation in command palette'
    'ionix-openconnect-tools: OpenConnect VPN panel'
    'openconnect: VPN panel (requires oc wrapper CLI)'
)
makedepends=('git' 'aylurs-gtk-shell-git')
source=("$pkgname::git+https://github.com/LucasionGS/ionix-shell-ags.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    ags bundle . ionix-shell
}

package() {
    cd "$srcdir/$pkgname"

    # Install the AGS bundle
    install -Dm755 ionix-shell "$pkgdir/usr/share/$pkgname/ionix-shell"

    # Link the executable
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec /usr/share/$pkgname/ionix-shell "\$@"
EOF

    # Systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$pkgname.service" << EOF
[Unit]
Description=ionix-shell Hyprland overlay shell
PartOf=graphical-session.target
After=graphical-session.target

[Service]
ExecStart=/usr/bin/$pkgname
Restart=on-failure
RestartSec=3

[Install]
WantedBy=graphical-session.target
EOF
}
