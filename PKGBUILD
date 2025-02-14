# Maintainer: Jörg Hettwer <jh_gitlab@gmx-topmail.de>
pkgname='g15ctrld'
pkgver=1.4
pkgrel=1
pkgdesc="A daemon controlling the G15 Logitech Gaming Keyboard"
arch=('x86_64')
url="https://gitlab.com/raycollector/g15ctrld.git"
license=('GPL-3.0-only')
depends=('glibc' 'libusb' 'libusb-compat')
makedepends=('git' 'gcc' 'make' 'libg15' 'libg15render' 'lcdproc' 'ydotool' 'libevdev' 'curl' 'hidapi' 'systemd' 'libxkbcommon' 'autoconf' 'automake' 'pkgconf')
provides=('g15ctrld')
source=( "https://gitlab.com/raycollector/g15ctrld/-/archive/main/g15ctrld-main.tar.gz" )
#"git+https://gitlab.com/raycollector/g15ctrld.git#branch=main" 

sha256sums=('50097ca5c3272a1e78f965f041489627e0741a298c616a5b5f08537a24025b71' ) 
install="$pkgname.install"

prepare() {
    mv "$srcdir/g15ctrld-v1.4" "$srcdir/g15ctrld"
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

    # Install g15ctrld
    cd "$srcdir/g15ctrld"

    # Ensure the service file is installed from the correct directory
    install -Dm755 "$srcdir/g15ctrld/bin/g15ctrld" "$pkgdir/usr/bin/g15ctrld"

    # Install Service-file for systemd
    install -Dm 644 "$srcdir/g15ctrld/g15ctrld.service" "$pkgdir/usr/lib/systemd/system/g15ctrld.service"
}
