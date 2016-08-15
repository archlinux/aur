# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-git
_pkgname=usbguard
pkgver=0.5.12.r2.g137829b
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libsodium")
depends=("libqb-git")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${_pkgname}::git+https://github.com/dkopecek/usbguard.git"
	"disable_json_regression_test.patch")
sha256sums=(
	'SKIP'
	'e9fb74e9b892e9956b5208a533595189f5e10da1cb564c5653925bd888b7697b')
provides=("usbguard")
conflicts=("usbguard")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^usbguard-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 <../disable_json_regression_test.patch
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc -sbindir=/usr/bin --libdir=/usr/lib \
	--enable-systemd \
	--with-bundled-json \
	--with-bundled-spdlog \
	--with-bundled-catch \
	--with-bundled-pegtl
  make
	touch rules.conf
}

check() {
  cd "${srcdir}/${_pkgname}"
  make check
}

package() {
	cd "${srcdir}/${_pkgname}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/etc/usbguard
	install -p -m 644 ./usbguard-daemon.conf ${pkgdir}/etc/usbguard/usbguard-daemon.conf
	install -p -m 644 ./rules.conf ${pkgdir}/etc/usbguard/rules.conf
}
