# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Eric Bélanger <eric at archlinux dot org>
pkgname=hardinfo-git
pkgver=0.6.alpha.1371.gc9d9f9c
pkgrel=1
pkgdesc="A system information and benchmark tool."
arch=('x86_64')
url="https://github.com/lpereira/hardinfo"
license=('GPL2')
depends=('gtk3' 'libsoup')
makedepends=('cmake' 'git' 'setconf')
optdepends=('sysbench' 'fwupd' 'udisks' 'mesa-demos')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('debug' '!strip')
source=('git+https://github.com/lpereira/hardinfo.git')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # ignore odr-violation errors
  setconf "${pkgname%-git}.desktop.cmake" Exec "sh -c 'env ASAN_OPTIONS=detect_odr_violation=0 @CMAKE_INSTALL_FULL_BINDIR@/hardinfo'"
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^release-//;s/^0.5-/0.6-alpha-/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='Debug' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DHARDINFO_GTK3='ON' \
    -DHARDINFO_DEBUG='$(usex debug 1 0)' \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
