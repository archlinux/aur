# Contributor: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=kpatch
pkgver=0.9.8
pkgrel=1
pkgdesc='Live kernel patching'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('ab3a771dfcde92a9eee768afcf7fddb6f1ad5ba9e8c7f44d579d258ce9b6ee1722869b1b70c4597ae951b0faf71413efa26a5b135f50308c996b284a9dcee5b7')

prepare() {
  cd $pkgname-$pkgver

  # Fix search structure
  sed -i 's#libexec#lib#g' kpatch-build/kpatch-build

  # Change default bindir
  sed -i 's#SBIN#BIN#g' kpatch/Makefile

  # Fix file path in systemd service file
  sed -i 's#sbin#bin#' contrib/kpatch.service

  # Linux 5.2 introduced API changes to the stack trace code
  # The kmod core module hasn't been updated to support them, so it currently doesn't build
  # It's functionality can however be provided by Linux's livepatch API
  # See https://github.com/dynup/kpatch/issues/966
  # Disable kmod for now
  sed -i '3s#kmod ##' Makefile
}

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr LIBEXEC=lib DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # Remove incompatible init system file
  rm etc/init/kpatch.conf
  rmdir -p etc/init
}
