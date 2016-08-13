# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard
_pkgname=usbguard
pkgver=0.5.11
pkgrel=3
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libqb" "libsodium")
depends=()
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"disable_json_regression_test.patch")
sha256sums=(
	'9b156552d169593d91400e9f021ed84c0e83e9eabfa71a985fd1b00a461feee7'
	'c48ade50a9451d1c12a561c0f3565c3923563231dec99834e63931c301037565'
	'644ae1819eaf405091878bdcf78a5f71d7b344346c4e67a24525e4fb442eed4d')
validpgpkeys=("D36B9AB1E6809AF54691C23A3AEF037DB25991BC")
provides=("usbguard")
conflicts=("usbguard-git")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 <../disable_json_regression_test.patch
	rm -f ./usbguard-daemon.conf
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/etc/usbguard
	install -p -m 644 ./usbguard-daemon.conf ${pkgdir}/etc/usbguard/usbguard-daemon.conf
	install -p -m 644 ./rules.conf ${pkgdir}/etc/usbguard/rules.conf
}
