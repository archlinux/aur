# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5.6
pkgver=5.6.2
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('libjpeg-turbo' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-image'
         'icu' 'tslib' 'libinput' 'libxkbcommon-x11' 'jasper' 'libmng'
	 'libwebp' 'libpulse' 'openal' 'libxcomposite' 'pciutils'  'libxss'
	 'libvpx' 'opus' 'libevent' 'jsoncpp' 'snappy' 'nss' 'libxslt'
	 'gst-plugins-base-libs')
makedepends=('mtdev' 'libfbclient' 'libmariadbclient' 'unixodbc' 'alsa-lib' 
             'postgresql-libs' 'gtk2' 'cups' 'freetds' 'bluez-libs' 'python2'
	     'libxcursor' 'libxrandr' 'git' 'gperf' 'python')
optdepends=('qt5-svg: to use SVG icon themes'
            'postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'freetds: MS SQL driver'
            'mtdev: evdev plugin'
            'gtk2: GTK2 plugin'
	    'bluez-libs: for sdpscanner')
_tarname="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/single/${_tarname}.tar.xz")
md5sums=('5175fba2f221fd4c91e94771a57a5557')

prepare() {
    cd ${_tarname}

    find . -name '*.py' -exec sed -i \
        's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +
}

build() {
    cd ${_tarname}
    local qt5_src="/opt/qt5.6"

    PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource \
        -prefix /opt/qt5.6 \
        -nomake examples \
        -no-use-gold-linker \
        -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
        -optimized-qmake \
        -openssl-linked \
        -system-sqlite \
        -system-pcre \
        -system-harfbuzz
  make
}

package() {
    cd ${_tarname}
    make INSTALL_ROOT="${pkgdir}" install

    install -D -m644 LGPL_EXCEPTION.txt \
        "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
