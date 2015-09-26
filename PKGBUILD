# Contributor: dhamp <dhamp@ya.ru>

_name=eiskaltdcpp
pkgbase=${_name}-git
pkgname=${_name}-git
pkgname=(${_name}-gtk-git ${_name}-qt-git ${_name}-daemon-git ${_name}-core-git ${_name}-data-git)
pkgver=v2.2.10.82.g31355fd
pkgrel=1
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'arm' 'armv7h' 'armv6h')
url="http://code.google.com/p/eiskaltdc/"
conflicts=('eiskaltdcpp')
options=(!emptydirs)
source=(git://github.com/${_name}/${_name}.git)
sha1sums=('SKIP')
makedepends=(gcc make cmake gtk2 libnotify qt4 bzip2 openssl lua52 libidn pcre)

pkgver() {
  cd ${_name}
  git describe --tags | tr '-' '.'
  #echo $(grep -m 2 -A 1 "EiskaltDC++" CMakeLists.txt | grep -o "[[:digit:]]*" | tr '\n' '.')$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd ${srcdir}/${_name}
    rm -rf ${srcdir}/${_name}/build
    mkdir ${srcdir}/${_name}/build
    cd ${srcdir}/${_name}/build
    cmake ../ -DENABLE_STACKTRACE=ON -DCMAKE_INSTALL_PREFIX=/usr -DUSE_MINIUPNP=ON -DLOCAL_MINIUPNP=ON -DPERL_REGEX=ON -DLOCAL_BOOST=ON -DLUA_SCRIPT=ON -DWITH_LUASCRIPTS=ON -DWITH_DHT=ON -DUSE_QT=OFF
}

package_eiskaltdcpp-gtk-git() {
    depends=(gtk2 libnotify desktop-file-utils ${_name}-core-git ${_name}-data-git)
    pkgdesc="EiskaltDC++: Gtk2-based DC and ADC client based on dcpp core"
    conflicts=(${_name}-gtk ${_name})
    provides=(${_name}-gtk)
    install=${_name}.install
    cd ${srcdir}/${_name}/build
    cmake ../ -DUSE_GTK=ON
    make --no-print-directory -C cmake
    make --no-print-directory -C ${_name}-gtk DESTDIR=${pkgdir} install clean

}
package_eiskaltdcpp-qt-git() {
    depends=(qt4 ${_name}-core-git ${_name}-data-git)
    optdepends=('aspell: spellchecking'
                'qtscriptgenerator: need for qtscript')
    pkgdesc="EiskaltDC++: Qt4-based DC and ADC client based on dcpp core"
    conflicts=(${_name}-qt)
    provides=(${_name}-qt)
    install=${_name}.install
    cd ${srcdir}/${_name}/build
    cmake ../  -DUSE_JS=ON -DUSE_QT=ON
    make --no-print-directory ${_name}-qt_tr
    make --no-print-directory -C ${_name}-qt DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-cli-git() {
    arch=('any')
    depends=(${_name}-daemon-git ${_name}-data-git perl-term-shellui perl-data-dump perl-json-rpc)
    pkgdesc="EiskaltDC++ cli interface for daemon with xmlrpc"
    cd ${srcdir}/${_name}/build
    make --no-print-directory -C ${_name}-cli DESTDIR=${pkgdir} install clean
}
package_eiskaltdcpp-daemon-git() {
    depends=(${_name}-core-git ${_name}-data-git gcc-libs)
    pkgdesc="EiskaltDC++ Daemon"
    conflicts=(${_name}-daemon)
    provides=(${_name}-daemon)
    cd ${srcdir}/${_name}/build
    cmake ../ -DNO_UI_DAEMON=ON -DJSONRPC_DAEMON=ON
    make --no-print-directory -C ${_name}-daemon DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-core-git() {
    depends=(zlib bzip2 openssl lua52 libidn pcre)
    pkgdesc="EiskaltDC++ Core"
    conflicts=(${_name}-core)
    provides=(${_name}-core)
    cd ${srcdir}/${_name}/build
    make --no-print-directory -C cmake
    make --no-print-directory -C dcpp DESTDIR=${pkgdir} install
}

package_eiskaltdcpp-data-git() {
    arch=('any')
    depends=(sh bash hicolor-icon-theme)
    optdepends=('php: needed for some optional scripts')
    conflicts=(${_name}-data)
    provides=(${_name}-data)
    install=${_name}.install
    pkgdesc="EiskaltDC++ Data files"
    cd ${srcdir}/${_name}/build
    make --no-print-directory -C data DESTDIR=${pkgdir} install clean
}

