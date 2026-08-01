# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer-bin
pkgver=5.2.8
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
backup=(etc/grub-customizer-bin/grub.cfg)
source=(
  https://launchpad.net/grub-customizer-bin/${pkgver%.*}/$pkgver/+download/grub-customizer-bin_$pkgver.tar.gz
  'converter'
  grub.cfg
)
sha512sums=('25d0816d7a8b20a792cf174bf5fd6c546bc69a270ebaedb9f7010a8c9e6fd10627da960c56e191b0f4bf53598dc9784599fc3f53798fcf1cbd8a3c9d6011f6e2'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('1c23cebe961149907fdd9caf51c2583b204c22a6774f455b1fad8a412e4541328d140b92caaaa852b1308e56a43fb19a016adf8fe83da6dd52e29a8d6e4bbe40'
        '549df423c3e3bb4f59632a1122bb247ab0e3fb93de16053f66e44507e84c0638200634df18a92b1161e5c2c6e39ee8c0829b9fdbc422e1531ddba02fc5fc0731')

build(){
  sudo "$srcdir/converter"
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -S grub-customizer-bin-$pkgver
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
  install -vDm 644 grub.cfg -t "$pkgdir/etc/grub-customizer-bin/"
  # additional documentation
  install -vDm 644 grub-customizer-bin-$pkgver/{changelog,README} -t "$pkgdir/usr/share/doc/grub-customizer-bin/"
}

