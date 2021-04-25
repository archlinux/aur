# Maintainer: Jakub Szymański <jakubmateusz@poczta.onet.pl>
pkgname=woeusb-ng
pkgver=0.2.7
pkgrel=3
pkgdesc="Simple tool that enable you to create your own usb stick with Windows installer."
arch=('any')
url="https://github.com/WoeUSB/WoeUSB-ng"
license=('GPL3')
depends=(
    'parted'
    'dosfstools'
    'ntfs-3g'
    'grub'
    'p7zip'
    'python'
    'python-pip'
    'python-wxpython'
    'xdg-utils'
    'python-termcolor'
    )
makedepends=(
    'python-setuptools'
)
provides=('woeusb')
conflicts=(
    'woeusb'
    'woeusb-git'
)
source=(
    "https://github.com/WoeUSB/WoeUSB-ng/archive/v$pkgver.tar.gz"
    "com.github.woeusb.woeusb-ng.policy"
)
sha256sums=(
    "4546ca5cf703434602b9dac2724cbfe791bbbc21c9b72d01c655ff7b89d69672"
    "6700f9f324723447b9f5d69b940f3ae0b0dd8d1bfc65878f34990a8554482d06"
)


build() {
    cd WoeUSB-ng-$pkgver

    python setup.py build
}

package() {
    cd WoeUSB-ng-$pkgver

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/WoeUSB-ng
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/polkit-1/actions

    # scripts
    cp WoeUSB/woeusb WoeUSB/woeusbgui $pkgdir/usr/bin

    # icon
    cp WoeUSB/data/icon.ico $pkgdir/usr/share/icons/WoeUSB-ng/icon.ico

    # shortcut
    cp miscellaneous/WoeUSB-ng.desktop $pkgdir/usr/share/applications/WoeUSB-ng.desktop
    chmod 755 $pkgdir/usr/share/applications/WoeUSB-ng.desktop

    # policy
    cp ../com.github.woeusb.woeusb-ng.policy $pkgdir/usr/share/polkit-1/actions/com.github.woeusb.woeusb-ng.policy
}
