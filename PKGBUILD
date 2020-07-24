# Maintainer: Jakub Szymański <jakubmateusz@poczta.onet.pl>
pkgname=woeusb-ng
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple tool that enable you to create your own usb stick with Windows installer."
arch=('any')
url="github.com/WoeUSB/WoeUSB-ng"
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
    )
makedepends=(
    'git'
    'python-setuptools'
)
optdepends=('python-termcolor: Colored text')
provides=('woeusb')
conflicts=(
    'woeusb'
    'woeusb-git'
)
source=(
    "git+https://github.com/WoeUSB/WoeUSB-ng.git"
    "https://gist.githubusercontent.com/WaxyMocha/afa345e9fc3b8247a57ebaf5a0e283a4/raw/e632fc75fd4f7e35999047a5e837183610250926/AUR.patch"
)
sha256sums=(
    'SKIP'
    '7c907d370f9f8c5e1dcd8e74b880891ae8eb55cbea74a5b4a12beadb083d5d75'
)


build() {
    cd WoeUSB-ng

    git checkout v$pkgver
    git apply ../AUR.patch || echo "Failed to apply patch"

    python setup.py build
}

package() {
    cd WoeUSB-ng

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
    cp miscellaneous/com.github.woeusb.woeusb-ng.policy $pkgdir/usr/share/polkit-1/actions/com.github.woeusb.woeusb-ng.policy
}