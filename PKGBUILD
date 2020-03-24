# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=kpatch
pkgver=0.9.1
pkgrel=1
pkgdesc='Live kernel patching'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
source=(kpatch-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('38cd5f1a9c12f79b0a38e20c82a3e0bda83145092d343fa7fabb75039366398e1de5130929f36e92a2973f5cc774b11dabd142a3b5546b74cbe39b7fd3d883de')

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
