# Maintainer:
# Contributor: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Zack Emmert <zemmert@fastmail.com>
# Contributor: Angel_Caido <geussepe at gmail dot com>

_pkgname="multibootusb"
pkgname="$_pkgname"
pkgver=9.2.0
pkgrel=6
pkgdesc="Boot multiple live Linux distros from a usb flash drive"
url="https://github.com/mbusb/multibootusb"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  '7zip'
  'mtools'
  'parted'
  'python'
  'python-dbus'
  'python-pyqt5'
  'python-pyudev'
)
makedepends=(
  'python-setuptools'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
  "fixes.patch"
)
sha256sums=(
  '1f1539e11e5ac8af2fc2379a22c2ad6b73759b2babbc165f7ff716240e922d7d'
  'f30e85800d1d1d6f78d4df3110ecfc2ce0eed9326434a2b22b62653bb7f92fd8'
)

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -i "$srcdir/fixes.patch"
}

build() {
  cd "$_pkgsrc"
  python setup.py build
}

package() {
  cd "$_pkgsrc"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  sed -i "s/\/usr\/local\/bin/\/usr\/bin/" "$pkgdir/usr/share/polkit-1/actions/org.debian.pkexec.run-multibootusb.policy"
}
