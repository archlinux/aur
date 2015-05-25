# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Jacco Koning <archlinux@menollo.nl>, with help from qwak
# Contributor: twa022 <twa022@gmail.com>

pkgname=usb-creator
pkgver=0.2.67
pkgrel=2
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://launchpad.net/usb-creator"
license=('GPL3')
depends=('udisks2' 'syslinux' 'parted' 'dosfstools' 'mtools' 'cdrkit'
         'python-dbus' 'python-gobject' 'python-debian' 'hicolor-icon-theme')
makedepends=('python-distutils-extra')
optdepends=('python-pyqt5: for KDE/QT5 frontend' 'gtk3: for GTK frontend')
install=usb-creator.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz"
        "$pkgname-fake-ubuntu-version.patch")
sha256sums=('5671093e446b7a2a3d76c23dcfa9d6f95ad8aae6e1dcdfed8530163b05e1596a'
            '6e67acd7a0364e121bbf6a838b6234b2c919aa7920d562f90350b0178d0aa232')

prepare() {
  cd $pkgname-$pkgver

  # fake a recent ubuntu LTS version and
  # fix the location of syslinux 6.xx bootsector
  patch -Np1 < ../$pkgname-fake-ubuntu-version.patch
}

package() {
  cd $pkgname-$pkgver

  python3 setup.py install --root="$pkgdir/" --optimize=1

  # FIXME: install manual pages
  install -d "$pkgdir"/usr/share/man/man8
  install -Dm0644 man/$pkgname-{gtk,kde}.8 "$pkgdir"/usr/share/man/man8
}
