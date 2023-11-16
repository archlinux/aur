# Maintainer: xiota / aur.chaotic.cx
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="nm-tray"
pkgname="$_pkgname"
pkgver=0.5.0
pkgrel=2
pkgdesc='Simple Qt-based frontend for NetworkManager with icon in system tray'
arch=('x86_64')
url='https://github.com/palinek/nm-tray'
license=('GPL')

depends=(
  'networkmanager-qt5'
)
makedepends=(
  'cmake'
  'qt5-tools'
)

if [ x"$pkgname" != x"$_pkgname" ] ; then
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")
fi

_pkgsrc="$pkgname-$pkgver"
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/palinek/nm-tray/archive/$pkgver.tar.gz"
)
sha256sums=(
  '3db9fdfcf274392f040ee2e7370be41aaae5d700277979f661718e6d893c5ff5'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DNM_TRAY_XDG_AUTOSTART_DIR='/etc/xdg/autostart'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
  install -Dm644 "${_pkgsrc:?}/COPYING" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
