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
pkgver=2.2.10.180.g4c9cbf20
pkgrel=1
pkgdesc="EiskaltDC++: DC and ADC client based on dcpp core. (GIT Version)"
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h')
url='https://github.com/eiskaltdcpp/eiskaltdcpp'
conflicts=('eiskaltdcpp')
options=('!emptydirs')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp.git'
        'git+https://github.com/eiskaltdcpp/eiskaltdcpp-web'
        'esee.patch'
        'jquery.js::https://code.jquery.com/jquery-1.12.4.js'
        'jquery.easytabs.js::https://raw.github.com/JangoSteve/jQuery-EasyTabs/v3.2.0/lib/jquery.easytabs.js'
        'jquery.hashchange.js::https://raw.github.com/pandell/jquery-hashchange/v1.3c/jquery.ba-hashchange.js'
        'jquery.jsonrpc.js::http://raw.github.com/datagraph/jquery-jsonrpc/0.1.1/jquery.jsonrpc.js'
        'jquery.plugin.js::http://raw.github.com/Cyntax/jquery-timer/0.1.1/jquery.plugin.js'
        'jquery.timer.js::http://raw.github.com/Cyntax/jquery-timer/0.1.1/jquery.timer.js'
        'jquery.tablesorter.js::https://raw.github.com/Mottie/tablesorter/v2.29.0/dist/js/jquery.tablesorter.js'
        'require.js::http://requirejs.org/docs/release/2.3.5/comments/require.js'

        )
sha256sums=('SKIP'
            'SKIP'
            'b68a4def7204214d418efabfe130393e6b8481a3b348defeb9050bbb2693fa54'
            '430f36f9b5f21aae8cc9dca6a81c4d3d84da5175eaedcf2fdc2c226302cb3575'
            '5e0da05d396bc6e39c82e524b19aa8357125f68dd2553d453099498572044f10'
            '35a7d71dfcd3f699145ae40b2521f1650052376ddd4126e4234dd98483e0ef8b'
            '54afeb1872a56d9057655b1f7276048d225751b24b95bbc2e68827ba3d6c87f9'
            '39ff6a891680714e2e33453246d22ccd42d364fb6cbb5d11c5ec7360259e6ed3'
            'b3b14d084610ee20a770f30e6379872cc05c00b0df6260a4627aff7430253db6'
            'b1ead7be16de10a75021f4c5483df0a4d086371dbeffda72ed55dfc0b8584df9'
            'baf9f8d5534f43c695340e9a4b56637361543e42aaed9800e92cc5887915831b'
            )
makedepends=('git'
             'cmake'
             'lua'
             'libidn'
             'aspell'
             'attr'
             'wget'
             'boost'
             'pcre'
             'bash'
             'miniupnpc'
             'jsoncpp'
             'qt5-multimedia'
             'qt5-tools'
             'qt5-script'
             'qt5-quick1'
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
}

build() {

  cd "${srcdir}/build"
  cmake ../eiskaltdcpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON \
    -DUSE_QT_QML=ON \
    -DUSE_QT_SQLITE=ON \
    -DUSE_GTK3=ON \
    -DLUA_SCRIPT=ON \
    -DUSE_MINIUPNP=ON \
    -DLOCAL_MINIUPNP=OFF \
    -DUSE_ASPELL=ON \
    -DUSE_LIBNOTIFY=ON \
    -DWITH_LUASCRIPTS=ON \
    -DWITH_SOUNDS=ON \
    -DWITH_DEV_FILES=ON \
    -DUSE_JS=ON \
    -DXMLRPC_DAEMON=OFF \
    -DPERL_REGEX=ON \
    -DENABLE_STACKTRACE=ON \
    -DJSONRPC_DAEMON=ON \
    -DUSE_CLI_XMLRPC=OFF \
    -DUSE_CLI_JSONRPC=ON \
    -DLOCAL_JSONCPP=OFF \
    -DLOCAL_BOOST=OFF

  make
}

package_eiskaltdcpp-core-git() {
  pkgdesc="EiskaltDC++ Core. (GIT Version)"
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
  depends=('openssl'
           'lua'
           'libidn'
           'attr'
           'boost-libs'
           'miniupnpc'
           'pcre'
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
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'aspell'
           'qt5-multimedia'
           'qt5-quick1'
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
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'gtk3'
           'libnotify'
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
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
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
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
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
  pkgdesc="Web interface for EiskaltDC++ Daemon. (GIT Version)"
  pkgver="$(cd eiskaltdcpp-web; echo "1.0-$(git rev-list --count HEAD).$(git rev-parse --short HEAD)")"
  depends=("eiskaltdcpp-daemon-git=${pkgver}"
           'bash'
           )
  provides=('eiskaltdcpp-web')
  conflicts=('eiskaltdcpp-web')
  backcup=('usr/share/webapps/Eiskaltdcpp-web/config.js')

  _lib=('jquery.js'
        'jquery.easytabs.js'
        'jquery.hashchange.js'
        'jquery.jsonrpc.js'
        'jquery.plugin.js'
        'jquery.timer.js'
        'jquery.tablesorter.js'
        'require.js'
        )
  for i in "${_lib[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/webapps/Eiskaltdcpp-web/js/lib/${i}"
  done
  cd eiskaltdcpp-web

  find . -type f ! -name 'get-js-dependecies.sh' -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/Eiskaltdcpp-web/"{} \;

}

package_eiskaltdcpp-data-git() {
  arch=('any')
  pkgdesc="EiskaltDC++ common data files. (GIT Version)"
  pkgver="$(cd eiskaltdcpp; echo "$(git describe --long --tags | tr - . | tr -d v)")"
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
