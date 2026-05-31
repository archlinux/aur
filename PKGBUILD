# Maintainer: sanecodeguy <sanecodeguy@github>

pkgname=goodix5385
pkgver=0.3.0
pkgrel=4
pkgdesc="Fingerprint GUI for Goodix 5385 sensor — enroll, verify, delete, sudo auth toggle."
arch=('any')
url="https://github.com/sanecodeguy/Goodix5385"
license=('MIT')
depends=(
    'fprintd'
    'python'
    'python-pyusb'
    'pyside6'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/sanecodeguy/Goodix5385/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/Goodix5385-${pkgver}"

    # Python package — installs `goodix` and `goodix5385-gui` commands
    python -m pip install --root="${pkgdir}" --prefix=/usr --no-deps .

    # systemd service — resets USB before fprintd starts
    install -Dm644 systemd/goodix-usb-reset.service \
        "${pkgdir}/usr/lib/systemd/system/goodix-usb-reset.service"

    # udev rule — unbinds cdc_acm, grants user access
    install -Dm644 udev/91-goodix-fingerprint.rules \
        "${pkgdir}/usr/lib/udev/rules.d/91-goodix-fingerprint.rules"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    # Enable and start the USB reset service
    systemctl daemon-reload
    systemctl enable goodix-usb-reset.service
    systemctl start goodix-usb-reset.service

    # Reload udev rules
    udevadm control --reload-rules
    udevadm trigger
}

post_upgrade() {
    post_install
}

pre_remove() {
    systemctl disable --now goodix-usb-reset.service
    # Remove fingerprint sudo auth if present
    if [ -f /etc/pam.d/sudo ]; then
        sed -i '/pam_fprintd\.so/d' /etc/pam.d/sudo
    fi
}
