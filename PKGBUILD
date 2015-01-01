# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Jacco Koning <archlinux@menollo.nl>, with help from qwak
# Contributor: twa022 <twa022@gmail.com>

pkgname=usb-creator
pkgver=0.2.63
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://launchpad.net/usb-creator"
license=('GPL3')
depends=('udisks2' 'syslinux' 'parted' 'dosfstools' 'mtools' 'cdrkit'
         'python-dbus' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-distutils-extra')
optdepends=('kdebindings-python: for KDE frontend' 'gtk3: for GTK frontend')
install=usb-creator.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz"
        "remove-ubuntu-version-check.patch")
sha256sums=('852967391ded96c4fa5b0e4c11c83f7a1fdac12a437670d6673b3921943aa59f'
            'bdc29966cda4921e395b07530e0d6a0bda81f99d4b0948fadfda983e05ab51cb')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 < ../remove-ubuntu-version-check.patch
  # fix location of bootsector for syslinux 6.xx
  sed 's|mbr/mbr.bin|bios/mbr.bin|' -i bin/usb-creator-helper
}

package() {
  cd $pkgname-$pkgver

  python3 setup.py install --root="$pkgdir/" --optimize=1

  # FIXME by adaptee:
  # That setup.py is written with the assumption that /usr/share/kde4/apps is part of
  # $(kde-prefix --path data), which is true for ubuntu. But this assumption does not
  # hold in archlinux, which will make usb-creator-kde fail to load its ui file.
  # So we must put usbcreator-kde.ui to an appropriate place!
  install -Dm0644 gui/usbcreator-kde.ui "$pkgdir"/usr/share/apps/usb-creator-kde/usbcreator-kde.ui

  # FIXME: install manual pages
  install -d "$pkgdir"/usr/share/man/man8
  install -Dm0644 man/$pkgname-{gtk,kde}.8 "$pkgdir"/usr/share/man/man8
}
