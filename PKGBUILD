# Contributor: dhamp <dhamp@ya.ru>

_name=eiskaltdcpp
_tarver=2.2.10
pkgbase=${_name}
pkgname=(${_name}-gtk ${_name}-qt ${_name}-daemon ${_name}-core ${_name}-data)
pkgver=${_tarver}
pkgrel=2
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h')
url="http://code.google.com/p/eiskaltdc/"
options=(!emptydirs)
source=(https://github.com/${_name}/${_name}/archive/v${_tarver}.tar.gz)
sha256sums=('e461c8c499e459651d6382a6ded6788e5ac9a9c4ff26386c3cf073d94d606127')
makedepends=(gcc make cmake gtk2 libnotify qt4 bzip2 openssl lua52 libidn pcre)

build() {
    cd ${srcdir}/${_name}-${_tarver}
    rm -rf ${srcdir}/${_name}-${_tarver}/build
    mkdir ${srcdir}/${_name}-${_tarver}/build
    cd ${srcdir}/${_name}-${_tarver}/build
    cmake ../ -DENABLE_STACKTRACE=ON -DCMAKE_INSTALL_PREFIX=/usr -DUSE_MINIUPNP=ON -DLOCAL_MINIUPNP=ON -DPERL_REGEX=ON -DLOCAL_BOOST=ON -DLUA_SCRIPT=ON -DWITH_LUASCRIPTS=ON -DWITH_DHT=ON -DUSE_QT=OFF
}

package_eiskaltdcpp-gtk() {
    depends=(gtk2 libnotify desktop-file-utils ${_name}-core ${_name}-data)
    pkgdesc="EiskaltDC++: Gtk2-based DC and ADC client based on dcpp core"
    conflicts=(${_name}-gtk )
    provides=(${_name}-gtk)
    install=${_name}.install
    cd ${srcdir}/${_name}-${_tarver}/build
    cmake ../ -DUSE_GTK=ON
    make --no-print-directory -C cmake
    make --no-print-directory -C ${_name}-gtk DESTDIR=${pkgdir} install clean

}
package_eiskaltdcpp-qt() {
    depends=(qt4 ${_name}-core ${_name}-data)
    optdepends=('aspell: spellchecking'
                'qtscriptgenerator: need for qtscript')
    pkgdesc="EiskaltDC++: Qt4-based DC and ADC client based on dcpp core"
    conflicts=(${_name}-qt)
    provides=(${_name}-qt)
    install=${_name}.install
    cd ${srcdir}/${_name}-${_tarver}/build
    cmake ../  -DUSE_JS=ON -DUSE_QT=ON
    make --no-print-directory ${_name}-qt_tr
    make --no-print-directory -C ${_name}-qt DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-cli() {
    arch=('any')
    depends=(${_name}-daemon ${_name}-data perl-term-shellui perl-data-dump perl-json-rpc)
    pkgdesc="EiskaltDC++ cli interface for daemon with xmlrpc"
    cd ${srcdir}/${_name}-${_tarver}/build
    make --no-print-directory -C ${_name}-cli DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-daemon() {
    depends=(${_name}-core ${_name}-data gcc-libs)
    pkgdesc="EiskaltDC++ Daemon"
    conflicts=(${_name}-daemon)
    provides=(${_name}-daemon)
    cd ${srcdir}/${_name}-${_tarver}/build
    cmake ../ -DNO_UI_DAEMON=ON -DJSONRPC_DAEMON=ON
    make --no-print-directory -C ${_name}-daemon DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-core() {
    depends=(bzip2 openssl lua52 libidn pcre)
    pkgdesc="EiskaltDC++ Core"
    conflicts=(${_name}-core)
    provides=(${_name}-core)
    cd ${srcdir}/${_name}-${_tarver}/build
    make --no-print-directory -C cmake
    make --no-print-directory -C dcpp DESTDIR=${pkgdir} install clean
}

package_eiskaltdcpp-data() {
    arch=('any')
    depends=(sh bash hicolor-icon-theme)
    optdepends=('php: needed for some optional scripts')
    conflicts=(${_name}-data)
    provides=(${_name}-data)
    install=${_name}.install
    pkgdesc="EiskaltDC++ Data files"
    cd ${srcdir}/${_name}-${_tarver}/build
    make --no-print-directory -C data DESTDIR=${pkgdir} install clean
}
