# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>
# Arch Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-git
pkgver=3.56.0+0+gb0c7ca0
pkgrel=1
pkgdesc="Menu editor for gnome. Git version."
arch=(any)
license=('LGPL-2.0-or-later')
url="https://gitlab.gnome.org/GNOME/alacarte"
depends=(
  gdk-pixbuf2
  glib2
  gnome-menus
  gtk3
  hicolor-icon-theme
  python
  python-cairo
  python-gobject
)

makedepends=(
  docbook-xsl
  git
  libxslt
)

provides=("alacarte="$pkgver)
replaces=("alacarte")
conflicts=("alacarte")
source=('git+https://gitlab.gnome.org/GNOME/alacarte.git')
sha256sums=('SKIP')

pkgver() {
  cd alacarte
  git describe --long | sed 's/-/+/g'
}

prepare() {
  cd alacarte
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
  )

  cd alacarte
  ./configure "${configure_options[@]}"
  make
}

package() {
  make -C alacarte DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}
