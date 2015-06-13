# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Hagen Schink <troja84@googlemail.com>

pkgname=gtkparasite-git
pkgver=0.3.0.r95.445cd7a
pkgrel=2
pkgdesc="GTK+ debugging and development tool for GTK+3 applications"
url=http://chipx86.github.io/gtkparasite/
arch=(i686 x86_64)
license=(MIT)
depends=('python2' 'gtksourceview3' 'gsettings-desktop-schemas')
makedepends=('git' 'gnome-common')
options=(!libtool)
source=("${pkgname}"::"git://github.com/chipx86/${pkgname%%-*}.git")
sha256sums=('SKIP')
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname}"
  echo $(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  # Replace old AutoMake macro with new one
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' "${pkgname}/configure.ac"
}

build() {
  cd "${pkgname}"
  PYTHON=python2 ./autogen.sh --prefix=/usr --with-gtk=3.0
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

