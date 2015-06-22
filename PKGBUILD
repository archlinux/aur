#Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=nautilus-git
pkgver=3.15.90.17991.be33b71
pkgrel=1
pkgdesc="GNOME file manager"
arch=(i686 x86_64)
url="http://live.gnome.org/Nautilus"
license=('GPL')
depends=('libexif' 'gnome-desktop' 'exempi' 'gvfs' 'desktop-file-utils' 'gnome-icon-theme' 'dconf' 'libtracker-sparql' 'libnotify' 'glib2-git' 'gtk3-git')
makedepends=('git' 'intltool' 'gobject-introspection')
conflicts=('nautilus' 'libnautilus-extension')
provides=('nautilus' 'libnautilus-extension')
options=(!makeflags !emptydirs)
install=nautilus.install
source=("git+git://git.gnome.org/nautilus" "nautilus.install")
_gitname="nautilus"

md5sums=("SKIP" "6e2d69ac9680bd51414d284081117036")

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | grep AC_INIT configure.ac | sed 's/AC_INIT(\[nautilus\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=nautilus\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash  
}

build() {
  cd $_gitname
   ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-nst-extension \
      --disable-update-mimedb \
      --disable-schemas-compile
   make
}

package() {
  cd $_gitname
	make DESTDIR=$pkgdir install
}
