# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Andersson <marcus@tojoma-se>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Stefan-Husmann@t-online.de
# Contributor: Army

_pkgname=dunst
pkgname=${_pkgname}-git
pkgver=1.6.1.r13.g3acffdb
pkgrel=1
pkgdesc="A highly configurable and lightweight notification daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://dunst-project.org/"
license=('BSD')
depends=('libxinerama' 'libxss' 'pango' 'libnotify' 'gdk-pixbuf2' 'libxdg-basedir' 'libxrandr')
makedepends=('git' 'perl' 'dbus' 'wayland-protocols' 'wayland')
provides=('dunst' 'notification-daemon')
conflicts=('dunst')
source=('git+https://github.com/dunst-project/dunst.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm755 dunstify "${pkgdir}"/usr/bin/dunstify
  install -Dm755 contrib/dunst_espeak.sh "${pkgdir}"/usr/bin/dunst_espeak.sh
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
