# Maintainer: willemw <willemw12@gmail.com>
# Contributor: unclesam <web _AT_ shinobi-mail _DOT_ de>

pkgname=mintstick-git
pkgver=r306.261a4b1
pkgrel=1
pkgdesc='Format or write images to USB sticks (Linux Mint tool)'
arch=(any)
url=https://github.com/linuxmint/mintstick
license=(GPL)
depends=(cdrtools dosfstools e2fsprogs exfat-utils ntfsprogs procps python-dbus python-gobject python-pyparted python-unidecode python-xapp udisks2 xapps)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i -e '/.*kde4.*/d' \
    -e 's| /usr| usr|' \
    -e 's| usr| "'"$pkgdir"'"/usr|' \
    -e 's|^|cp -r |' \
    $pkgname/debian/install
}

package() {
  install -Dm644 $pkgname/debian/mintstick.1 -t "$pkgdir/usr/share/man/man1"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/mintstick"
  install -dm755 "$pkgdir/usr/share/"{applications,icons,mintstick,nemo/actions,polkit-1/actions}

  cd $pkgname
  sh ./debian/install
}
