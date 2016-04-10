# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-pomodoro-git
pkgver=r737.adfe069
pkgrel=1
_gitbranch='master'
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-shell-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gobject-introspection' 'perl-xml-sax-expat' 'telepathy-glib')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x')
conflicts=('gnome-shell-pomodoro')
provides=('gnome-shell-pomodoro')
source=("$pkgname"::"git+https://github.com/codito/gnome-shell-pomodoro.git#branch=${_gitbranch}")
sha256sums=('SKIP')
install='gschemas.install'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  # Fixes some build issues when 'docbook2x' package is installed
  # Big thanks to user maus25 for the fix
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile.am

  ./autogen.sh --prefix=/usr --datadir=/usr/share
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
