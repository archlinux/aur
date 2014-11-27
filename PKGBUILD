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
#if [ -e /var/lib/pacman/local/qt5-base-5* ]; then
#  # If you are using repo's qt5
#  source=("$_pkgname::git://gitorious.org/qt/qtwayland.git#commit=374cb3b2872652317baec299712d7dfde6d9c896")
#else
#  # If you are using anything else eg. qt5-base-git
  source=("$_pkgname::git://gitorious.org/qt/qtwayland.git#branch=dev")
#fi
# dev branch should work with last stable in repo
# last working commit - for repo's qt5-base 5.3.x - 374cb3b2872652317baec299712d7dfde6d9c896
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
  mkdir build
  cd build
  export QT_SELECT=5
  if [ -e /var/lib/pacman/local/qt5-base-5* ]; then
    warning "Enabling hacks due to FS#38819. All packages relying on this one will need simlar one\n    (not needed to just run Qt5 apps in wayland)"
    # Repair for Qt5.3.2 past 374cb3b2872652317baec299712d7dfde6d9c896 commit
    if [ ${_qt5_userversion} == "5.3.2" ]
    then
      msg "Repair qwaylandscreen.cpp for Qt 5.3.2"
      sed -i "s/QWindowSystemInterface::handleScreenGeometryChange(screen(), mGeometry, mGeometry);/QWindowSystemInterface::handleScreenGeometryChange(screen(), mGeometry);/" \
        ../src/client/qwaylandscreen.cpp
    fi
    # To reproduce FS#38819 remove QMAKE_LIBS_PRIVATE WHICH IS AN UGLY HACK!
    qmake CONFIG+=wayland-compositor QMAKE_LIBS_PRIVATE+="-lfontconfig -lfreetype -lXrender" ..
  else
    qmake ..
  fi
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install

  # Install generated private headers
  cp ./include/QtCompositor/${_qt5_userversion}/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${pkgdir}/usr/include/qt/QtCompositor/${_qt5_userversion}/QtCompositor/private/
}
