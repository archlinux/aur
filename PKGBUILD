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
pkgver=a # If you want to update periodically - use changeling script from aur with cron
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=("i686" "x86_64")
url="https://qt-project.org/" # TODO: change this adderess to gitorious?
license=("GPL3" "LGPL")
depends=("qt5-declarative" "libxcomposite")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
if [ -e /var/lib/pacman/local/qt5-base-5* ]; then
# If you are using repo's qt5, change to the latest minor version
#TODO: automate version, perhaps _qt5_userversion?
  source=("$_pkgname::git://gitorious.org/qt/qtwayland.git#branch=5.4.1")
else
  # If you are using anything else eg. qt5-base-git
  source=("$_pkgname::git://gitorious.org/qt/qtwayland.git#branch=dev")
fi
sha256sums=("SKIP")

# Definition with userside version of Qt5
_qt5_userversion=`pkg-config --modversion Qt5Core`

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  cd "$srcdir/$_pkgname"
  # Replace Qt version to user version (Qt)
  sed -i "3s/.*/MODULE_VERSION = ${_qt5_userversion}/" ./.qmake.conf
  if [ -d ./build ]; then
    rm -rf --one-file-system ./build
  fi
  mkdir build
  cd build
  export QT_SELECT=5
  qmake CONFIG+=wayland-compositor ..
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install

  # Install generated private headers
  cp ./include/QtCompositor/${_qt5_userversion}/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${pkgdir}/usr/include/qt/QtCompositor/${_qt5_userversion}/QtCompositor/private/
}
