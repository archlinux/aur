# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-base
pkgname=$_pkgname-git
pkgver=v5.5.0.beta1.362.gec8c1dc
pkgrel=1
pkgdesc="A cross-platform application and UI framework"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=(
	"dbus" "xcb-util-keysyms" "xcb-util-wm" "xcb-util-image"
	"libxext" "inputproto" "libgl" "libxkbcommon" "systemd"
	"libpng" "sqlite" "fontconfig" "icu" "libxrender" "libinput"
)
makedepends=("git" "postgresql-libs")
optdepends=(
	"qtchooser: set the default Qt toolkit"
	"postgresql-libs: PostgreSQL driver"
	"libmariadbclient: MariaDB driver"
	"unixodbc: ODBC driver"
	"libfbclient: Firebird/iBase driver"
)
provides=("$_pkgname")
conflicts=("$_pkgname" "qtchooser")
source=("$_pkgname::git://code.qt.io/qt/qtbase.git#branch=5.5")

sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/{g++,gcc}-base.conf
	sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" "mkspecs/common/gcc-base-unix.conf"
	sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" "mkspecs/common/gcc-base.conf"
}

build() {
	cd "$srcdir/$_pkgname"

	./configure -confirm-license -opensource \
		-prefix /usr \
		-bindir /usr/lib/qt/bin \
		-docdir /usr/share/doc/qt \
		-headerdir /usr/include/qt \
		-archdatadir /usr/lib/qt \
		-datadir /usr/share/qt \
		-sysconfdir /etc/xdg \
		-examplesdir /usr/share/doc/qt/examples \
		-system-sqlite \
		-openssl-linked \
		-nomake examples \
		-nomake tests \
		-no-rpath \
		-optimized-qmake \
		-dbus-linked \
		-reduce-relocations \
		-opengl es2 \
		-libinput
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make INSTALL_ROOT="$pkgdir" install
      for file in "${pkgdir}"/usr/lib/qt/bin/*; do
              mkdir -p "${pkgdir}"/usr/bin
              ln -s /usr/lib/qt/bin/$(basename $file) "${pkgdir}"/usr/bin/$(basename $file)
      done
}
