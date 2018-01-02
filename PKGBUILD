# Maintainer: Daniel Albers <daniel@lbe.rs>
# Source: <https://github.com/AlD/archlinux/tree/master/pkgbuilds/quassel>

pkgbase='quassel'
pkgname=("${pkgbase}-git"
         "${pkgbase}-light-git"
         "${pkgbase}-client-git"
         "${pkgbase}-client-light-git"
         "${pkgbase}-core-git"
        )

pkgver=0.12.0.463.g0167e8a2
pkgrel=1
url='http://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm')
makedepends=('git' 'cmake' 'automoc4' 'extra-cmake-modules' 'qt5-tools' 'knotifyconfig')
source=(
  'git+https://github.com/quassel/quassel.git'
 #'git://git.quassel-irc.org/quassel.git'
)
md5sums=('SKIP')

_srcdir="${startdir}/src/${pkgbase}"

_builddir="${startdir}/build"
_cmakecache="CMakeCache.txt"

pkgver() {
  pushd "${srcdir}/${pkgbase}" > /dev/null
  #git describe --always | sed 's/-beta/.0.beta/; s/-/./g;'
  git describe --always | sed 's/-/./g;'
  popd > /dev/null
}

_prepare_build() {
  msg 'Preparing build directory...'
  mkdir -p "$_builddir"
  pushd "$_builddir" > /dev/null
  rm -f "$_cmakecache"
  popd > /dev/null
}

_build() {
  pushd "$_builddir" > /dev/null

  msg 'Compiling...'
  make

  make DESTDIR="$pkgdir" install
}

package_quassel-client-git() {
  depends=('kdebase-runtime')
  pkgdesc='KDE-based distributed IRC client (client only)'
  provides=('quassel-client')
  conflicts=('quassel-client')

  _prepare_build

  pushd "$_builddir" >/dev/null

  msg 'Configuring build options...'
  cmake -DWANT_MONO=OFF             \
        -DWANT_CORE=OFF             \
        -DWANT_QTCLIENT=ON          \
        -DHAVE_SSL=ON               \
        -DWITH_KDE=ON               \
        -DUSE_QT5=ON                \
        -DWITH_WEBKIT=ON            \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$_srcdir"

  popd >/dev/null
  _build
}

package_quassel-client-light-git() {
  pkgdesc='Qt-based distributed IRC client (client only)'
  depends=('qt5-base')
  provides=('quassel-client')
  conflicts=('quassel-client')

  _prepare_build

  pushd "$_builddir" >/dev/null

  msg 'Configuring build options...'
  cmake -DWANT_MONO=OFF             \
        -DWANT_CORE=OFF             \
        -DWANT_QTCLIENT=ON          \
        -DHAVE_SSL=ON               \
        -DWITH_KDE=OFF              \
        -DUSE_QT5=ON                \
        -DWITH_WEBKIT=OFF           \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$_srcdir"

  popd >/dev/null
  _build
}

package_quassel-core-git() {
  pkgdesc='KDE/Qt-based distributed IRC client (core only)'
  depends=('qt5-base' 'qt5-script' 'qca-qt5')
  provides=('quassel-core')
  conflicts=('quassel-core')

  _prepare_build

  pushd "$_builddir" >/dev/null

  msg 'Configuring build options...'
  cmake -DWANT_MONO=OFF             \
        -DWANT_CORE=ON              \
        -DWANT_QTCLIENT=OFF         \
        -DHAVE_SSL=ON               \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT5=ON                \
        "$_srcdir"

  popd >/dev/null
  _build
}

package_quassel-git() {
  pkgdesc='KDE-based IRC client (monolithic version)'
  depends=('kdebase-runtime')

  _prepare_build

  pushd "$_builddir" >/dev/null

  msg 'Configuring build options...'
  cmake -DWANT_MONO=ON              \
        -DWANT_CORE=OFF             \
        -DWANT_QTCLIENT=OFF         \
        -DHAVE_SSL=ON               \
        -DWITH_KDE=ON               \
        -DUSE_QT5=ON                \
        -DWITH_WEBKIT=ON            \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$_srcdir"

  popd >/dev/null
  _build
}

package_quassel-light-git() {
  pkgdesc='Qt-based IRC client (monolithic version)'
  depends=('qt5-base' 'qt5-script' 'qca-qt5')
  _prepare_build

  pushd "$_builddir" >/dev/null

  msg 'Configuring build options...'
  cmake -DWANT_MONO=ON              \
        -DWANT_CORE=OFF             \
        -DWANT_QTCLIENT=OFF         \
        -DHAVE_SSL=ON               \
        -DWITH_KDE=OFF              \
        -DUSE_QT5=ON                \
        -DWITH_WEBKIT=OFF           \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$_srcdir"

  popd >/dev/null
  _build
}
