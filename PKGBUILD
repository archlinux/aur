# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=kpatch
pkgver=0.9.0
pkgrel=1
pkgdesc='Live kernel patching'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
source=(kpatch-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('cd6d98137228e9db84d90e0aa04ddadd3b8174fffc95db0b33412b2fae56d2d8c191eac69bf751e70fa1a1133e0c4d0608fee28c5aefc096c6a4f38cfb739452')

prepare() {
  cd kpatch-$pkgver

  # Fix search structure
  sed -i 's#libexec#lib#g' kpatch-build/kpatch-build

  # Linux 5.2 introduced API changes to the stack trace code
  # The kmod core module hasn't been updated to support them, so it currently doesn't build
  # It's functionality can however be provided by Linux's livepatch API
  # See https://github.com/dynup/kpatch/issues/966
  # Disable kmod for now
  sed -i '3s#kmod ##' Makefile
}

build() {
  cd kpatch-$pkgver
  make
}

package() {
  cd kpatch-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # Remove incompatible init system file
  rm etc/init/kpatch.conf
  rmdir -p etc/init

  cd usr

  # Fix directory structure
  mv local/* .
  rmdir local
  mv lib{exec,}/kpatch
  mv {s,}bin/kpatch
  rmdir libexec sbin

  # Fix file path in systemd service file
  sed -i 's#local/s##' lib/systemd/system/kpatch.service
}
