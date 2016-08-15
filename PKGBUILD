# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard
_pkgname=usbguard
pkgver=0.5.12
pkgrel=2
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libsodium")
depends=("libqb-git")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"disable_json_regression_test.patch")
sha256sums=(
	'fa0281ca8b97d508d6ccfc1e907744be6263735952d1433f3a5e4a0b1bdad794'
	'2cb69c6d6458cdce8da4a6ed08cdf90a2538e55e102401bd84a6bd04f9852ec5'
	'e9fb74e9b892e9956b5208a533595189f5e10da1cb564c5653925bd888b7697b')
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
