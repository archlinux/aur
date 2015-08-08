# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Lauri JÃ¤ntti <janttilauri at gmail.com>

pkgname=openbox-multihead-git
_gitname=openbox-multihead
pkgver=7460.4e7c884
pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="A window manager for the X11 windowing system with multihead support"
arch=('i686' 'x86_64')
license=('GPL')
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr' \
         'libxcursor' 'pango' 'imlib2')
optdepends=('pyxdg: for the xdg-autostart script' 'xpybutil: for ob-visible-desks')
makedepends=('git' 'docbook-to-man')
url="https://github.com/BurntSushi/openbox-multihead/blob/multihead/README.MULTIHEAD"
install=openbox.install
options=('!libtool')
backup=('etc/xdg/openbox/menu.xml' 'etc/xdg/openbox/rc.xml')
conflicts=('openbox' 'openbox-git')
provides=('openbox' 'openbox-git')
source=('git+https://github.com/BurntSushi/openbox-multihead.git#branch=multihead')
md5sums=('SKIP')

prepare() {
  cd "$_gitname"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' \
  	  data/autostart/openbox-xdg-autostart
}

build() {
  cd "$_gitname"

  ./bootstrap  
  ./configure --prefix=/usr \
    --with-x \
    --enable-startup-notification \
    --sysconfdir=/etc
  make
}

package(){
  cd "$_gitname"

  make DESTDIR=${pkgdir} install
  sed -i "s:startkde:/opt/kde/bin/\0:" ${pkgdir}/usr/share/xsessions/openbox-kde.desktop
  sed -i "s:=gnome-session:=/usr/bin/gnome-session:" ${pkgdir}/usr/share/xsessions/openbox-gnome.desktop
  install -Dm755 tools/ob-visible-desks "$pkgdir/usr/bin/ob-visible-desks"
}

