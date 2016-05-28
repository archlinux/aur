# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-git
_pkgname=usbguard
pkgver=0.4.73.g0afc46a
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libqb-git" "libsodium")
depends=()
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=("${_pkgname}::git+https://github.com/dkopecek/usbguard.git")
sha256sums=('SKIP')
provides=("usbguard")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --enable-systemd --with-bundled-json --with-bundled-spdlog
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make check
}

package() {
	cd "${srcdir}/${_pkgname}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/etc/usbguard
	install -p -m 644 ./dist/usbguard-daemon.conf ${pkgdir}/etc/usbguard/usbguard-daemon.conf
}
