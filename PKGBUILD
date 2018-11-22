# Maintainer: Skjnldsv <skjnldsv at protonmail com>

pkgname=gnome-pomodoro-git
pkgver=r1007.4e7c274
pkgrel=1
_gitbranch='master'
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'gstreamer' 'gobject-introspection' 'libpeas' 'appstream-glib' 'gom')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x' 'perl-xml-sax-expat' 'gom')
conflicts=('gnome-pomodoro' 'gnome-shell-pomodoro')
provides=('gnome-pomodoro')
source=("$pkgname"::"git+https://github.com/codito/gnome-pomodoro.git#branch=${_gitbranch}")
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
  #sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile.am

  # https://github.com/codito/gnome-pomodoro/issues/332
  sed -i "s/\[ \$datadir\/ = \/usr\/share\/\*/[ \"\$datadir\/\" = \"\/usr\/share\/\"/" configure.ac

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
