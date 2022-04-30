# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer
pkgver=5.2.1
pkgrel=1
pkgdesc="A graphical grub2 settings manager"
url="https://launchpad.net/grub-customizer"
arch=(x86_64)
license=(GPL3)
depends=(gcc-libs glibc grub gtkmm3 openssl)
makedepends=(atkmm cairomm cmake glib2 glibmm gtk3 libarchive libsigc++
pangomm)
optdepends=(
  'hwinfo: for additional hardware information'
  'polkit: for authorization'
  'xorg-xhost: for authorization on xorg-xwayland'
)
backup=(etc/$pkgname/grub.cfg)
options=(debug)
source=(
  https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/${pkgname}_$pkgver.tar.gz
  grub.cfg
)
sha512sums=('7b26e21a1aaa953b0c60be6a3a52ac40c15746cbda43cfded5d1e93c93483438c9292aa0ad2d10d1f4ed3a2aa8c18f2f68ea07c8860d71c5f2d3e5ef7d82ecc9'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('f5b3a754b0aa80edc9e8be31e6b71a416cc148d928b9c6e9225ad8b55c85ff4d38531059a35dbf8a2b71ee899463186bc9a43769623f190801e43851be66aa42'
        '549df423c3e3bb4f59632a1122bb247ab0e3fb93de16053f66e44507e84c0638200634df18a92b1161e5c2c6e39ee8c0829b9fdbc422e1531ddba02fc5fc0731')

build(){
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -B build \
        -S $pkgname-$pkgver
  make VERBOSE=1 -C build
}

package(){
  depends+=(libarchive.so libatkmm-1.6.so libcairomm-1.0.so libgdk-3.so
  libglib-2.0.so libglibmm-2.4.so libgtkmm-3.0.so libpangomm-1.4.so
  libsigc-2.0.so)

  make install DESTDIR="${pkgdir}" -C build
  # configuration
  install -vDm 644 grub.cfg -t "$pkgdir/etc/$pkgname/"
  # additional documentation
  install -vDm 644 $pkgname-$pkgver/{changelog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
