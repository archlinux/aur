# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-git
_pkgname=usbguard
pkgver=0.7.4.r39.gbd23790
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git" "libxslt" "asciidoctor" "bash-completion")
depends=("libqb" "libsodium" "libcap-ng" "protobuf" "polkit" "qt5-base" "qt5-svg" "qt5-tools" "hicolor-icon-theme" "dbus-glib")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=(
	"${_pkgname}::git+https://github.com/dkopecek/usbguard.git"
	"include.patch")
sha256sums=(
	'SKIP'
	'3a6ddb78a7f5c01a6a83c0a3337dd79a184ecb8a88d3adce1087e8beb4ca9c3f')
provides=("usbguard")
conflicts=("usbguard")
backup=(
	"etc/usbguard/usbguard-daemon.conf"
	"etc/usbguard/rules.conf")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/^usbguard-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
}

build() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 <../include.patch
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sys=/etc -sbindir=/usr/bin --libdir=/usr/lib \
	--enable-systemd \
	--with-gui-qt=qt5 \
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
	mkdir -p "${pkgdir}/etc/usbguard"
	install -p -m 644 -D ./scripts/usbguard-zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_usbguard"
	install -p -m 600 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 600 ./rules.conf "${pkgdir}/etc/usbguard/rules.conf"
}
