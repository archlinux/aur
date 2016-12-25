# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-evic-git
pkgver=117.fa55dda
pkgrel=1
pkgdesc="Python Evic for E-Cigs"
arch=('any')
url="https://github.com/ClockSelect/python-evic"
license=('GPL3')
depends=('python-pillow' 'python-click' 'python-bitarray' 'python-binstruct' 'python-cython-hidapi-git')
source=("$pkgname"::'git://github.com/ClockSelect/python-evic.git#branch=master')
md5sums=('SKIP')
#install=.install

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
    install -Dm644 ./udev/99-nuvoton-hid.rules "$pkgdir/usr/lib/udev/rules.d/99-nuvoton-hid.rules"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    {
        echo '[Unit]'
        echo 'Description=Evic RTC sync'
        echo '[Service]'
        echo 'ExecStart=/usr/bin/evic-usb time'
        echo 'RemainAfterExit=yes'
    } > "$pkgdir/usr/lib/systemd/system/evic-usb-rtc-sync.service"

    {
        echo "# HIDAPI/libusb RTC Sync"
        echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="5020", RUN+="/usr/bin/systemctl restart evic-usb-rtc-sync"'
    } > "$pkgdir/usr/lib/udev/rules.d/99-nuvoton-hid-rtc-sync.rules"
}
