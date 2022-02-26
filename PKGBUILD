# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgbase="eiskaltdcpp-git"
pkgname=('eiskaltdcpp-core-git'
         'eiskaltdcpp-qt-git'
         'eiskaltdcpp-gtk-git'
         'eiskaltdcpp-daemon-git'
         'eiskaltdcpp-cli-git'
         'eiskaltdcpp-data-git'
         )
pkgver=2.4.2.15.g10b1a9b6
pkgrel=1
pkgdesc="EiskaltDC++: DC and ADC client based on dcpp core. (GIT version)"
license=('GPL3')
arch=('x86_64')
url='https://github.com/eiskaltdcpp/eiskaltdcpp'
conflicts=('eiskaltdcpp')
options=('!emptydirs')
makedepends=('git'
             'cmake'
             'lua'
             'libidn2'
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
#              'qt5-quick1'
             'qt5-xmlpatterns'
             'gtk3'
             'libnotify'
             'perl-json-rpc'
#              'perl-rpc-xml'
#              'perl-term-shellui'
             )
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd eiskaltdcpp
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {

  cmake -S eiskaltdcpp -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLUA_SCRIPT=ON \
    -DUSE_QT5=ON \
    -DUSE_QT_QML=OFF \
    -DUSE_QT_SQLITE=ON \
    -DUSE_GTK3=ON \
    -DUSE_MINIUPNP=ON \
    -DUSE_ASPELL=ON \
    -DUSE_LIBNOTIFY=ON \
    -DUSE_JS=ON \
    -DUSE_CLI_XMLRPC=OFF \
    -DUSE_CLI_JSONRPC=ON \
    -DWITH_LUASCRIPTS=ON \
    -DWITH_SOUNDS=ON \
    -DWITH_DEV_FILES=ON \
    -DXMLRPC_DAEMON=OFF \
    -DPERL_REGEX=ON \
    -DENABLE_STACKTRACE=ON \
    -DJSONRPC_DAEMON=ON \
    -DLOCAL_JSONCPP=OFF \
    -DINSTALL_QT_TRANSLATIONS=ON

  cmake --build build
}

package_eiskaltdcpp-core-git() {
  pkgdesc="EiskaltDC++ Core. (GIT Version)"
  depends=('openssl'
           'lua'
           'libidn2'
           'attr'
           'boost-libs'
           'miniupnpc'
           'pcre'
           )
  provides=("eiskaltdcpp-core=${pkgver}"
            'eiskaltdcpp-git'
            )
  conflicts=('eiskaltdcpp-core')
  opdepends=('eiskaltdcpp-qt-git: EiskaltDC++ Qt interface'
             'eiskaltdcpp-gtk-git: EiskaltDC++ GTK interface'
             'eiskaltdcpp-cli-git: EiskaltDC++ CLI interface'
             'eiskaltdcpp-daemon-git: EiskaltDC++ Daemon'
             )

  DESTDIR="${pkgdir}" cmake --build build/dcpp --target install
}

package_eiskaltdcpp-qt-git() {
  pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           "eiskaltdcpp-data-git=${pkgver}"
           'aspell'
           'qt5-multimedia'
#            'qt5-quick1'
           'desktop-file-utils'
           )
  optdepends=('php: needed for some scripts')
  provides=('eiskaltdcpp-qt')
  conflicts=('eiskaltdcpp-qt'
             'eiskaltdcpp-qt4'
             'eiskaltdcpp-qt5'
             )

  DESTDIR="${pkgdir}" cmake --build build/eiskaltdcpp-qt --target install
}

package_eiskaltdcpp-gtk-git() {
  pkgdesc="Gtk-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
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

  DESTDIR="${pkgdir}" cmake --build build/eiskaltdcpp-gtk --target install
}

package_eiskaltdcpp-daemon-git() {
  pkgdesc="DC and ADC daemon for EiskaltDC++ core. (GIT Version)"
  depends=("eiskaltdcpp-core-git=${pkgver}"
           'jsoncpp'
           )
  provides=('eiskaltdcpp-daemon')
  conflicts=('eiskaltdcpp-daemon')

  DESTDIR="${pkgdir}" cmake --build build/eiskaltdcpp-daemon --target install
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

  DESTDIR="${pkgdir}" cmake --build build/eiskaltdcpp-cli --target install
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
