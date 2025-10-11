# Maintainer: Jörg Hettwer <jh_gitlab@gmx-topmail.de>
pkgname='g15ctrld'
pkgver=1.9.8
pkgrel=3
pkgdesc="A new daemon controlling the G15 Logitech Gaming Keyboard for x11 and
wayland"
arch=('x86_64')
url="https://gitlab.com/raycollector/g15ctrld.git"
license=('GPL-3.0-only')
depends=('glibc' 'libusb' 'libusb-compat')
makedepends=('git' 'gcc' 'make' 'libg15' 'libg15render' 'lcdproc' 'ydotool' 'libevdev' 'curl' 'hidapi' 'systemd' 'libxkbcommon' 'autoconf' 'automake' 'pkgconf')
provides=('g15ctrld')
#source=( "https://gitlab.com/raycollector/g15ctrld/-/archive/main/g15ctrld-main.tar.gz" )
source=( "git+https://gitlab.com/raycollector/g15ctrld.git#branch=main" )
# 

sha256sums=('SKIP')
install="$pkgname.install"

prepare() {
    if [ -d "$srcdir/g15ctrld-main" ]; then
        mv "$srcdir/g15ctrld-main" "$srcdir/g15ctrld"
    fi
    cd "$srcdir/g15ctrld" || exit 1
}


build() {
    # Build g15ctrld
    cd "$srcdir/g15ctrld"
    make
}

package() {
    echo $srcdir

    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/etc"

    # Install g15ctrld
    cd "$srcdir/g15ctrld"
    # this installs the necessarily needed g15 driver in /usr/lib/lcdproc/g15.so
    # it comes precompiled and will be deleted with lcdproc once lcdproc is uninstalled
    install -Dm755 "$srcdir/g15ctrld/g15.so" "$pkgdir/usr/lib/lcdproc-g15/g15.so"
    install -Dm755 "$srcdir/g15ctrld/linux_input.so" "$pkgdir/usr/lib/lcdproc-g15/linux_input.so"

    install -Dm755 "$srcdir/g15ctrld/LCDd.conf" "$pkgdir/etc/LCDd.conf.pacnew"
    install -Dm755 "$srcdir/g15ctrld/lcdproc.conf" "$pkgdir/etc/lcdproc.conf.pacnew"


    install -Dm755 "$srcdir/g15ctrld/LCDd-menu" "$pkgdir/usr/bin/LCDd-menu"
    # Install g15ctrld
    cd "$srcdir/g15ctrld"

    # Ensure the service file is installed from the correct directory
    install -Dm755 "$srcdir/g15ctrld/bin/g15ctrld" "$pkgdir/usr/bin/g15ctrld"

    # Install udev rules for G15
    install -Dm644 "$srcdir/g15ctrld/99-lcdproc.rules" "$pkgdir/etc/udev/rules.d/98-lcdproc.rules"

    # Install Service-file for systemd
    install -Dm 644 "$srcdir/g15ctrld/g15ctrld.service" "$pkgdir/usr/lib/systemd/system/g15ctrld.service"

    # 🔹 Systemd-Override für lcdd.service hinzufügen
    install -d "$pkgdir/etc/systemd/system/lcdd.service.d"
    install -Dm644 /dev/stdin "$pkgdir/etc/systemd/system/lcdd.service.d/override.conf" <<'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/LCDd-menu -c /etc/LCDd.conf
EOF
}
