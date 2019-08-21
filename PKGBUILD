# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=kpatch-git
pkgver=0.7.1+r40+g6f5edcd
pkgrel=1
pkgdesc='Live kernel patching (git)'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
makedepends=(git)
provides=(kpatch)
conflicts=(kpatch)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd kpatch
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
  cd kpatch

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
  cd kpatch
  make
}

package() {
  cd kpatch
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
