# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-nox
pkgver=0.7.4
pkgrel=2
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies without gui'
makedepends=("git" "libxslt" "asciidoctor" "bash-completion")
depends=("libqb" "libsodium" "libcap-ng" "protobuf" "polkit" "dbus-glib")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${url}/releases/download/usbguard-${pkgver}/usbguard-${pkgver}.tar.gz"
	"${url}/releases/download/usbguard-${pkgver}/usbguard-${pkgver}.tar.gz.sig"
	"include.patch")
sha256sums=(
	'732cc99f9b03632eb558941781c01f869bf96aad7f6976998094b3824d9b7ae2'
	'SKIP'
	'3a6ddb78a7f5c01a6a83c0a3337dd79a184ecb8a88d3adce1087e8beb4ca9c3f')
validpgpkeys=("430C1928960157CC45FA1BEBAA06120530AE0466")
provides=("usbguard")
conflicts=("usbguard-git" "usbguard")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")
install=usbguard.install

prepare() {
	cd "${srcdir}/usbguard-${pkgver}"

	patch -p1 <../include.patch
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sys=/etc \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--enable-systemd \
		--with-bundled-catch \
		--with-bundled-pegtl
}

build() {
	cd "${srcdir}/usbguard-${pkgver}"
	make
}

check() {
	cd "${srcdir}/usbguard-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/usbguard-${pkgver}"
	make SYSTEMD_UNIT_DIR="/usr/lib/systemd/system" DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/etc/usbguard"
	install -p -m 600 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 600  /dev/null "${pkgdir}/etc/usbguard/rules.conf"
	install -D -p -m 644 "scripts/usbguard-zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_usbguard"
}
