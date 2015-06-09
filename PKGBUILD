# Maintainer: CanalGuada <dguadal at free dot fr>
# Author: horst3180 @ deviantart

pkgname=vertex-themes-git
pkgver=r498.20150425
pkgrel=1
pkgdesc='Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.16 version)'
_gnomever=3.16
arch=('any')
url='http://horst3180.deviantart.com/art/Vertex-Theme-470663601'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('vertex-themes')
conflicts=('vertex-themes')
source=($pkgname::git+https://github.com/horst3180/Vertex-theme.git)
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
  for name in "Chrome" "Firefox" "Vertex-Plank" "Vertex_alt_metacity"; do
    find "$name" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
  done

  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/themes/Vertex/README"
}

# vim: ts=2 sw=2 et:
