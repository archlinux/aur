# Based on official plasma-nm PKGBUILD

pkgname=plasma-nm-xor
pkgver=6.6.2
_basepkg=plasma-nm
pkgrel=1
pkgdesc="Plasma applet written in QML for managing network connections (with XOR scramble support)"
arch=(x86_64)
url="https://kde.org/plasma-desktop/"
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kcoreaddons
         kdbusaddons
         kdeclarative
         ki18n
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knotifications
         kquickcharts
         kservice
         ksvg
         kwallet
         kwidgetsaddons
         kwindowsystem
         libnm
         libplasma
         modemmanager-qt
         networkmanager-qt
         plasma-workspace
         prison
         qca-qt6
         qcoro
         qt6-base
         qt6-declarative
         solid)
makedepends=(extra-cmake-modules
             openconnect
             qt6-webengine
             git)
optdepends=("openconnect: Cisco AnyConnect VPN plugin"
            "qrca: QR code scanner"
            "qt6-webengine: Cisco AnyConnect VPN plugin")
provides=(plasma-nm)
conflicts=(plasma-nm)
groups=(plasma)
source=("git+https://github.com/maintuner/plasma-nm-xor.git#branch=master")
sha256sums=("SKIP")

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive

  cd "$_basepkg"
  for patch in ../patches/*.patch
  do
    patch --batch -p1 -F3 < "$patch"
  done
}

build() {
  cmake -B build -S "$srcdir/$pkgname/$_basepkg" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
