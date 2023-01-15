# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=grub-customizer
pkgver=5.2.2
pkgrel=2
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
source=(
  https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/${pkgname}_$pkgver.tar.gz
  grub.cfg
)
sha512sums=('382185d38ed7f1bbb90bd77247f8be1796ee20cc857d1c291f14f6c8fc1c9f17a30944145e9ed09f492d15898c0b79a531b1e15a13f2c161353f622b7e083cdd'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')
b2sums=('e2cd7374693980bff8391cf559ef1e28aa25e9249151f2e5923f56a189285d12de383eed1d8c5a931d2dc176ed9fb440c347fe2b2bc6df6cc7e0f6f409a31fc8'
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
