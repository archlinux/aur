# Maintainer: Stefan Brand <package@seiichiro0185.org>
pkgname=thunderboltd-git
pkgver=r13.1797ab5
pkgrel=1
pkgdesc="Thunderbolt Daemon from the Intel Thunderbolt Software Userspace"
arch=('x86_64')
url="https://github.com/01org/thunderbolt-software-user-space"
license=('BSD')
depends=('dbus-c++' 'libnl' 'thunderbolt-icm-dkms-git')
makedepends=('git' 'cmake' 'pkgconfig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='thunderboltd-git.install'
source=('thunderboltd::git+https://github.com/01org/thunderbolt-software-user-space.git#branch=fwupdate'
        '001_fix_sysmacros_include.patch'
        '002_disable_postinstall.patch')
md5sums=('SKIP'
         '713ee1db7eea31db2cd5093c615225a3'
         'eb52425947438ed6f7f334bfe48f5066')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p0 -i "$srcdir/001_fix_sysmacros_include.patch"
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  cmake ../ThunderboltService/Linux -DCMAKE_BUILD_TYPE=Release
  patch -p0 -i $srcdir/002_disable_postinstall.patch
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
