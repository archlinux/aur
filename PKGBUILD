# Maintainer: Raymundo Cassani <raymundo.cassani@gmail.com>
# Contributor: Hemanth Bollamreddi <blmhemu@gmail.com>

pkgname=opengigabyte-driver-dkms-git
pkgver=v0.0.2.r6.gf4f031f
pkgrel=1
pkgdesc="Open source drivers and utilities for Gigabyte Laptops on GNU/Linux, git edition by fokx"
arch=('any')
url="https://github.com/fokx/opengigabyte"
license=('GPL2')
source=("${pkgname}::git+$url")
install=opengigabyte-driver-dkms-git.install
md5sums=('SKIP')
depends=('dkms' 'udev')
conflicts=('opengigabyte-driver-dkms')
provides=('opengigabyte-driver-dkms')
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "$pkgname"
  git submodule sync --recursive; git submodule foreach -q git config remote.origin.url; git submodule update --init --recursive --remote
}
package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" setup_dkms udev_install
}


