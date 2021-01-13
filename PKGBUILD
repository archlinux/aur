# Maintainer: ars <asav1410 at gmail dot com>
# Contributer: kaptoxic <kaptoxic@yahoo.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgbase="eiskaltdcpp"
pkgname=("${pkgbase}-core"
         "${pkgbase}-qt"
         "${pkgbase}-gtk"
         "${pkgbase}-daemon"
         "${pkgbase}-cli"
         "${pkgbase}-data"
         )
pkgver=2.4.0
pkgrel=1
pkgdesc="EiskaltDC++ is a cross-platform program that uses the Direct Connect (DC aka NMDC) and Advanced Direct Connect (ADC) protocols. It is compatible with DC++, AirDC++, FlylinkDC++ and other DC clients. EiskaltDC++ also interoperates with all common DC hub software."
license=('GPL3')
arch=('x86_64')
url="https://github.com/eiskaltdcpp/eiskaltdcpp/"
conflicts=('eiskaltdcpp-git')
options=(!emptydirs)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/${pkgbase}/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('674d023027a0f00f293cc73ce3c010cf462f8f2a516d967c7e2a8af3ac4b84ba')
makedepends=('cmake'
             'lua'
             'libidn'
             'aspell'
             'attr'
             'boost'
             'pcre'
             'bash'
             'miniupnpc'
             'jsoncpp'
             'qt5-multimedia'
             'qt5-tools'
             'qt5-xmlpatterns'
             'gtk3'
             'libnotify'
             'perl-json'
             'perl-json-rpc'
             )

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../eiskaltdcpp-"${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON \
    -DUSE_QT_QML=OFF \
    -DUSE_QT_SQLITE=ON \
    -DUSE_GTK3=ON \
    -DLUA_SCRIPT=ON \
    -DUSE_MINIUPNP=ON \
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

package_eiskaltdcpp-core() {
  pkgdesc="EiskaltDC++ Core"
  depends=('openssl'
           'lua'
           'libidn'
           'attr'
           'boost-libs'
           'miniupnpc'
           'pcre'
           )
  provides=("${pkgbase}-core=${pkgver}"
            "${pkgbase}"
            )
  conflicts=("${pkgbase}-core-git")
  opdepends=("${pkgbase}-qt: EiskaltDC++ QT interface"
             "${pkgbase}-gtk: EiskaltDC++ GTK interface"
             "${pkgbase}-cli: EiskaltDC++ CLI interface"
             "${pkgbase}-daemon: EiskaltDC++ Daemon"
             )

  make -C build/dcpp DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-qt() {
  pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core."
  depends=("${pkgbase}-core=${pkgver}"
           "${pkgbase}-data=${pkgver}"
           'aspell'
           'qt5-script'
           'qt5-multimedia'
           'desktop-file-utils'
           )
  optdepends=('php: needed for some scripts')
  provides=("${pkgbase}-qt")
  conflicts=("${pkgbase}-qt-git")

  make -C build/eiskaltdcpp-qt DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-gtk() {
  pkgdesc="GTK3-based DC and ADC client for EiskaldDC++ core."
  depends=("${pkgbase}-core=${pkgver}"
           "${pkgbase}-data=${pkgver}"
           'gtk3'
           'libnotify'
           )
  provides=("${pkgbase}-gtk")
  conflicts=("${pkgbase}-gtk-git")

  make -C build/eiskaltdcpp-gtk DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-daemon() {
  pkgdesc="DC and ADC daemon for EiskaltDC++ core."
  depends=("${pkgbase}-core=${pkgver}"
           'jsoncpp'
           )
  provides=("${pkgbase}-daemon")
  conflicts=("${pkgbase}-daemon-git")

  make -C build/eiskaltdcpp-daemon DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-cli() {
  arch=('any')
  pkgdesc="CLI interface for EiskaltDC++ Daemon."
  depends=("${pkgbase}-daemon=${pkgver}"
           'perl-json'
           'perl-json-rpc'
           )
  provides=("${pkgbase}-cli")
  conflicts=("${name}-cli-git")

  make -C build/eiskaltdcpp-cli DESTDIR="${pkgdir}" install
}


package_eiskaltdcpp-data() {
  arch=('any')
  pkgdesc="EiskaltDC++ common data files."
  depends=('bash'
           'hicolor-icon-theme'
           )
  optdepends=('php: needed for some optional scripts'
              'python: test http server'
              )
  provides=("${pkgbase}-data")
  conflicts=("${pkgbase}-data-git")

  make -C build/data DESTDIR="${pkgdir}" install
}
