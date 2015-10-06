# Maintainer:  Swift Geek
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Mateusz Paluszkiewicz <aifam96 at gmail dot com> # Other hacks for repo's target, qt5-wayland-dev-git package
# TODO: more hacks
# TODO: better pkgver()
# TODO: add prepare()

_pkgname=qt5-wayland
pkgname=$_pkgname-git
pkgver=a # If you want to update periodically - use changeling script (AUR) from aur with cron
pkgrel=3
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=("i686" "x86_64")
url="http://code.qt.io/cgit/qt/qtwayland.git/"
license=("GPL3" "LGPL")
depends=("qt5-declarative" "libxcomposite" "wayland")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=("SKIP")

# Definition with userside version of Qt5
_qt5_userversion=`pkg-config --modversion Qt5Core`

if [ -e /var/lib/pacman/local/qt5-base-5* ]; then
  # If you are using repo's qt5, change to the latest minor version
  source=("$_pkgname::git://code.qt.io/qt/qtwayland.git#tag=v${_qt5_userversion}")
else
  # If you are using anything else eg. qt5-base-git, clone the master repo
  source=("$_pkgname::git://code.qt.io/qt/qtwayland.git")
fi

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "${_qt5_userversion}.$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Replace Qt version to user version (Qt)
  sed -i "3s/.*/MODULE_VERSION = ${_qt5_userversion}/" ./.qmake.conf
  if [ -d ./build ]; then
    rm -rf --one-file-system ./build
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  export QT_SELECT=5
  qmake CONFIG+=wayland-compositor ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install
  
  # Install generated private headers (that's its not longer needed)
  # cp ./include/QtCompositor/${_qt5_userversion}/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${pkgdir}/usr/include/qt/QtCompositor/${_qt5_userversion}/QtCompositor/private/
}
