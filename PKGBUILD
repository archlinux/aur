# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=usbguard-git
_pkgname=usbguard
pkgver=0.6.1.r0.gba94da3
pkgrel=1
license=('GPL2')
pkgdesc='USBGuard is a software framework for implementing USB device authorization policies'
makedepends=("git")
depends=("libqb-git" "libsodium" "gcc-libs-multilib" "libcap-ng" "protobuf" "qt5-base" "hicolor-icon-theme")
arch=("i686" "x86_64")
url='https://github.com/dkopecek/usbguard'
source=("${_pkgname}::git+https://github.com/dkopecek/usbguard.git")
sha256sums=('SKIP')
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
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc -sbindir=/usr/bin --libdir=/usr/lib \
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
	install -p -m 644 ./usbguard-daemon.conf "${pkgdir}/etc/usbguard/usbguard-daemon.conf"
	install -p -m 644 ./rules.conf "${pkgdir}/etc/usbguard/rules.conf"
}
