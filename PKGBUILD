# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-base
pkgname=$_pkgname-dev-git
pkgver=5.5.1.r134.gb5ea7a5
pkgrel=1
pkgdesc="A cross-platform application and UI framework"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=(
	"dbus" "xcb-util-keysyms" "xcb-util-wm" "xcb-util-image"
	"libxext" "inputproto" "libgl" "libxkbcommon" "systemd"
	"libpng" "sqlite" "fontconfig" "icu" "libxrender" "libinput" "qtchooser"
)
makedepends=("git" "postgresql-libs" "gtk2")
optdepends=(
	"postgresql-libs: PostgreSQL driver"
	"libmariadbclient: MariaDB driver"
	"unixodbc: ODBC driver"
	"libfbclient: Firebird/iBase driver"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://code.qt.io/qt/qtbase.git#branch=5.5"
		"0001-Add-a-way-to-filter-window-system-events.patch")
sha256sums=('SKIP'
            '08eea1d78e1cde123e0a5c799c91b8261239b107b8eca27409e08f8edb1b0b36')

pkgver() {
	cd "$srcdir/$_pkgname"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/{g++,gcc}-base.conf
	sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" "mkspecs/common/gcc-base-unix.conf"
	sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" "mkspecs/common/gcc-base.conf"

	git apply ../0001-Add-a-way-to-filter-window-system-events.patch
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
    -egl \
    -eglfs \
    -libinput
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
