# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-driver-git
pkgver=20.04.78.r0.g8d5a817
pkgrel=1
pkgdesc="System76 Driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
conflicts=("system76-driver")
provides=("system76-driver")
depends=(
    'at'
    'dmidecode'
    'ethtool'
    'grub'
    'gtk3'
    'lm_sensors'
    'pciutils'
    'polkit'
    'python>=3.6'
    'python-cffi'
    'python-dbus'
    'python-distro'
    'python-evdev'
    'python-gobject'
    'python-pynacl'
    'python-systemd'
    'python-xlib'
    'system76-firmware-daemon'
    'usbutils'
    'wireless_tools'
)
makepdepends=(
    'python-pyflakes'
)
optdepends=(
    'firmware-manager: Manage System76 firmware updates via standalone application'
    'gnome-control-center-system76: Manage System76 firmware updates via Settings'
    'pm-utils: For power management features'
    'pulseaudio: To apply microphone fix'
    'system76-dkms: Control hotkeys and fan on certain System76 laptops'
    'system76-acpi-dkms: Provides the system76_acpi in-tree driver'
    'system76-io-dkms: Enable System76 I/O daughterboard'
    'system76-oled: Control brightness on OLED displays'
    'system76-power: System76 Power Management'
    'xorg-xhost: To enable GUI applications on Wayland'
    'xorg-xbacklight: To use the backlight service'
)
source=("${pkgname}::git+https://github.com/pop-os/system76-driver.git"
        'actions.patch'
        'cli.patch'
        'wayland.patch')
sha256sums=('SKIP'
            '3ade740c1681f8f33ef78e1e6c087e4002d14c888d7a5bf6bfbeb2aa70111119'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            '2ffbd813744c0b99416947a2755767767af434758aa20dcfafefb49fb367d5d3')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
    patch --no-backup-if-mismatch -Np1 -i "${srcdir}/cli.patch"

    # Use xhost for GUI apps on Wayland
    patch --no-backup-if-mismatch -Np1 -i "${srcdir}/wayland.patch"

    # Use mkinitcpio instead of initramfs-tools
    patch --no-backup-if-mismatch -Np1 -i "${srcdir}/actions.patch"
}

build() {
    cd "${srcdir}/${pkgname}"

    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install base package
    export PYTHONHASHSEED=0
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    local _pkgname="${pkgname%%-git}"

    # Install daemons and executables
    install -Dm755 system76-daemon -t "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 system76-user-daemon -t "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 system76-driver-pkexec -t "${pkgdir}/usr/bin"

    # Install systemd unit files
    # Note: system76-driver* service files shortened to system76*
    install -Dm644 debian/system76-driver.service \
        "${pkgdir}/usr/lib/systemd/system/system76.service"

    # Install scripts and configuration
    install -Dm755 system76-nm-restart "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 system76-thunderbolt-reload -t "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 com.system76.pkexec.system76-driver.policy -t \
        "${pkgdir}/usr/share/polkit-1/actions"

    # Install application launchers
    install -Dm644 system76-driver.desktop -t "${pkgdir}/etc/xdg/autostart"
    install -Dm644 system76-user-daemon.desktop -t "${pkgdir}/etc/xdg/autostart"

    # Create /var/lib/system76-driver directory for brightness settings saving
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"

    # Remove tests
    local site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
    rm -rf "${pkgdir}${site_packages}/system76driver/tests"
}
