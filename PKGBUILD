# Maintainer: willemw <willemw12@gmail.com>
# Contributor: unclesam <web _AT_ shinobi-mail _DOT_ de>

pkgname=mintstick-git
pkgver=r245.b7f43d2
pkgrel=1
pkgdesc="Format or write images to USB sticks (Linux Mint tool)"
arch=('any')
url="https://github.com/linuxmint/mintstick"
license=('GPL')
depends=('dosfstools' 'python-dbus' 'python-gobject' 'python-pyparted' 'python-xapp' 'udisks2' 'xapps')
optdepends=('dosfstools: FAT filesystems' 'e2fsprogs: Ext filesystems' 'ntfs-3g: NTFS filesystems')
makedepends=('git')
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
         -e 's/mintstick.glade//g' \
         -e 's/org.linuxmint.im.policy/com.linuxmint.mintstick.policy/g' \
         -e 's| /usr| "'$pkgdir'"/usr|g' \
         $pkgname/install.sh
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/"{applications,polkit-1/actions}

  cp -a $pkgname/share/nemo "$pkgdir/usr/share"

  cd $pkgname
  ./install.sh
}

