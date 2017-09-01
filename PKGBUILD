# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgbase="eiskaltdcpp-git"
pkgname=('eiskaltdcpp-core-git'
         'eiskaltdcpp-qt-git'
         'eiskaltdcpp-gtk-git'
         'eiskaltdcpp-daemon-git'
         'eiskaltdcpp-cli-git'
         'eiskaltdcpp-web-git'
         'eiskaltdcpp-data-git'
         )
pkgver=2.2.10.168.g35edb672
pkgrel=1
pkgdesc="EiskaltDC++: DC and ADC client based on dcpp core. (GIT Version)"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h')
url='http://code.google.com/p/eiskaltdc'
conflicts=('eiskaltdcpp')
options=('!emptydirs')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp.git'
        'esee.patch'
        )
sha256sums=('SKIP'
            'SKIP'
            )
makedepends=('git'
             'cmake'
             'lua'
             'libidn'
             'aspell'
             'attr'
             'wget'
             'boost'
             'miniupnpc'
             'jsoncpp'
             'qt5-multimedia'
             'qt5-tools'
             'qt5-script'
             'gtk3'
             'libnotify'
             'perl-json'
             'perl-json-rpc'
#              'perl-rpc-xml'
#              'perl-term-shellui'
             )

pkgver() {
  cd eiskaltdcpp
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  # Fix php dependency
  find . -type f -name '*.php' -exec sed 's|php5|php|g' -i '{}' \;

  cd eiskaltdcpp
  # Bleh patch for set right version
  patch -p1 -i "${srcdir}/esee.patch"
  # Fix Close the Qt GUI
  git pull --no-edit origin pull/367/head
}

build() {

  cd "${srcdir}/build"
  cmake ../eiskaltdcpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPERL_REGEX=ON \
    -DLOCAL_BOOST=OFF \
    -DLOCAL_JSONCPP=OFF \
    -DLOCAL_MINIUPNP=OFF \
    -DUSE_MINIUPNP=ON \
    -DLUA_SCRIPT=ON \
    -DWITH_LUASCRIPTS=ON \
    -DUSE_JS=ON \
    -DUSE_ASPELL=ON \
    -DWITH_DHT=ON \
    -DWITH_SOUNDS=ON \
    -DUSE_QT=OFF \
    -DUSE_QT5=ON \
    -DUSE_QT_QML=OFF \
    -DUSE_GTK=OFF \
    -DUSE_GTK3=ON \
    -DJSONRPC_DAEMON=ON \
    -DXMLRPC_DAEMON=OFF \
    -DUSE_CLI_JSONRPC=ON \
    -DUSE_CLI_XMLRPC=OFF \
    -DENABLE_STACKTRACE=ON \
    -DWITH_DEV_FILES=ON

  make
}

package_eiskaltdcpp-core-git() {
  pkgdesc="EiskaltDC++ Core. (GIT Version)"
  depends=('openssl'
           'lua'
           'libidn'
           'attr'
           'boost-libs'
           'miniupnpc'
           )
  provides=("eiskaltdcpp-core=${pkgver}")
  conflicts=('eiskaltdcpp-core')
  opdepends=('eiskaltdcpp-qt-git: EiskaltDC++ Qt interface'
             'eiskaltdcpp-gtk-git: EiskaltDC++ GTK interface'
             'eiskaltdcpp-cli-git: EiskaltDC++ CLI interface'
             'eiskaltdcpp-daemon-git: EiskaltDC++ Daemon'
             )

  make -C build/dcpp DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-qt-git() {
  pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'aspell'
           'qt5-multimedia'
           'qt5-script'
           'desktop-file-utils'
           )
  optdepends=('php: needed for some scripts')
  provides=('eiskaltdcpp-qt')
  conflicts=('eiskaltdcpp-qt'
             'eiskaltdcpp-qt4'
             'eiskaltdcpp-qt5'
             )

  make -C build/eiskaltdcpp-qt DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-gtk-git() {
  pkgdesc="Gtk-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'gtk3'
           'libnotify'
           'desktop-file-utils'
           )
  provides=('eiskaltdcpp-gtk')
  conflicts=('eiskaltdcpp-gtk'
             'eiskaltdcpp-gtk2'
             'eiskaltdcpp-gtk3'
             )

  make -C build/eiskaltdcpp-gtk DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-daemon-git() {
  pkgdesc="DC and ADC daemon for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           'jsoncpp'
           )
  provides=('eiskaltdcpp-daemon')
  conflicts=('eiskaltdcpp-daemon')

  make -C build/eiskaltdcpp-daemon DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-cli-git() {
  arch=('any')
  pkgdesc="CLI interface for EiskaltDC++ Daemon. (GIT Version)"
  depends=("eiskaltdcpp-daemon-git=${pkgver}"
           'perl-json'
           'perl-json-rpc'
#            'perl-rpc-xml'
#            'perl-term-shellui'
           )
  provides=('eiskaltdcpp-cli')
  conflicts=('eiskaltdcpp-cli')

  make -C build/eiskaltdcpp-cli DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-web-git() {
  arch=('any')
  depends=("eiskaltdcpp-daemon-git=${pkgver}")
  pkgdesc="Web interface for EiskaltDC++ Daemon. (GIT Version)"
  provides=('eiskaltdcpp-web')
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
              'python: test http server'
              )
  provides=('eiskaltdcpp-data')
  conflicts=('eiskaltdcpp-data')

  make -C build/data DESTDIR="${pkgdir}" install
}
