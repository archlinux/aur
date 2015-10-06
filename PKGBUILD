# Please report PKGBUILD bugs at
# https://github.com/ystein/archlinux-aur-packages

# Maintainer: Yannik Stein <yannik.stein [at] gmail.com>
# Submitter:  Yannik Stein <yannik.stein [at] gmail.com>

pkgname=rhythmbox-tray-icon-git
pkgrel=2
pkgver=159f882
pkgdesc="Restores the tray icon functionality from the 0.x series. Please \
report PKGBUILD bugs at https://github.com/ystein/archlinux-aur-packages."

arch=('any')
url="http://github.com/palfrey/rhythmbox-tray-icon"
license=('GPL3')
provides=('rhythmbox-tray-icon')
conflicts=('rhythmbox-tray-icon')
depends=('rhythmbox>=2.90' 'python-cairo' 'gnome-icon-theme')
makedepends=('git')

source=("$pkgname::git+https://github.com/palfrey/rhythmbox-tray-icon.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $pkgname
  while read instruction; do
      file=$(echo $instruction | awk '{ print $1 }')
      dest=$(echo $instruction | awk '{ print $2 }')
      install -D -m644 "$file" "$pkgdir/$dest/$file"
  done < "debian/install"
  # replace plugin loader by python3
  sed -i -e 's/Loader=python/&3/' \
    "$pkgdir/usr/lib/rhythmbox/plugins/tray-icon/tray_icon.plugin"
  # fix incosistend use of tabs and spaces in python file
  sed -i -e '33s/^ //' \
    "$pkgdir/usr/lib/rhythmbox/plugins/tray-icon/tray_icon.py"
}
