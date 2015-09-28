# Maintainer: Pablo Lezaeta <prflr88@gmai.com>

pkgname=fluxdgmenu
pkgver=r62
pkgrel=1
pkgdesc="Fluxdgmenu is an automated XDG Menu system for Fluxbox."
arch=("i686" "x86_64")
url="https://github.com/shimmerproject/Albatross"
license=("GPL")
depends=("inotify-tools" "python2-xdg" "fluxbox")
makedepends=("git")
provides=("fluxdgmenu" "fluxdgmenu-git")
conflicts=("fluxdgmenu-git")
optdepends=("python2-gtk2: enables fluxdgmenu to use your current GTK icon theme"
	"python2-gmenu: makes menu generation 10 times faster..."
	"python2-gobject: enables the recently used files menu to display item icons according to their mime type."
	"zenity: enables fluxdgmenu to display progressbars during menu generation.")
source=("Fluxdgmenu::git+https://github.com/ju1ius/fluxdgmenu.git")
md5sums=("SKIP")

prepare() {
  cd "${srcdir}/Fluxdgmenu"

# Fix python version
  sed -i "s|\(env python\).*|\12|" $(grep -rl "env python" .)

# Fix misussed variables or missing variables  
  sed -i "s|install -m 0755 debian/|#install -m 0755 debian/postinst|g" Makefile

# Fix compilatio error
  cp -r ./usr/lib/fluxdgmenu/fxm ./usr/lib/fluxdgmenu/fluxdgmenu
}

pkgver() {
  cd "Fluxdgmenu"
  echo r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

build() {
  cd "${srcdir}/Fluxdgmenu"

  make DESTDIR="${pkgdir}" prefix=/usr \
	bindir=/usr/bin sbindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib/fluxdgmenu \
	sysconfdir=/etc
}

package() {
  cd "${srcdir}/Fluxdgmenu"

# Not respect DESTDIR var
  make DESTDIR="${pkgdir}" prefix="${pkgdir}"/usr sysconfdir="${pkgdir}"/etc install

# install -d "${pkgfile}/usr/lib/fluxdgmenu/fluxdgmenu/adapters"
}
