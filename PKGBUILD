# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: actionless https://actionless.github.io/

pkgname=gtkparasite-gtk2-git
pkgver=0.0.0.r72.555c6ef
pkgrel=1
_gitcommit=0a0c90b7098d8c5b8bc06ecc88459520ad533601
pkgdesc="GTK+ debugging and development tool for GTK+2 applications"
url=http://chipx86.github.io/gtkparasite/
arch=(i686 x86_64)
license=(MIT)
depends=('pygtk' 'gtk2' 'gtksourceview2')
makedepends=('git' 'gnome-common')
options=(!libtool)
source=("${pkgname}"::"git+https://github.com/chipx86/gtkparasite.git#commit=555c6eff07bfe0832abac76467a5469fc6cab844")
sha256sums=('SKIP')
install="${pkgname}.install"
provides=(
	gtkparasite-gtk2
)
conflicts=(
	gtkparasite-gtk2
)

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || (
		echo -n 0.0.0.r$(git log --oneline | wc -l).
		git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	)
}

prepare() {
  cd "${srcdir}/${pkgname}" || exit 2
  # Replace old AutoMake macro with new one
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' "configure.ac"
}

build() {
  cd "${srcdir}/${pkgname}" || exit 2
  autoreconf -fvi
  PYTHON=python2 ./autogen.sh --prefix=/usr --with-gtk=2.0
  make
}

package() {
  cd "${srcdir}/${pkgname}" || exit 2
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
