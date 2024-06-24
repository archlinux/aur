# Maintainer: willemw <willemw12@gmail.com>

pkgname=btrfsmaintenance-git
pkgver=0.5.1.r0.gd707c83
pkgrel=1
pkgdesc='Btrfs maintenance scripts'
arch=(any)
url=https://github.com/kdave/btrfsmaintenance
license=(GPL-2.0-or-later)
depends=(btrfs-progs)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(etc/default/btrfsmaintenance)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #sed -i 's| /usr/share| "'$pkgdir'"/usr/share|g' $pkgname/dist-install.sh
  sed -i 's|/etc/sysconfig/|/etc/default/|' $pkgname/btrfsmaintenance-refresh.path
}

package() {
  cd $pkgname

  install -Dm644 sysconfig.btrfsmaintenance "$pkgdir/etc/default/btrfsmaintenance"

  install -Dm644 btrfsmaintenance-refresh.path -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ./*.service ./*.timer -t "$pkgdir/usr/lib/systemd/system"

  install -Dm755 btrfs-*.sh btrfsmaintenance-refresh-cron.sh -t "$pkgdir/usr/share/btrfsmaintenance"
  install -Dm644 btrfsmaintenance-functions README.md -t "$pkgdir/usr/share/btrfsmaintenance"

  #./dist-install.sh "$pkgdir/etc/default"
}
