# Maintainer: Mikata Riko <sanbikappa at qq dot com>

pkgname='mouseless'
pkgver=0.3.0
pkgrel=1
pkgdesc="A replacement for the mouse in Linux"
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://github.com/jbensmann/mouseless"
makedepends=('go' 'git')
conflicts=('mouseless-bin')
source=(
    "https://github.com/jbensmann/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "741b85049f6c9ac0e15c0e68b88b655cbe592fe4110eb7594c1d21b1d6d04dc8"
)
install="${pkgname}.install"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "/tar /d" build.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 dist/mouseless "${pkgdir}/usr/bin/mouseless"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}.license"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r example_configs "${pkgdir}/usr/share/doc/${pkgname}"
    cp README.md "${pkgdir}/usr/share/doc/${pkgname}"

    install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -dm755 "${pkgdir}/usr/lib/systemd/user"

    # fix: bluetooth keyboard not found in /dev/input/by-id/
    cat > "${pkgdir}/usr/lib/udev/rules.d/99-mouseless-persistent-bluetooth-keyboard.rules" << 'EOF'
# saved in /usr/lib/udev/rules.d/99-mouseless-persistent-bluetooth-keyboard.rules
# the ENV{ID_BUS} of bluetooth device has been defined in 60-persistent-input.rules

ENV{ID_BUS}!="bluetooth", GOTO="mouseless_persistent_bluetooth_keyboard_end"

# determine class name for persistent symlinks
ENV{ID_INPUT_KEYBOARD}=="?*", ENV{.INPUT_CLASS}="kbd"

# by-id links
KERNEL=="event*", ENV{ID_BUS}=="bluetooth", ENV{.INPUT_CLASS}=="kbd", ENV{ID_SERIAL}=="?*", SYMLINK+="input/by-id/$env{ID_BUS}-$env{ID_SERIAL}-event-$env{.INPUT_CLASS}"
KERNEL=="event*", ENV{ID_BUS}=="bluetooth", ENV{.INPUT_CLASS}=="kbd", ENV{ID_SERIAL}=="", ATTRS{name}=="?*", SYMLINK+="input/by-id/$env{ID_BUS}-$attr{name}-event-$env{.INPUT_CLASS}"

LABEL="mouseless_persistent_bluetooth_keyboard_end"

EOF

    
    # https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups
    cat > "${pkgdir}/usr/lib/udev/rules.d/99-mouseless-input.rules" << 'EOF'
# saved in /usr/lib/udev/rules.d/99-mouseless-uinput.rules

KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess", OPTIONS+="static_node=uinput"

EOF


    # Add a config file for system-wide service
    install -Dm755 example_configs/config_full.yaml "${pkgdir}/etc/mouseless/config.yaml"

    # Add a system-wide service
    cat > "${pkgdir}/usr/lib/systemd/system/mouseless.service" << 'EOF'
[Unit]
Description=mouseless

[Service]
ExecStartPre=/bin/sleep 2
ExecStart=/usr/bin/mouseless --config /etc/mouseless/config.yaml

[Install]
WantedBy=multi-user.target

EOF


    # Add a user service
    cat > "${pkgdir}/usr/lib/systemd/user/mouseless.service" << 'EOF'
# If you would like to replace the default user unit file for mouseless.service,
# please save your service unit file to this location:
# ~/.config/systemd/user/mouseless.service

[Unit]
Description=mouseless

[Service]
ExecStartPre=/bin/sleep 2
ExecStart=/usr/bin/mouseless --config %h/.config/mouseless/config.yaml

[Install]
WantedBy=default.target

EOF


}

