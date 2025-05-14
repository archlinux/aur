# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer
pkgver=5.2.5
pkgrel=2
pkgdesc="A graphical grub2 settings manager"
url="https://launchpad.net/grub-customizer"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
  grub
  hicolor-icon-theme
  openssl
)
makedepends=(
  atkmm
  cairomm
  cmake
  glib2
  glibmm
  gtk3
  gtkmm3
  libarchive
  libsigc++
  pangomm
)
optdepends=(
  'hwinfo: for additional hardware information'
  'polkit: for authorization'
  'xorg-xhost: for authorization on xorg-xwayland'
)
backup=(etc/$pkgname/grub.cfg)
source=(
  https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/${pkgname}_$pkgver.tar.gz
  grub.cfg
)
sha512sums=('d4b68ff5ce690d8a03e1c0355f05eed023a08ce42668d822ef88042e4322ff63825a67dbdb64792e028ae0ea0614387b8d5f05a7f26275c19fb19a6ddcb17a27'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('3ea75258a24f93eb3048274c7db25bcce44a44d41a00880953e8e3d6ca082163b1f0398388ce28b878832545b322480b0150687b647ef7cd33e73a22c5938dd0'
        '549df423c3e3bb4f59632a1122bb247ab0e3fb93de16053f66e44507e84c0638200634df18a92b1161e5c2c6e39ee8c0829b9fdbc422e1531ddba02fc5fc0731')

build(){
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package(){
  depends+=(
    atkmm libatkmm-1.6.so
    cairomm libcairomm-1.0.so
    gtk3 libgdk-3.so
    glib2 libglib-2.0.so
    glibmm libglibmm-2.4.so
    gtkmm3 libgtkmm-3.0.so
    libarchive libarchive.so
    libsigc++ libsigc-2.0.so
    pangomm libpangomm-1.4.so
  )

  DESTDIR="$pkgdir" cmake --install build
  # configuration
  install -vDm 644 grub.cfg -t "$pkgdir/etc/$pkgname/"
  # additional documentation
  install -vDm 644 $pkgname-$pkgver/{changelog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
