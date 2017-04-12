# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard
_pkgname=usbguard
pkgver=0.7.0
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libxslt")
depends=("libqb-git" "libsodium" "libcap-ng" "protobuf" "polkit" "qt5-base" "qt5-svg" "qt5-tools" "hicolor-icon-theme" "dbus-glib")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"include.patch"
    "disable_usecase-tests.patch")
sha256sums=(
	'1e1485a2b47ba3bde9de2851b371d2552a807047a21e0b81553cf80d7f722709'
	'b1d9bfe555de0c8edac1d83cb3e3e986bb58a0dfcaf9b3c31cd3b45190f3d213'
	'3a6ddb78a7f5c01a6a83c0a3337dd79a184ecb8a88d3adce1087e8beb4ca9c3f'
    '37d4e087b473c33b558724c9438ee26734243db707cc320385872f67e3db3bae')
validpgpkeys=("D36B9AB1E6809AF54691C23A3AEF037DB25991BC")
provides=("usbguard")
conflicts=("usbguard-git")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -f ./usbguard-daemon.conf
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 <../include.patch
    patch -p1 <../disable_usecase-tests.patch
  ./configure --prefix=/usr --sysconfdir=/etc -sbindir=/usr/bin --libdir=/usr/lib \
	--enable-systemd \
	--with-gui-qt=qt5 \
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
	mkdir -p "${pkgdir}/etc/usbguard"
	install -p -m 644 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 644 ./rules.conf "${pkgdir}/etc/usbguard/rules.conf"
}
