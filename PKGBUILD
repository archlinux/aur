# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer
pkgver=5.2.3
pkgrel=1
pkgdesc="A graphical grub2 settings manager"
url="https://launchpad.net/grub-customizer"
arch=(x86_64)
license=(GPL3)
depends=(
  gcc-libs
  glibc
  grub
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
sha512sums=('aae55c16604e917652f03f080ce733877910e819ca37a35bef4feafef2f4919898169007971e81533f1b578a48975ac672a7c80b1aa75526ba27acb21e308917'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('c385ec6450a43fe497368e1ce584c1f7b0e9b833af6b42277bfd2bd403ebe91aba84db0345f564ffb69bb3d7608ca62afa6de4b081813ec7bbdd4c5a0a703194'
        '549df423c3e3bb4f59632a1122bb247ab0e3fb93de16053f66e44507e84c0638200634df18a92b1161e5c2c6e39ee8c0829b9fdbc422e1531ddba02fc5fc0731')

build(){
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -Wno-dev
    -B build
    -S $pkgname-$pkgver
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
