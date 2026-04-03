# Maintainer: Soyeb Pervez Jim <soyebjim285@gmail.com>
pkgname=quillpolkit-git
pkgver=r38.gb1f779b
pkgrel=1
pkgdesc="Polkit authentication agent for Hyprland with Catppuccin Mocha UI (fork of hyprpolkitagent)"
arch=('x86_64' 'aarch64')
url="https://github.com/soyeb-jim285/quillpolkit"
license=('BSD-3-Clause')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-wayland'
    'hyprutils'
    'polkit'
    'polkit-qt6'
)
makedepends=(
    'cmake'
    'git'
    'qt6-base'
    'qt6-declarative'
)
provides=('polkit-agent' 'hyprpolkitagent')
conflicts=('hyprpolkitagent')
source=(
    "${pkgname}::git+https://github.com/soyeb-jim285/quillpolkit.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    # Install binary
    install -Dm755 "build/hyprpolkitagent" "${pkgdir}/usr/lib/quillpolkit/quill-polkit-agent"

    # Install systemd user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    cat > "${pkgdir}/usr/lib/systemd/user/quill-polkit-agent.service" << EOF
[Unit]
Description=Quill Polkit Authentication Agent
PartOf=graphical-session.target
After=graphical-session.target
ConditionEnvironment=WAYLAND_DISPLAY

[Service]
ExecStart=/usr/lib/quillpolkit/quill-polkit-agent
Slice=session.slice
TimeoutStopSec=5sec
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

    # Install D-Bus service
    install -dm755 "${pkgdir}/usr/share/dbus-1/services"
    cat > "${pkgdir}/usr/share/dbus-1/services/org.quill.polkitagent.service" << EOF
[D-BUS Service]
Name=org.quill.polkitagent
Exec=/usr/lib/quillpolkit/quill-polkit-agent
EOF

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
