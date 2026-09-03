# Maintainer: novakpetya

pkgname=linux-switch2
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux kernel drivers for Nintendo Switch 2 controllers"
arch=('x86_64')
url='https://github.com/novakpetya/linux-switch2'
license=('GPL-2.0-or-later')

depends=(
    'linux'
    'systemd'
)

makedepends=(
    'git'
    'linux-headers'
)

optdepends=(
    'bluez-switch2: Bluetooth LE transport support for Nintendo Switch 2 Joy-Con controllers on Linux'
)

conflicts=(
    'hid-switch2-dkms'
)

install=linux-switch2.install

options=('!strip')

source=(
    "linux-switch2::git+https://github.com/novakpetya/linux-switch2.git"
)

sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/linux-switch2"

    printf 'r%s.%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    local _kernver
    _kernver="$(uname -r)"

    cd "$srcdir/linux-switch2"

    make \
        -C "/usr/lib/modules/${_kernver}/build" \
        M="$PWD" \
        modules
}

package() {
    local _kernver
    _kernver="$(uname -r)"

    cd "$srcdir/linux-switch2"

    # Kernel modules
    install -Dm644 hid-switch2.ko \
        "$pkgdir/usr/lib/modules/${_kernver}/updates/switch2/hid-switch2.ko"

    install -Dm644 switch2-usb.ko \
        "$pkgdir/usr/lib/modules/${_kernver}/updates/switch2/switch2-usb.ko"

    # udev permissions for Joy-Con / Joy-Con 2 devices
    install -Dm644 udev/70-switch2.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-switch2.rules"
}
