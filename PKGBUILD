# Maintainer: CanalGuada <dguadal at free dot fr>
# Author: horst3180 @ deviantart

pkgname=ceti-2-themes-git
pkgver=r35.20150425
pkgrel=1
pkgdesc='Ceti-2 is a theme for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, etc.'
_gnomever=3.16
arch=('any')
url='http://horst3180.deviantart.com/art/Ceti-2-Theme-489193140'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('ceti-2-themes')
conflicts=('ceti-2-themes')
source=($pkgname::git+https://github.com/horst3180/Ceti-2-theme.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add "r*.*" from package version
	echo "r$_commitCount.$_commitTime"
}

build() {
	cd $pkgname

  ./autogen.sh --prefix=/usr --with-gnome=${_gnomever}
}
package() {
	cd $pkgname

  make DESTDIR="$pkgdir" install
  cd extra
  for name in "Chrome" "Ceti-2-alternative-metacity"; do
    find "$name" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
  done

  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/themes/Ceti-2/README"
}

# vim: ts=2 sw=2 et:
