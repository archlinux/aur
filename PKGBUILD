# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libmodulemd-git
_pkgname=libmodulemd
pkgver=1.6.1.r5.gefda265
pkgrel=1
pkgdesc="C Library for manipulating module metadata files"
arch=("any")
license=("MIT")
url="https://github.com/fedora-modularity/libmodulemd"
makedepends=("meson" "ninja" "pkgconfig" "python-gobject" "valgrind")
source=("${_pkgname}::git+https://github.com/fedora-modularity/libmodulemd.git")
provides=('libmodulemd')
conflicts=('libmodulemd')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/libmodulemd.//'
}

build() {
  cd "${srcdir}/${_pkgname}"

  [ -d build ] && rm -rf build
  meson build --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--libexecdir="/usr/lib/${_pkgname}" --buildtype=release

  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="$pkgdir" ninja -C build install
}
