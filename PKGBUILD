# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=grub-reboot-picker
pkgver=0.0.6
pkgrel=1
pkgdesc="Tray application to reboot into different OSes or UEFI/BIOS"
arch=('any')
url="https://github.com/mendhak/grub-reboot-picker"
license=('MIT')
depends=('python-gobject' 'python-cairo' 'libappindicator-gtk3' 'grub' 'polkit')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'setup.patch')
sha256sums=('ae85de0b9dfd9648598a380b7db733d6de6562529776e4e2bfbb7b3d9b80c3fe'
            '53697a6925981cf83c3c67fed1646fff9a3800ce43994f7da94526151b285bb2')

prepare() {
  cd "$pkgname-$pkgver"
  patch --verbose -p0 < "$srcdir/setup.patch"

  sed -i 's/un-reboot/system-reboot-symbolic/g' \
    "src/$pkgname.py" \
    com.mendhak.grubrebootpicker.desktop \
    com.mendhak.grubrebootpicker.policy

  sed -i 's/sbin/bin/g' \
    com.mendhak.grubrebootpicker.desktop \
    com.mendhak.grubrebootpicker.policy

  if [[ -d "$pkgname" ]]; then
    rm -rf "$pkgname"
  fi
  mv src "$pkgname"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
