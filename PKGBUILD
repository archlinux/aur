# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgbase="eiskaltdcpp-git"
pkgname=('eiskaltdcpp-core-git'
         'eiskaltdcpp-qt5-git'
         'eiskaltdcpp-qt4-git'
         'eiskaltdcpp-gtk2-git'
         'eiskaltdcpp-gtk3-git'
         'eiskaltdcpp-daemon-git'
         'eiskaltdcpp-cli-git'
         'eiskaltdcpp-web-git'
         'eiskaltdcpp-data-git')

pkgver=2.3.0.4927.126f287
pkgrel=1
pkgdesc="EiskaltDC++: DC and ADC client based on dcpp core. (GIT Version)"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h')
url='http://code.google.com/p/eiskaltdc'
conflicts=('eiskaltdcpp')
options=('!emptydirs')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp.git')
sha1sums=('SKIP')
makedepends=('cmake'
             'lua'
             'libidn'
             'aspell'
             'attr'
             'wget'
             'boost'
             #'miniupnpc'
             'jsoncpp'
             'qtscriptgenerator'
             'qt5-quick1'
             'qt5-multimedia'
             'qt5-tools'
             'gtk2'
             'gtk3'
             'libnotify'
             'perl-json'
             'perl-json-rpc'
             'perl-rpc-xml'
             'perl-term-shellui'
             )

pkgver() {
  cd eiskaltdcpp
  _ver="$(cat CMakeLists.txt | grep ' (VERSION "' | head -n1 | cut -d '"' -f2)"
  echo $(echo ${_ver}).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    mkdir -p build-core
    mkdir -p build-qt4
    mkdir -p build-qt5
    mkdir -p build-gtk2
    mkdir -p build-gtk3
    mkdir -p build-daemon
    mkdir -p build-cli

    # fix php dependency
    find . -type f -name '*.php' -exec sed 's|php5|php|g' -i '{}' \;
}

build() {
    cd "${srcdir}/build-core"
    msg2 "Build Core"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=OFF \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=OFF \
      -DWITH_SOUNDS=ON
    make --no-print-directory -C cmake
    make --no-print-directory -C dcpp

    cd "${srcdir}/build-qt4"
    msg2 "Build Qt4 Interface"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=ON \
      -DUSE_QT5=OFF \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=OFF \
      -DENABLE_STACKTRACE=ON \
      -DWITH_LUASCRIPTS=ON \
      -DUSE_JS=ON \
      -DUSE_ASPELL=ON
    make --no-print-directory eiskaltdcpp-qt_tr
    make --no-print-directory -C eiskaltdcpp-qt

    cd "${srcdir}/build-qt5"
    msg2 "Build Qt5 Interface"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=ON \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=OFF \
      -DENABLE_STACKTRACE=ON \
      -DWITH_LUASCRIPTS=ON \
      -DUSE_JS=ON \
      -DUSE_ASPELL=ON \
      -DUSE_QT_QML=ON
    make --no-print-directory eiskaltdcpp-qt_tr
    make --no-print-directory -C eiskaltdcpp-qt

    cd "${srcdir}/build-gtk2"
    msg2 "Build GTK2 Interface"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=OFF \
      -DUSE_GTK=ON \
      -DUSE_GTK3=OFF \
      -DENABLE_STACKTRACE=ON \
      -DWITH_LUASCRIPTS=ON
    make --no-print-directory -C cmake
    make --no-print-directory -C eiskaltdcpp-gtk

    cd "${srcdir}/build-gtk3"
    msg2 "Build Eiskaltcpp GTK3 Interface"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=OFF \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=ON \
      -DENABLE_STACKTRACE=ON \
      -DWITH_LUASCRIPTS=ON
    make --no-print-directory -C cmake
    make --no-print-directory -C eiskaltdcpp-gtk

    cd "${srcdir}/build-daemon"
    msg2 "Build Daemon"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=OFF \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=OFF \
      -DENABLE_STACKTRACE=ON \
      -DJSONRPC_DAEMON=ON \
      -DXMLRPC_DAEMON=ON \
      -DUSE_CLI_JSONRPC=OFF \
      -DUSE_CLI_XMLRPC=OFF
    make --no-print-directory -C eiskaltdcpp-daemon

    cd "${srcdir}/build-cli"
    msg2 "Build CLI"
    cmake ../eiskaltdcpp \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_MINIUPNP=ON \
      -DLOCAL_MINIUPNP=ON \
      -DPERL_REGEX=ON \
      -DLOCAL_BOOST=OFF \
      -DLOCAL_JSONCPP=OFF \
      -DLUA_SCRIPT=ON \
      -DWITH_DHT=ON \
      -DUSE_QT=OFF \
      -DUSE_QT5=OFF \
      -DUSE_GTK=OFF \
      -DUSE_GTK3=OFF \
      -DENABLE_STACKTRACE=ON \
      -DJSONRPC_DAEMON=ON \
      -DXMLRPC_DAEMON=ON \
      -DUSE_CLI_JSONRPC=ON \
      -DUSE_CLI_XMLRPC=ON
    make --no-print-directory -C eiskaltdcpp-cli
}

package_eiskaltdcpp-core-git() {
  pkgdesc="EiskaltDC++ Core. (GIT Version)"
  depends=('openssl'
           'lua'
           'libidn'
           'attr'
           'boost-libs'
           #'miniupnpc'
           )
  provides=("eiskaltdcpp-core-git=${pkgver}"
            'eiskaltdcpp-core')
  conflicts=('eiskaltdcpp-core')
  opdepends=('eiskaltdcpp-qt4-git: Qt4 interface'
             'eiskaltdcpp-qt5-git: Qt5 interface'
             'eiskaltdcpp-gtk2-git: GTK2 interface'
             'eiskaltdcpp-gtk3-git: GTK3 onterface'
             'eiskaltdcpp-daemon-git: Daemon and CLI interface')

  make --no-print-directory -C build-core/dcpp DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-qt4-git() {
  pkgdesc="Qt4-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'aspell'
           'qtscriptgenerator'
           )
  optdepends=('php: needed for some scripts')
  provides=("eiskaltdcpp-qt4-git=${pkgver}"
            'eiskaltdcpp-qt4')
  conflicts=('eiskaltdcpp-qt5'
             'eiskaltdcpp-qt4')
  install=eiskaltdcpp-git.install

  make --no-print-directory -C build-qt4/eiskaltdcpp-qt DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-qt5-git() {
  pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'aspell'
           'qt5-quick1'
           'qt5-multimedia'
           'desktop-file-utils'
           )
  optdepends=('php: needed for some scripts')
  provides=("eiskaltdcpp-qt5-git=${pkgver}"
            'eiskaltdcpp-qt5')
  conflicts=('eiskaltdcpp-qt4'
             'eiskaltdcpp-qt5')
  install=eiskaltdcpp-git.install

  make --no-print-directory -C build-qt5/eiskaltdcpp-qt DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-gtk2-git() {
  pkgdesc="Gtk2-based DC and ADC client based for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'gtk2'
           'libnotify'
           'desktop-file-utils'
           )
  conflicts=('eiskaltdcpp-gtk3-git')
  provides=("eiskaltdcpp-gtk2-git=${pkgver}"
            'eiskaltdcpp-gtk2')
  conflicts=('eiskaltdcpp-gtk3'
             'eiskaltdcpp-gtk2')
  install=eiskaltdcpp-git.install

  make --no-print-directory -C build-gtk2/eiskaltdcpp-gtk DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-gtk3-git() {
  pkgdesc="Gtk3-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'gtk3'
           'libnotify'
           'desktop-file-utils'
           )
  provides=("eiskaltdcpp-gtk3-git=${pkgver}"
            'eiskaltdcpp-gtk3')
  conflicts=('eiskaltdcpp-gtk2'
             'eiskaltdcpp-gtk3')
  install=eiskaltdcpp-git.install

  make --no-print-directory -C build-gtk3/eiskaltdcpp-gtk DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-daemon-git() {
  pkgdesc="DC and ADC daemon for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'jsoncpp'
           )
  provides=("eiskaltdcpp-daemon-git=${pkgver}"
            "eiskaltdcpp-cli-git=${pkgver}"
            'eiskaltdcpp-daemon')
  conflicts=('eiskaltdcpp-daemon')

  make --no-print-directory -C build-daemon/eiskaltdcpp-daemon DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-cli-git() {
  arch=('any')
  pkgdesc="CLI interface for EiskaltDC++ Daemon. (GIT Version)"
  depends=("eiskaltdcpp-data-git=${pkgver}"
           'perl-json'
           'perl-json-rpc'
           'perl-rpc-xml'
           'perl-term-shellui'
           )
  provides=("eiskaltdcpp-cli-git=${pkgver}"
            'eiskaltdcpp-cli')
  conflicts=('eiskaltdcpp-cli')

  make --no-print-directory -C build-cli/eiskaltdcpp-cli DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-web-git() {
  arch=('any')
  pkgdesc="Web interface for EiskaltDC++ Daemon. (GIT Version)"
  depends=("eiskaltdcpp-data-git=${pkgver}")
  provides=("eiskaltdcpp-web-git=${pkgver}"
            'eiskaltdcpp-web')
  conflicts=('eiskaltdcpp-web')

  cd eiskaltdcpp/eiskaltdcpp-web
  sh get-js-dependecies local
  find . -type f ! -name get-js-dependecies -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/Eiskaltdcpp-web/"{} \;
}

package_eiskaltdcpp-data-git() {
  arch=('any')
  pkgdesc="EiskaltDC++ common data files. (GIT Version)"
  depends=('bash'
           'hicolor-icon-theme'
           )
  optdepends=('php: needed for some scripts'
              'python: test http server')
  provides=("eiskaltdcpp-data-git=${pkgver}"
            'eiskaltdcpp-data')
  conflicts=('eiskaltdcpp-data')
  install=eiskaltdcpp-git.install

  make --no-print-directory -C build-qt4/data DESTDIR="${pkgdir}" install
  make --no-print-directory -C build-qt5/data DESTDIR="${pkgdir}" install
  make --no-print-directory -C build-gtk2/data DESTDIR="${pkgdir}" install
  make --no-print-directory -C build-gtk3/data DESTDIR="${pkgdir}" install
  make --no-print-directory -C build-daemon/data DESTDIR="${pkgdir}" install
  make --no-print-directory -C build-cli/data DESTDIR="${pkgdir}" install
}
