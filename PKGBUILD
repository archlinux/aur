# Maintainer: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-base
pkgname=$_pkgname-git
pkgver=5.12.0.r981.g481db443d5
pkgrel=1
arch=("i686" "x86_64")
url='https://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc="A cross-platform application and UI framework"
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'libgl' 'fontconfig'
         'xcb-util-wm' 'libxrender' 'libxi' 'sqlite' 'xcb-util-image' 'icu'
         'tslib' 'libinput' 'libsm' 'libxkbcommon-x11' 'libproxy')
makedepends=('mtdev' 'libfbclient' 'libmariadbclient' 'sqlite' 'unixodbc' 'postgresql-libs' 'alsa-lib' 'gst-plugins-base-libs'
             'gtk3' 'libpulse' 'cups' 'freetds' 'git')
optdepends=('qt5-svg: to use SVG icon themes'
            'postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'mtdev: evdev plugin'
            'gtk3: GTK platform plugin')
provides=("$_pkgname")
conflicts=("$_pkgname" "qtchooser")
source=("$_pkgname::git://code.qt.io/qt/qtbase.git#branch=dev")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/gcc-base.conf

  # Build qmake using Arch {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
    mkspecs/common/g++-unix.conf

  # Use python2 for Python 2.x
  find . -name '*.py' -exec sed -i \
    's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=/usr/bin/python2 ./configure -I/usr/include/mysql -confirm-license -opensource -v \
    -prefix /usr \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -no-use-gold-linker \
    -reduce-relocations

  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
