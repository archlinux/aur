# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=kpatch-git
pkgver=0.9.9.r7.g8513926
pkgrel=2
pkgdesc='Live kernel patching (git)'
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(bash libelf)
makedepends=(git)
provides=(kpatch)
conflicts=(kpatch)
source=("${pkgname}::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}/"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}/"

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
  cd "${srcdir}/${pkgname}/"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}/"
  make PREFIX=/usr LIBEXEC=lib DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # Remove incompatible init system file
  rm etc/init/kpatch.conf
  rmdir -p etc/init
}
