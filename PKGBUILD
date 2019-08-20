# Maintainer: Jean Lucas <jean@4ray.co

pkgname=kpatch
pkgver=0.7.1
pkgrel=1
pkgdesc='Live kernel patching'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
source=(kpatch-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('c1b149e9532dc16ee4f7578aadf3eda73b53c889a055229490a7afd1fca8e6df755c98c938353f937b81679fe8d08e065c473a6c31e588b1eb67f2de56bfddea')

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

  # Remove incompatible init system file
  cd "$pkgdir"
  rm etc/init/kpatch.conf
  rmdir -p etc/init

  # Fix directory structure
  cd usr
  mv local/* .
  rmdir local
  mv lib{exec,}/kpatch
  mv {s,}bin/kpatch
  rmdir libexec sbin
}
