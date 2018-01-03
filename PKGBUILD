# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard
_pkgname=usbguard
pkgver=0.7.1
pkgrel=2
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libxslt" "asciidoctor" "bash-completion")
depends=("libqb-git" "libsodium" "libcap-ng" "protobuf" "polkit" "qt5-base" "qt5-svg" "qt5-tools" "hicolor-icon-theme" "dbus-glib")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"include.patch")
sha256sums=(
	'f919a4a212d354710a4b7c9ad65a79f6d73e96ad9f2036635aa85eb6742ee12d'
	'659ec3d6749d5417a81bc2f66ee2c1e41f89e1e409416fe6863082dc94640fe9'
	'3a6ddb78a7f5c01a6a83c0a3337dd79a184ecb8a88d3adce1087e8beb4ca9c3f')
validpgpkeys=("430C1928960157CC45FA1BEBAA06120530AE0466")
provides=("usbguard")
conflicts=("usbguard-git")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")
install=usbguard.install

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -f ./usbguard-daemon.conf
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 <../include.patch
	aclocal
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sys=/etc -sbindir=/usr/bin --libdir=/usr/lib \
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
	install -p -m 600 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 600 ./rules.conf "${pkgdir}/etc/usbguard/rules.conf"
}
