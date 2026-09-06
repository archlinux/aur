# Maintainer: Jaroslav Bolek <jarris@post.cz>
pkgname=lenovo-legion-linux-toolkit-release
srcname=LenovoLegion
pkgver=1.4.0
pkgrel=1
pkgdesc="Lenovo Legion Linux Toolkit - for Lenovo Legion laptops"
arch=("x86_64")
url="git+https://github.com/bolekjar/lenovo-legion-linux-toolkit.git#tag=release/${pkgver}"
license=('GPL3')
depends=("qt6-base" "qt6-5compat" "dkms" "make" "gcc" "qt6-charts" "protobuf" "cuda" "pkgconf" "rust")
source=("$pkgname-$pkgver::$url")
sha256sums=('SKIP')
install=default.install
qmake=qmake6

package() {

  #prepare directories
  mkdir -p $pkgdir/opt/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/src/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc/modprobe.d/
  mkdir -p $pkgdir/etc/modules-load.d/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/etc/udev/rules.d/


  ln -s $pkgname-$pkgver $pkgdir/opt/$srcname

  #dms driver
  cp $srcdir/$pkgname-$pkgver/$srcname-dkms/* $pkgdir/usr/src/$pkgname-$pkgver

  #settings
  cp $srcdir/$pkgname-$pkgver/$srcname-dkms/blacklist-lenovo-legion.conf $pkgdir/etc/modprobe.d/
  cp $srcdir/$pkgname-$pkgver/$srcname-dkms/lenovo-legion.conf $pkgdir/etc/modules-load.d/
  cp $srcdir/$pkgname-$pkgver/$srcname-dkms/99-rapl-readonly.rules $pkgdir/etc/udev/rules.d
  cp $srcdir/$pkgname-$pkgver/$srcname-dkms/rapl-readonly.sh $pkgdir/opt/$pkgname-$pkgver/
  chmod 755 $pkgdir/opt/$pkgname-$pkgver/rapl-readonly.sh

  #daemon, gui
  $qmake $srcdir/$pkgname-$pkgver/$srcname/ -o $srcdir/$pkgname-$pkgver/$srcname/Makefile
  make -C $srcdir/$pkgname-$pkgver/$srcname/

  #daemon, gui, dkms
  cp -r $srcdir/$pkgname-$pkgver/$srcname/Installation/* $pkgdir/opt/$pkgname-$pkgver
  chmod 777 $pkgdir/opt/$pkgname-$pkgver/log
  chmod 777 $pkgdir/opt/$pkgname-$pkgver/data

  #daemon setings
  cp $srcdir/$pkgname-$pkgver/$srcname/$srcname-Daemon/lenovo-legion-daemon.service $pkgdir/usr/lib/systemd/system/

  #kde menu entry
  cp $srcdir/$pkgname-$pkgver/$srcname/$srcname-Application/LenovoLegion.desktop $pkgdir/usr/share/applications/

  #command line interface
  cargo build --manifest-path $srcdir/$pkgname-$pkgver/lenovo-legion-cli/Cargo.toml -r
  cp $srcdir/$pkgname-$pkgver/lenovo-legion-cli/target/release/lenovo-legion-cli $pkgdir/opt/$pkgname-$pkgver

}
