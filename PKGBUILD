# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgbase=eiskaltdcpp-git
pkgname=(
  'eiskaltdcpp-common-git'
  'eiskaltdcpp-qt-git'
  'eiskaltdcpp-gtk-git' # https://github.com/eiskaltdcpp/eiskaltdcpp/issues/437
  'eiskaltdcpp-daemon-git'
  'eiskaltdcpp-cli-git'
)
pkgver=2.4.2.82.g697db4b0
pkgrel=1
pkgdesc="EiskaltDC++: DC and ADC client based on dcpp core. (GIT version)"
license=('GPL3')
arch=('x86_64')
url='https://github.com/eiskaltdcpp/eiskaltdcpp'
conflicts=('eiskaltdcpp')
options=('!emptydirs')
makedepends=(
  'git'
  'cmake'
  'lua'
  'libidn2'
  'aspell'
  'attr'
  'wget'
  'pcre2'
  'bash'
  'miniupnpc'
  'jsoncpp'
  'qt5-base'
  'qt5-multimedia'
  'qt5-tools'
  'qt5-script'
#  'qt5-quick1'
  'qt5-xmlpatterns'
  'gtk3'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'libnotify'
  'perl-json-rpc'
  'perl-term-shellui'
#  'perl-rpc-xml'
  'bzip2'
  'openssl'
  'zlib'
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
    -DXMLRPC_DAEMON=OFF \
    -DJSONRPC_DAEMON=ON \
    -DLOCAL_JSONCPP=OFF \
    -DUSE_CLI_XMLRPC=OFF \
    -DUSE_CLI_JSONRPC=ON \
    -DWITH_LUASCRIPTS=ON \
    -DWITH_SOUNDS=ON \
    -DWITH_DEV_FILES=ON \
    -DPERL_REGEX=ON \
    -DENABLE_STACKTRACE=ON \
    -DINSTALL_QT_TRANSLATIONS=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build
}

package_eiskaltdcpp-common-git() {
  pkgdesc="EiskaltDC++ Core. (GIT Version)"
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # libc.so
    'openssl' 'libcrypto.so' 'libssl.so'
    'lua' # liblua.so
    'libidn2' 'libidn2.so'
    'attr'
    'miniupnpc' 'libminiupnpc.so'
    'pcre2' 'libpcre2-8.so'
    'libbz2.so' 'bzip2'
    'bzip2' 'libbz2.so'
    'zlib' 'libz.so'
    'bash'
    'hicolor-icon-theme'
  )
  provides=(
    "eiskaltdcpp-common=${pkgver}"
    'eiskaltdcpp-git'
    'libeiskaltdcpp.so'
  )
  conflicts=(
    'eiskaltdcpp-common'
    'eiskaltdcpp-core'
    'eiskaltdcpp-data'
  )
  opdepends=(
    'eiskaltdcpp-qt-git: EiskaltDC++ Qt interface'
    'eiskaltdcpp-gtk-git: EiskaltDC++ GTK interface'
    'eiskaltdcpp-cli-git: EiskaltDC++ CLI interface'
    'eiskaltdcpp-daemon-git: EiskaltDC++ Daemon'
    'php: needed for some scripts'
  )

  DESTDIR="${pkgdir}" cmake --install build/dcpp
  make -C build/data DESTDIR="${pkgdir}" install
}

package_eiskaltdcpp-qt-git() {
  pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=(
    "eiskaltdcpp-common-git=${pkgver}" 'libeiskaltdcpp.so'
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # libc.so libm.so
    'aspell' 'libaspell.so'
    'qt5-base' # libQt5Concurrent.so libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Sql.so libQt5Widgets.so libQt5Xml.so
    'qt5-multimedia' # libQt5Multimedia.so
    'qt5-script' # libQt5Script.so
#    'qt5-quick1'
  )
  optdepends=('php: needed for some scripts')
  provides=('eiskaltdcpp-qt')
  conflicts=(
    'eiskaltdcpp-qt'
    'eiskaltdcpp-qt4'
    'eiskaltdcpp-qt5'
  )

  DESTDIR="${pkgdir}" cmake --install build/eiskaltdcpp-qt
}

package_eiskaltdcpp-gtk-git() {
  pkgdesc="Gtk-based DC and ADC client for EiskaltDC++ core. (GIT Version)"
  depends=(
    "eiskaltdcpp-common-git=${pkgver}" 'libeiskaltdcpp.so'
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # libc.so libm.so
    'gtk3' 'libgdk-3.so' 'libgtk-3.so'
    'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
    'glib2' 'libglib-2.0.so' 'libgobject-2.0.so'
    'libnotify' 'libnotify.so'
    'pango' 'libpango-1.0.so'
  )
  provides=('eiskaltdcpp-gtk')
  conflicts=(
    'eiskaltdcpp-gtk'
    'eiskaltdcpp-gtk2'
    'eiskaltdcpp-gtk3'
  )

  DESTDIR="${pkgdir}" cmake --install build/eiskaltdcpp-gtk
}

package_eiskaltdcpp-daemon-git() {
  pkgdesc="DC and ADC daemon for EiskaltDC++ core. (GIT Version)"
  depends=(
    "eiskaltdcpp-common-git=${pkgver}" 'libeiskaltdcpp.so'
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # libc.so
    'jsoncpp' 'libjsoncpp.so'
  )
  provides=('eiskaltdcpp-daemon')
  conflicts=('eiskaltdcpp-daemon')

  DESTDIR="${pkgdir}" cmake --install build/eiskaltdcpp-daemon
}

package_eiskaltdcpp-cli-git() {
  arch=('any')
  pkgdesc="CLI interface for EiskaltDC++ Daemon. (GIT Version)"
  depends=(
    "eiskaltdcpp-daemon-git=${pkgver}"
    'perl-json'
    'perl-json-rpc'
    'perl-term-shellui'
#    'perl-rpc-xml'
  )
  provides=('eiskaltdcpp-cli')
  conflicts=('eiskaltdcpp-cli')

  DESTDIR="${pkgdir}" cmake --install build/eiskaltdcpp-cli
}
